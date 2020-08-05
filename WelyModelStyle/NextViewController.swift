//
//  NextViewController.swift
//  WelyModelStyle
//
//  Created by ZR on 2020/8/5.
//  Copyright © 2020 wely. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    private  var pullToDismissInteractive:PullToDismissInteractive!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        transitioningDelegate = self
        pullToDismissInteractive = PullToDismissInteractive(self, self.view)
    }

    deinit {

        debugPrint("页面销毁")
    }

}

extension NextViewController:UIViewControllerTransitioningDelegate{
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return pullToDismissInteractive
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAndDismissTransition(false)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAndDismissTransition(true)
    }

    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {

        return nil
    }

}


