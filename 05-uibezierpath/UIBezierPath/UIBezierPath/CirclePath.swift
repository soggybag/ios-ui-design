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
        
        setupGesture()
        // setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        // fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        
        setupGesture()
        // setup()
    }
    
    override func layoutSubviews() {
        setup()
    }
    
    
    func setupGesture() {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        addGestureRecognizer(pan)
    }
    
    func onPan(_ pan: UIPanGestureRecognizer) {
        let location = pan.translation(in: self)
        let y = location.y
        let n = y / bounds.height / 8
        value -= n
        print(value)
    }
    
    var value: CGFloat = 0 {
        didSet {
            value = min(max(value, 0), 1)
            shapeLayer.strokeEnd = CGFloat(value)
        }
    }
    let shapeLayer = CAShapeLayer()
    
    func setup() {
        // Follow these steps to draw a path.
        
        // Make a shapelayer
        // shapeLayer = CAShapeLayer()
        // Add as a sub layer
        layer.addSublayer(shapeLayer)
        // Draw a path. This method draws an oval within a rectangle.
        let strokeWidth: CGFloat = 16
        let w = bounds.width
        let h = bounds.height
        let size = w < h ? w : h
        let sizeLessStroke = size - strokeWidth
        let rect = CGRect(x: (w - sizeLessStroke) / 2, y: (h - sizeLessStroke) / 2, width: sizeLessStroke, height: sizeLessStroke)
        
        let path = UIBezierPath(ovalIn: rect)
        // Set the stroke width, color, and fill
        shapeLayer.path = path.cgPath
        // Set the line width, stroke color, and fill color. 
        shapeLayer.lineWidth = strokeWidth
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
