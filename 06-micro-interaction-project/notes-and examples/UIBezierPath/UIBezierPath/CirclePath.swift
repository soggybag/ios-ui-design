//
//  CirclePath.swift
//  UIBezierPath
//
//  Created by mitchell hudson on 2/2/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class CirclePath: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        // Follow these steps to draw a path.
        
        // Make a shapelayer
        let shapeLayer = CAShapeLayer()
        // Add as a sub layer
        layer.addSublayer(shapeLayer)
        // Draw a path. This method draws an oval within a rectangle. 
        let path = UIBezierPath(ovalIn: bounds)
        // Set the stroke width, color, and fill
        shapeLayer.path = path.cgPath
        // Set the line width, stroke color, and fill color. 
        shapeLayer.lineWidth = 16
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.orange.cgColor
        
        shapeLayer.strokeEnd = 0.5
        shapeLayer.strokeStart = 0.25
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
