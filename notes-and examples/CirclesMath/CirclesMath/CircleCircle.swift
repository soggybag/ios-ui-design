//
//  CircleCircle.swift
//  CirclesMath
//
//  Created by mitchell hudson on 1/27/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class CircleCircle: UIView {

    var circleLayers = [CALayer]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Make some circles
        let circleSize:CGFloat = 40
        let ringRadius: CGFloat = 120
        let totalCircles = 12
        let c = center
        
        for i in 0 ..< totalCircles {
            let r = CGRect(x: 0, y: 0, width: circleSize, height: circleSize)
            let l = CALayer()
            l.frame = r
            l.backgroundColor = UIColor.blue.cgColor
            l.cornerRadius = circleSize / 2
            layer.addSublayer(l)
            
            // Arrange the circles in a circle!
            let t = CGFloat(M_PI * 2) / CGFloat(totalCircles) * CGFloat(i)
            let x = sin(t) * ringRadius + c.x
            let y = cos(t) * ringRadius + c.y
            l.position.x = x
            l.position.y = y
        }
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
