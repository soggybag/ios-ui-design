//
//  FillUpView.swift
//  UIViewPropertyAnimator
//
//  Created by mitchell hudson on 2/7/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class FillUpView: UIView {
    
    var shapeLayer = CAShapeLayer()
    var maskLayer = CAShapeLayer()
    
    var label: UILabel!
    var label2: UILabel!
    
    var count: Float = 100
    
    var startTime: CFTimeInterval = 0
    var displayLink: CADisplayLink!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // setup()
        setupShape()
        start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        // setup()
    }
    
    
    func start() {
        displayLink = CADisplayLink(target: self, selector: #selector(update))
        displayLink.add(to: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
        startTime = displayLink.timestamp
        print("Start Time: \(startTime)")
    }
    
    func update() {
        if startTime == 0 {
            startTime = displayLink.timestamp
        }
        
        let dif = displayLink.targetTimestamp - displayLink.timestamp
        // print(displayLink.timestamp - startTime)
        let c = Int(displayLink.timestamp - startTime)
        label.text = "\(c)"
        label2.text = label.text
    }
    
    func setupShape() {
        
        // Label magenta
        label2 = makeLabel(color: UIColor.magenta)
        
        // Color layer
        layer.addSublayer(shapeLayer)

        let w = bounds.width
        let h = bounds.height
        let path = UIBezierPath(rect: CGRect(x: 0, y: h, width: w, height: 0))
        let startPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: w, height: h))

        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.magenta.cgColor

        let a = CABasicAnimation(keyPath: "path")
        a.fromValue = startPath.cgPath
        a.toValue = path.cgPath
        a.duration = 8
        shapeLayer.add(a, forKey: nil)
        
        // Mask layer
        layer.addSublayer(maskLayer)
        
        maskLayer.path = path.cgPath
        maskLayer.fillColor = UIColor(red: 0.03, green: 1, blue: 0.12, alpha: 0.3).cgColor
        maskLayer.add(a, forKey: nil)
        maskLayer.position.x = maskLayer.position.x + 10
        maskLayer.position.y = maskLayer.position.y + 10
        
        // Label white
        label = makeLabel(color: UIColor.white)
        addSubview(label)
        
        label.layer.mask = maskLayer // maskLayer becomes hidden
        label.center.x = label.center.x + 10
        label.center.y = label.center.y + 10
    }
    
    func makeLabel(color: UIColor) -> UILabel {
        let label = UILabel()
        addSubview(label)
        label.frame = bounds
        label.text = "99"
        label.font = UIFont(name: "Helvetica", size: 166)
        label.textAlignment = .center
        label.textColor = color
        return label
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
}
