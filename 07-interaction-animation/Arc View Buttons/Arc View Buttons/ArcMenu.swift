//
//  ArcMenu.swift
//  Arc View Buttons
//
//  Created by mitchell hudson on 2/8/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ArcMenu: UIView {

    let shapeLayer = CAShapeLayer()
    let arcsArray = [CAShapeLayer]()
    
    let buttonArray = [UIView]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.addSublayer(shapeLayer)
        let path = UIBezierPath()
        let c = CGPoint(x: bounds.width, y: bounds.height)
        let radius = bounds.width - 20
        let startAngle = CGFloat(M_PI)
        let endAngle = startAngle + CGFloat(M_PI / 2)
        path.addArc(withCenter: c, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = 40
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        
        
        for i in 0 ..< 6 {
            
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
