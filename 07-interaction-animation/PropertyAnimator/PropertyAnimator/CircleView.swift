//
//  CircleView.swift
//  PropertyAnimator
//
//  Created by mitchell hudson on 1/26/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    var circle: UIBezierPath!
    var pathLayer: CAShapeLayer!
    
    var value: Float = 0 {
        didSet {
            pathLayer.strokeEnd = CGFloat(value)
            pathLayer.strokeStart = CGFloat(value - 0.25)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }

    
    func setup() {
        let c = CGPoint(x: bounds.midX, y: bounds.midY)
        circle = UIBezierPath(arcCenter: c, radius: bounds.midX, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        pathLayer = CAShapeLayer()
        layer.addSublayer(pathLayer)
        pathLayer.path = circle.cgPath
        pathLayer.strokeColor = UIColor.yellow.cgColor
        pathLayer.lineWidth = 10
        pathLayer.fillColor = UIColor.clear.cgColor
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
