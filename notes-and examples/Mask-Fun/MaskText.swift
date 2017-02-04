//
//  MaskText.swift
//  Mask-Fun
//
//  Created by mitchell hudson on 2/4/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class MaskText: UIView {
    
    let maskLayer = CATextLayer()
    let gradLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup() {
        // Make a gradient
        layer.addSublayer(gradLayer)
        gradLayer.frame = bounds
        gradLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor]
        gradLayer.startPoint = CGPoint(x: 0, y: 0)
        gradLayer.endPoint = CGPoint(x: 0, y: 1)
        
        // Make some text
        layer.addSublayer(maskLayer)
        maskLayer.string = "99"
        maskLayer.fontSize = 200
        maskLayer.font = CTFontCreateWithName("HelveticaNeue" as CFString?, 120, nil)
        // maskLayer.font = UIFont(name: "Helvetica", size: 66)
        maskLayer.frame = CGRect(x: 0, y: 0, width: 250, height: 200)
        maskLayer.position = center
        maskLayer.alignmentMode = kCAAlignmentCenter
        maskLayer.foregroundColor = UIColor.black.cgColor
        
        gradLayer.mask = maskLayer
        
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
