//
//  ScrollLayer.swift
//  Scroll-Layer
//
//  Created by mitchell hudson on 2/4/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ScrollLayer: UIView {

    let graphLayer = CAShapeLayer()
    let scrollLayer = CAScrollLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        layer.addSublayer(scrollLayer)
        scrollLayer.frame = bounds
        scrollLayer.addSublayer(graphLayer)
        // layer.addSublayer(graphLayer)
        
        let path = UIBezierPath()
        
        for i in 0 ..< 400 {
            let h = CGFloat(arc4random() % 100)
            let start = CGPoint(x: CGFloat(i) * 5, y: 100)
            let end = CGPoint(x: start.x, y: h)
            path.move(to: start)
            path.addLine(to: end)
        }
        
        graphLayer.path = path.cgPath
        graphLayer.lineWidth = 2
        graphLayer.strokeColor = UIColor.red.cgColor
        
        scrollLayer.scrollMode = kCAScrollHorizontally
        
        let displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink.add(to: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
        
        CATransaction.begin()
        scrollLayer.scroll(to: CGPoint(x: 100, y: 0))
        CATransaction.commit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var t = 0
    func update() {
        t += 1
        scrollLayer.scroll(to: CGPoint(x: t, y: 0))
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
