//
//  PullToDismissAnimator.swift
//  WelyModelStyle
//
//  Created by ZR on 2020/8/4.
//  Copyright © 2020 wely. All rights reserved.
//

import Foundation
import UIKit
import UIKit




public class PullToDismissAnimator: NSObject {

    let direction: WelyConstants.Direction
    let prensentationType: WelyConstants.PresentationType
    let baseCog: PullToDismissConfiguration

    public init(baseDirection: WelyConstants.Direction, basePresentaionType: WelyConstants.PresentationType, cong: PullToDismissConfiguration) {
        self.direction = baseDirection
        self.prensentationType = basePresentaionType
        self.baseCog = cong
        super.init()
    }
}

extension PullToDismissAnimator: UIViewControllerAnimatedTransitioning {
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return baseCog.duration.rawValue
    }
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        guard let toViewController = transitionContext.viewController(forKey: .to), let fromViewController = transitionContext.viewController(forKey: .from) else {
            return
        }
        if self.prensentationType == .show {
            //Present
            transitionContext.containerView.addSubview(toViewController.view)
            UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: [.curveEaseOut], animations: {
                    toViewController.view.frame.origin.y = -UIScreen.main.bounds.size.height
                }) { (_) in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        } else {
            //Dismiss
            let fromViewSnpaShot = fromViewController.view.snapshotView(afterScreenUpdates: false)
            if let fromViewSnpaShot = fromViewSnpaShot {
                fromViewController.view.isHidden = true
                fromViewSnpaShot.frame = fromViewController.view.frame
                transitionContext.containerView.addSubview(fromViewSnpaShot)
            }
            UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, options: [.curveLinear], animations: {
                    fromViewSnpaShot?.frame.origin.y = UIScreen.main.bounds.size.height
                }) { (_) in
                fromViewSnpaShot?.removeFromSuperview()
                fromViewController.view.isHidden = false
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
        }
    }
}
