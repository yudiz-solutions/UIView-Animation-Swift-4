//
//  AnimationType.swift
//  KSAnimationDemo
//
//  Created by Yudiz on 27/02/18.
//  Copyright © 2018 Yudiz. All rights reserved.
//

import UIKit

//MARK:- AnimationType
enum AnimationType {
    
    case from(direction: AnimationDirectionType, offSet: CGFloat)
    case zoom(scale: CGFloat)
    case rotate(angle: CGFloat)
    
    var initialTransform: CGAffineTransform {
        switch self {
        case .from(direction: let direction, offSet: let offSet):
            let positive = direction.isPositive
            if direction.isVertical {
                return CGAffineTransform(translationX: 0, y: offSet * positive)
            }
            return CGAffineTransform(translationX: offSet * positive, y: 0)
        case .zoom(scale: let scale):
            return CGAffineTransform(scaleX: scale, y: scale)
        case .rotate(angle: let angle):
            return CGAffineTransform(rotationAngle: angle)
        }
    }
    
    //Generated random animation.
    static func random() -> AnimationType {
        let index = Int(arc4random_uniform(3))
        if index == 1 {
            return AnimationType.from(direction: AnimationDirectionType.random(),
                                      offSet: AnimationConfiguration.offset)
        } else if index == 2 {
            let scale = Double.random(min: 0, max: AnimationConfiguration.maxZoomScale)
            return AnimationType.zoom(scale: CGFloat(scale))
        }
        let angle = CGFloat.random(min: -AnimationConfiguration.maxRotationAngle, max: AnimationConfiguration.maxRotationAngle)
        return AnimationType.rotate(angle: angle)
    }
}
