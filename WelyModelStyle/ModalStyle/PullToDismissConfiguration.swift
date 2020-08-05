//
//  PullToDismissConfiguration.swift
//  WelyModelStyle
//
//  Created by ZR on 2020/8/5.
//  Copyright © 2020 wely. All rights reserved.
//

import Foundation
import UIKit


public struct PullToDismissConfiguration:WelyBaseConfiguration,HorizontalAndPortraitType,DefinitionVcFrame{
    public var duration: WelyConstants.Duration = .normal

    public var cornerRadius: Double = 0.0

    public var presentationCurve: WelyConstants.WelyCurve = .easeInEaseOut

    public var dismissCurve: WelyConstants.WelyCurve = .liner

    public var backgroudStlye: WelyConstants.BackgroudStyle = .customDark(alpha: 0.5)

    public var isTapBackToDismissEnabled: Bool = true

    public var corners: UIRectCorner = [.topLeft,.topRight,.bottomLeft,.bottomRight]

    public var verticalType: WelyConstants.VerticalAlignment = .center

    public var horizontalType: WelyConstants.HorizontalAlignment = .center


    public var widthForVC: WelyConstants.ContainsSize = .halfScreen

    public var hightForVC: WelyConstants.ContainsSize = .halfScreen

    public var marginGuards: UIEdgeInsets =  .zero

    //弹出方向
    public var  directionShow:WelyConstants.Direction = .bottom
    public var directionDimiss:WelyConstants.Direction = .bottom
    // 动画  阻尼
    public var animationCeffion:WelyConstants.Animationness = .none

    public init(){}



}

