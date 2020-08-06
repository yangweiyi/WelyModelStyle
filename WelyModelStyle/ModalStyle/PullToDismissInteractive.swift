//
//  PullToDismissInteractive.swift
//  WelyModelStyle
//
//  Created by ZR on 2020/8/6.
//  Copyright © 2020 wely. All rights reserved.
//

import UIKit


public class PullToDismissInteractive: UIPercentDrivenInteractiveTransition {

    private weak var intervavtiveView: UIView! // 当前模态VC的view
    private weak var presentedVC: UIViewController! // 当前模态VC
    public var completion: (() -> Void)? // 完成后处理事件,没有用到则不调用
    private let thredhold: CGFloat = 0.4
    
    convenience public init(_ presented: UIViewController, _ baseView: UIView, _ success: (() -> Void)? = nil) {
        self.init()

        presentedVC = presented
        intervavtiveView = baseView
        completion = success
        setUpPanGestureFunc()
        wantsInteractiveStart = false
    }
    fileprivate func setUpPanGestureFunc() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanFunc(_:)))

        panGesture.maximumNumberOfTouches = 1
        panGesture.delegate = self
        intervavtiveView.addGestureRecognizer(panGesture)
    }
    // 滑动事件
    @objc func handlePanFunc(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            print("began")
            sender.setTranslation(.zero, in: intervavtiveView)
            wantsInteractiveStart = true
            self.presentedVC.dismiss(animated: true, completion: nil)
        case .changed:
            print("changed")
            let translation =  sender.translation(in: intervavtiveView)
            guard translation.y > 0 else {
                sender.setTranslation(.zero, in: intervavtiveView)
                return
            }
            let percenteage =  abs(translation.y/intervavtiveView.frame.height)
            update(percenteage)
        case .ended:
            print("ended")

            if percentComplete >= thredhold {
                finish()
            } else {
                wantsInteractiveStart = false
                cancel()
            }
        case .cancelled,.failed:
            print("cancelled || failed")
            wantsInteractiveStart = false
            cancel()
        default:
            wantsInteractiveStart = false
            return
        }
    }
}

extension PullToDismissInteractive: UIGestureRecognizerDelegate {

    // 用于区分点击对象  兼容scrollerView 的情况 同时识别手势的情况
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {


//        guard let scrollView = otherGestureRecognizer.view as? UIScrollView else {
//            return false
//        }
//        guard scrollView.contentOffset.y <= 0 else {
//            return false
//        }
//        return true
        if let scrollView = otherGestureRecognizer.view as? UIScrollView {
            if scrollView.contentOffset.y <= 0 {
                return true
            } else {
                return false
            }
        }

        return true

    }
}
