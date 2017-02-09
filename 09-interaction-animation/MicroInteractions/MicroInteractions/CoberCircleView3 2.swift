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
        print(location)
        coverLayer.position = location
        
        coverLayer.opacity = 1
        
        /*
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.fromValue = 1
        animation.toValue = 0
        animation.duration = 1
        coverLayer.add(animation, forKey: "opacity")
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
