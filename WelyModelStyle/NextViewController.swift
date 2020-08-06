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

    lazy var dismissButton: UIButton = {
        let disBtn =  UIButton(type: .custom)
        disBtn.setTitle("dismiss", for: .normal)
        disBtn.setTitleColor(.black, for: .normal)
        disBtn.addTarget(self, action: #selector(dismissFunc), for: .touchUpInside)
        return disBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(dismissButton)

//        self.transitioningDelegate = self
//        pullToDismissInteractive = PullToDismissInteractive(self, self.view)
        dismissButton.snp.makeConstraints { (maker) in
            maker.center.equalToSuperview()
            maker.width.equalTo(200)
            maker.height.equalTo(50)
        }

    }

    @objc func dismissFunc(){
        self.dismiss(animated: true, completion: nil)
    }
    deinit {
        debugPrint("页面销毁")
    }
}



