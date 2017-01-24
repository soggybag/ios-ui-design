//
//  CirclesView.swift
//  CirclesThingForJake
//
//  Created by mitchell hudson on 1/24/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class CirclesView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        // Make some layers
        let container = CALayer()
        let innerCircle = CALayer()
        let outerCircle = CALayer()
        
        // Stack the layers
        layer.addSublayer(container)
        container.addSublayer(innerCircle)
        container.addSublayer(outerCircle)
        
        // Find the min dimension
        let w = bounds.width
        let h = bounds.height
        var size = CGSize()
        if w < h {
            size.width = w
            size.height = h
        } else {
            size.width = h
            size.height = h
        }
        
        // Size the container
        container.frame = CGRect(origin: CGPoint.zero, size: size)
        
        // Draw the outer circle
        outerCircle.frame = container.bounds
        outerCircle.borderColor = UIColor.white.cgColor
        outerCircle.borderWidth = 10
        outerCircle.cornerRadius = outerCircle.bounds.width / 2
        outerCircle.shadowRadius = 4
        outerCircle.shadowColor = UIColor.black.cgColor
        outerCircle.shadowOpacity = 1
        outerCircle.shadowOffset = CGSize.zero
        
        // Draw the inner circle
        innerCircle.frame = container.bounds.insetBy(dx: 30, dy: 30)
        innerCircle.backgroundColor = UIColor.red.cgColor
        innerCircle.cornerRadius = innerCircle.bounds.width / 2
        
    }
    

}







