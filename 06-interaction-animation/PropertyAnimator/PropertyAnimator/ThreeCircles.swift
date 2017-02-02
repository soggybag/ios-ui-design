//
//  ThreeCircles.swift
//  PropertyAnimator
//
//  Created by mitchell hudson on 1/31/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ThreeCircles: UIView {
    
    let shapeLayer = CAShapeLayer()
    let shapeLayer2 = CAShapeLayer()
    
    var numberOfLobes: Int = 3 {
        didSet {
            setup()
        }
    }
    
    var lobeRadius: CGFloat = 60 {
        didSet {
            setup()
        }
    }
    
    var radius: CGFloat = 40 {
        didSet {
            setup()
        }
    }
    
    var isAnimated: Bool = false {
        didSet {
            setup()
        }
    }
    
    var fudge: CGFloat = 0.38 {
        didSet {
            setup()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup() {
        layer.addSublayer(shapeLayer2)
        layer.addSublayer(shapeLayer)
        let path = UIBezierPath()
        let cx = bounds.width / 2
        let cy = bounds.height / 2
        let nodules = numberOfLobes
        let radius1: CGFloat = lobeRadius
        let radius2: CGFloat = radius
        
        for i in 0 ..< nodules {
            let t = CGFloat(M_PI * 2) / CGFloat(nodules) * CGFloat(i)
            let x = sin(t) * radius1 + cx
            let y = cy - cos(t) * radius1
            let c = CGPoint(x: x, y: y)
            
            let pi = CGFloat(M_PI * 2)
            let startAngle: CGFloat = (pi * 0.38) + (pi / CGFloat(nodules) * CGFloat(i))
            let endAngle = startAngle + pi * 0.75
            
            path.addArc(withCenter: c, radius: radius2, startAngle: endAngle, endAngle: startAngle, clockwise: false)
        }
        
        // Add a segment that overlaps
        let t: CGFloat = 0
        let x = sin(t) * radius1 + cx
        let y = cy - cos(t) * radius1
        let c = CGPoint(x: x, y: y)
        
        let pi = CGFloat(M_PI * 2)
        let startAngle: CGFloat = (pi * fudge) + (pi / CGFloat(nodules) * 0)
        let endAngle = startAngle + pi * 0.75
        
        path.addArc(withCenter: c, radius: radius2, startAngle: endAngle, endAngle: startAngle, clockwise: false)
        

        // path.close()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 12
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.lineCap = "round"
        
        // shapeLayer.fillRule
        
        if isAnimated {
            let a = CABasicAnimation(keyPath: "strokeEnd")
            a.duration = 3
            a.fromValue = 0.25
            a.toValue = 1
            a.repeatCount = Float.infinity
            shapeLayer.add(a, forKey: "strokeEnd")

            let b = CABasicAnimation(keyPath: "strokeStart")
            b.duration = 3
            b.fromValue = 0
            b.toValue = 0.75
            b.repeatCount = Float.infinity
            shapeLayer.add(b, forKey: "strokeStart")
            
        } else {
            shapeLayer.removeAllAnimations()
        }
    }
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
