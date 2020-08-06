//
//  BaseAnimator.swift
//  ZRMedical
//
//  Created by ywy on 2020/2/12.
//  Copyright © 2020 wely. All rights reserved.
//

import Foundation
import UIKit

public class BaseAnimator: NSObject {

    fileprivate var baseConfiguration: BaseConfiguration
    fileprivate var pullToDimissInteractive: PullToDismissInteractive?

    public init(baseCong: BaseConfiguration) {
        self.baseConfiguration = baseCong
        super.init()
    }
    // prepare  设置对应的  代理
    public func prepaerFunc(currentViewController: UIViewController, _ basePullToDismiss: PullToDismissInteractive? = nil) {
        currentViewController.modalPresentationStyle = .custom
        currentViewController.transitioningDelegate = self
        pullToDimissInteractive = basePullToDismiss
    }

}

extension BaseAnimator: UIViewControllerTransitioningDelegate {
    // ios  10.0  使用  暂不使用
    //    public func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
    //    }

    //     如果模态方式是自定义的  且设置了transitionDelegate  则从UIKit 调用
    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let baseVc = PresentationController(presentedViewController: presented, presenting: presenting, baseConfig: self.baseConfiguration)
        return baseVc
    }
    // 模态弹出
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if let slideInCong = baseConfiguration as? SlideInConfiguration {
            return SlideInAnimator(baseDirection: slideInCong.directionShow, basePresentaionType: .show, cong: slideInCong)
        } else if let fadeInCong = baseConfiguration as? FadeInConfiguration {
            return FadeInAnimator(basePresentationType: .show, cong: fadeInCong)
        } else if let shifInCong = baseConfiguration as? ShiftInConfiguration {
            return ShiftInAnimator(baseDirection: shifInCong.direction, basePresentationType: .show, cong: shifInCong)
        } else if let pullToDismiss = baseConfiguration as? PullToDismissConfiguration {
            print("dimiss pullPresent")
            return PullToDismissAnimator(baseDirection: pullToDismiss.directionShow, basePresentaionType: .show, cong: pullToDismiss)
        } else {
            return nil
        }

    }
    // 模态dismiss
    public func animationController(forDismissed dismissed: UIViewController)
        -> UIViewControllerAnimatedTransitioning? {
            if let slideInCong = baseConfiguration as? SlideInConfiguration {
                return SlideInAnimator(baseDirection: slideInCong.directionDimiss, basePresentaionType: .dismiss, cong: slideInCong)
            } else if let fadeInCong = baseConfiguration as? FadeInConfiguration {
                return FadeInAnimator(basePresentationType: .dismiss, cong: fadeInCong)
            } else if let shifInCong = baseConfiguration as? ShiftInConfiguration {
                return ShiftInAnimator(baseDirection: shifInCong.direction, basePresentationType: .dismiss, cong: shifInCong)
            } else if let pullToDismiss = baseConfiguration as? PullToDismissConfiguration {
                print("dimiss pullToDismiss")
                return PullToDismissAnimator(baseDirection: pullToDismiss.directionShow, basePresentaionType: .dismiss, cong: pullToDismiss)
            } else {
                return nil
            }
    }

    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {

        return pullToDimissInteractive ?? nil
    }

    // 弹出动画
    public func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {

        return nil
    }



}
