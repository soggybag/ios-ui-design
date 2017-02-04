//
//  MorphPath.swift
//  Rotation-Fun
//
//  Created by mitchell hudson on 2/4/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class MorphPath: UIView {
    
    let shapeLayer = CAShapeLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setup()
    }
    
    func setup() {
        layer.addSublayer(shapeLayer)
        
        let path1 = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 100, height: 100))
        let path2 = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        shapeLayer.path = path1.cgPath
        
        let a = CABasicAnimation(keyPath: "path")
        a.duration = 4
        a.fromValue = path2.cgPath
        a.toValue = path1.cgPath
        a.isRemovedOnCompletion = false
        shapeLayer.add(a, forKey: "path")
        
        shapeLayer.lineWidth = 5
        shapeLayer.strokeColor = UIColor.red.cgColor
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
