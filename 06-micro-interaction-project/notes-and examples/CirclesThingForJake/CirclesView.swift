//
//  CirclesView.swift
//  CirclesThingForJake
//
//  Created by mitchell hudson on 1/24/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class CirclesView: UIControl {
    
    // Make some layers
    let innerCircle = CALayer()
    let container = CALayer()
    let outerCircle = CALayer()
    let ringLayer = CAShapeLayer()
    
    var ringAnimation: CABasicAnimation! = nil
    
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayers()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupLayers()
    }
    
    
    func setupLayers() {
        // Stack the layers
        layer.addSublayer(container)
        container.addSublayer(innerCircle)
        container.addSublayer(outerCircle)
        container.addSublayer(ringLayer)
        
        // Find the min dimension
        let w = bounds.width
        let h = bounds.height
        var size = CGSize()
        if w < h {
            size.width = w
            size.height = h
        } else {
            size.width = h
            size.height = h
        }
        
        // Size the container
        container.frame = CGRect(origin: CGPoint.zero, size: size)
        
        // Draw the outer circle
        outerCircle.frame = container.bounds
        outerCircle.borderColor = UIColor.white.cgColor
        outerCircle.borderWidth = 10
        outerCircle.cornerRadius = outerCircle.bounds.width / 2
        
        // Shadow on outer circle
        /*
        outerCircle.shadowRadius = 4
        outerCircle.shadowColor = UIColor.black.cgColor
        outerCircle.shadowOpacity = 1
        outerCircle.shadowOffset = CGSize.zero
        */
        
        // shadow on view layer
        layer.shadowRadius = 4
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        
        // Draw the inner circle
        innerCircle.frame = container.bounds.insetBy(dx: 30, dy: 30)
        innerCircle.backgroundColor = UIColor.white.cgColor
        innerCircle.cornerRadius = innerCircle.bounds.width / 2
        
        // Draw ring
        ringLayer.path = CGPath(ellipseIn: outerCircle.bounds.insetBy(dx: 5, dy: 5), transform: nil)
        ringLayer.strokeColor = UIColor.red.cgColor
        ringLayer.lineWidth = 10
        ringLayer.strokeEnd = 0
        ringLayer.fillColor = UIColor.clear.cgColor
    }
    
    
    
    // MARK: - Handle interaction
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
        
        forward()
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.continueTracking(touch, with: event)
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        
        reverse()
    }
    
    func forward() {
        ringLayer.strokeEnd = 0
        
        /*
        UIView.animate(withDuration: 2) { 
            self.ringLayer.strokeEnd = 1
        }
        */
        
        UIView.animate(withDuration: 0.25) { 
            self.innerCircle.backgroundColor = UIColor.red.cgColor
        }
        
        
        let a = CABasicAnimation(keyPath: "strokeEnd")
        a.duration = 2
        a.fromValue = 0
        a.toValue = 1
        
        ringLayer.add(a, forKey: "strokeEnd")
    }
    
    func reverse() {
        UIView.animate(withDuration: 0.25) { 
            self.innerCircle.backgroundColor = UIColor.white.cgColor
        }
        
        let a = CABasicAnimation(keyPath: "strokeEnd")
        let fromValue = ringLayer.presentation()?.value(forKeyPath: "strokeEnd") as! CGFloat
        let duration = 2 * fromValue
        a.fromValue = fromValue
        a.duration = CFTimeInterval(duration)
        a.toValue = 0
        ringLayer.removeAllAnimations()
        ringLayer.add(a, forKey: "strokePath")
    }
    

    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
    }
    

}







