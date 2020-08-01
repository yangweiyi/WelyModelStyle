//
//  AppDelegate.swift
//  WelyModelStyle
//
//  Created by ZR on 2020/8/1.
//  Copyright © 2020 wely. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController =  ViewController()
        window?.makeKeyAndVisible()
        return true
    }


}

