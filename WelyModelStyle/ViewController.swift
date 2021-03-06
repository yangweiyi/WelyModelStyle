//
//  ViewController.swift
//  WelyModelStyle
//
//  Created by ZR on 2020/8/1.
//  Copyright © 2020 wely. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var welyBaseAntion: BaseAnimator?

    lazy var centButton: UIButton = {
        let centBtn = UIButton(type: .custom)
        centBtn.setTitle("跳转页面", for: .normal)
        centBtn.setTitleColor(.black, for: .normal)
        centBtn.addTarget(self, action: #selector(parentVCFunc), for: .touchUpInside)
        return centBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        view.addSubview(centButton)
        
        centButton.snp.makeConstraints { (maker) in
            maker.center.equalToSuperview()
            maker.height.equalTo(40)
            maker.width.equalTo(200)
        }
    }
    
    @objc func parentVCFunc() {
        var slideCong = PullToDismissConfiguration()
        slideCong.widthForVC = WelyConstants.ContainsSize.fullScreen
        slideCong.hightForVC = WelyConstants.ContainsSize.custom(value: 500)
        slideCong.directionShow = .bottom
        slideCong.directionDimiss = .bottom
        slideCong.verticalType = .bottom
        slideCong.backgroudStlye = .customDark(alpha: 0.3)
        self.welyBaseAntion = BaseAnimator(baseCong: slideCong)
        let nextVC  = NextViewController()
//        nextVC.modalPresentationStyle = .custom
        self.welyBaseAntion?.prepaerFunc(currentViewController: nextVC, PullToDismissInteractive(nextVC, nextVC.view))
        self.present(nextVC, animated: true, completion: nil)
    }

}

