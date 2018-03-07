//
//  UIViewExtension.swift
//  KSAnimationDemo
//
//  Created by Yudiz on 26/02/18.
//  Copyright © 2018 Yudiz. All rights reserved.
//

import UIKit

//CompletionBlock
typealias CompletionBlock = (() -> ())

//MARK:- Animation Related
extension UIView {
    
    /*
     Parameters:
        - withType: Animations array to perform on the animation block.
        - reversed: Initial state of the animation. Reversed will start from its original position.
        - initialAlpha: Initial alpha of the view prior to the animation.
        - finalAlpha: View's alpha after the animation.
        - delay: Time Delay before the animation.
        - duration: TimeInterval the animation takes to complete.
        - animationInterval: TimeInterval between each of the subviews animations.
        - backToOriginalForm: View will restore to its identity.
        - completion: CompletionBlock after the animation finishes.
     */
    func animate(withType: [AnimationType], reversed: Bool = false, initialAlpha: CGFloat = 0.0, finalAlpha: CGFloat = 1.0, delay: Double = 0.0, duration: TimeInterval = AnimationConfiguration.duration, backToOriginalForm: Bool = false, completion: CompletionBlock? = nil) {
        
        let transformFrom = transform
        var transformTo = transform
        
        withType.forEach { (viewTransform) in
            transformTo = transformTo.concatenating(viewTransform.initialTransform)
        }
        
        if reversed == false {
            transform = transformTo
        }
        
        alpha = initialAlpha
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            UIView.animate(withDuration: duration, delay: delay, options: [.curveLinear, .curveEaseInOut], animations: { [weak self] in
                self?.transform = reversed == true ? transformTo : transformFrom
                self?.alpha = finalAlpha
            }, completion: { (_) in
                completion?()
                if backToOriginalForm == true {
                    UIView.animate(withDuration: 0.35, delay: 0.0, options: [.curveLinear, .curveEaseInOut], animations: { [weak self] in
                        self?.transform = .identity
                    }, completion: nil)
                }
            })
        }
    }
    
    /*
     Parameters:
        - withType: Animations to perform.
        - interval: Interval of the animations between subviews.
    */
    func animateAll(withType: [AnimationType], interval: Double = AnimationConfiguration.interval) {
        for(index, value) in subviews.enumerated() {
            let delay = Double(index) * interval
            value.animate(withType: withType, delay: delay)
        }
    }
    
    /*
     Parameter
        - interval: Interval of the animations between subviews.
    */
    func animationRandom(interval: Double = AnimationConfiguration.interval) {
        for(index, value) in subviews.enumerated() {
            let delay = Double(index) * interval
            let animationRandom = AnimationType.random()
            value.animate(withType: [animationRandom], delay: delay)
        }
    }
    
    //It will restore all subview to it's identity
    func restoreAllViewToIdentity() {
        for(_, value) in subviews.enumerated() {
            value.transform = CGAffineTransform.identity
        }
    }
}
