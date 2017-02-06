//
//  CoberCircleView3.swift
//  MicroInteractions
//
//  Created by mitchell hudson on 1/28/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class CoberCircleView3: UIView {

    let coverLayer = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        isUserInteractionEnabled = true
        
        let containerLayer = CALayer()
        containerLayer.frame = bounds
        layer.addSublayer(containerLayer)
        containerLayer.masksToBounds = true
        
        containerLayer.addSublayer(coverLayer)
        layer.cornerRadius = 10
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 6
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.backgroundColor = UIColor.white.cgColor
        
        coverLayer.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        coverLayer.backgroundColor = UIColor.cyan.cgColor
        coverLayer.cornerRadius = 40
        coverLayer.opacity = 0
        // coverLayer.actions
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap(tap:)))
        addGestureRecognizer(tap)
    }
    
    func onTap(tap: UITapGestureRecognizer) {
        let location = tap.location(in: self)
        
        
        CATransaction.setDisableActions(true)
        coverLayer.position = location
        coverLayer.opacity = 0
        
        let a = CAKeyframeAnimation(keyPath: "opacity")
        a.values = [0, 1]
        a.duration = 3
        a.fillMode = kCAFillModeForwards
        a.isRemovedOnCompletion = false
        coverLayer.add(a, forKey: nil)
        
        /*
        CATransaction.setCompletionBlock { 
            print("Animation Complete!")
        }
        coverLayer.position = location
        coverLayer.opacity = 1*/
        
        // Disable implicit animations
        /*CATransaction.setDisableActions(true)
        coverLayer.position = location
        coverLayer.opacity = 1*/
        
        // Change the time of implicit animation
        /*CATransaction.setAnimationDuration(3)
        coverLayer.position = location
        coverLayer.opacity = 1*/
        
        /*
        CATransaction.begin()
        CATransaction.disableActions()
        coverLayer.position = location
        coverLayer.opacity = 0
        CATransaction.commit()
        
        let a = CABasicAnimation(keyPath: "opacity")
        a.fromValue = 0
        a.toValue = 1
        a.duration = 1
        a.fillMode = kCAFillModeForwards
        coverLayer.add(a, forKey: nil)
        */
    }
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */

}
