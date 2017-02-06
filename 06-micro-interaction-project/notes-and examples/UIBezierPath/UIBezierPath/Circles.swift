//
//  Circles.swift
//  UIBezierPath
//
//  Created by mitchell hudson on 2/2/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class Circles: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        // Draw
        
        // Make a shapelayer
        let shapeLayer = CAShapeLayer()
        layer.addSublayer(shapeLayer)
        
        
        // Get some variables to help
        let w = bounds.width        // The width of the view
        let h = bounds.height       // The height of the view
        let steps = 20
        let stepX = w / CGFloat(steps)
        
        let path = UIBezierPath() // Make a path
        
        path.move(to: CGPoint.zero)
        
        for i in 0 ..< 20 {
            let x = stepX * CGFloat(i)
            let y = CGFloat(arc4random() % UInt32(h))
            let p = CGPoint(x: x, y: y)
            
            path.addLine(to: p)
        }
        
        // Set the path stroke and fill
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 6
        shapeLayer.strokeColor = UIColor.black.cgColor
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
