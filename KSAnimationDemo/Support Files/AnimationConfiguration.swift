//
//  AnimationConfiguration.swift
//  KSAnimationDemo
//
//  Created by Yudiz on 26/02/18.
//  Copyright © 2018 Yudiz. All rights reserved.
//

import UIKit

//MARK:- AnimationConfiguration
class AnimationConfiguration {
    
    static var offset: CGFloat = 30.0
    
    //Duration of the animation.
    static var duration: Double = 0.35
    
    //Interval for animations handling multiple views that need to be animated one after the other and not at the same time.
    static var interval: Double = 0.035
    
    static var maxZoomScale: Double = 2.0
    
    //Maximum rotation (left or right)
    static var maxRotationAngle: CGFloat = .pi / 4
    
}
