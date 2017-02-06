//
//  ViewController.swift
//  UIview-Keyframes
//
//  Created by mitchell hudson on 2/4/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        otherThings()
        // moreThings()
        // things()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func moreThings() {
        let r = CGRect(x: 0, y: 0, width: 40, height: 40)
        let radius: CGFloat = 100
        let c = view.center
        let pi2 = CGFloat(M_PI * 2)
        let count = 8
        
        for i in 0 ..< count {
            let v = UIView(frame: r)
            view.addSubview(v)
            v.layer.cornerRadius = 20
            v.backgroundColor = UIColor(hue: 0.73, saturation: 1, brightness: 1, alpha: 1)
            
            let t = pi2 / CGFloat(count) * CGFloat(i)
            let x = sin(t) * radius + c.x
            let y = cos(t) * radius + c.y
            
            v.center = CGPoint(x: x, y: y)
            v.layer.opacity = 0
            
            let duration: CFTimeInterval = 1
            let beginTime: CFTimeInterval = CACurrentMediaTime() + CFTimeInterval(i) * 1
            
            CATransaction.begin()
            CATransaction.setAnimationDuration(duration)
            v.layer.opacity = 1
            v.layer.backgroundColor = UIColor.red.cgColor
            CATransaction.commit()
        }
    }
    
    
    func otherThings() {
        let r = CGRect(x: 0, y: 0, width: 40, height: 40)
        let radius: CGFloat = 100
        let c = view.center
        let pi2 = CGFloat(M_PI * 2)
        let count = 4
        
        for i in 0 ..< count {
            let v = UIView(frame: r)
            view.addSubview(v)
            v.layer.cornerRadius = 20
            v.backgroundColor = UIColor(hue: 0.73, saturation: 1, brightness: 1, alpha: 1)
            
            let x = sin(0) * radius + c.x
            let y = cos(0) * radius + c.y
            
            v.center = CGPoint(x: x, y: y)
            let path = UIBezierPath()
            let end = pi2 / CGFloat(count) * CGFloat(i + 1)
            
            path.addArc(withCenter: c, radius: radius, startAngle: 0, endAngle: end, clockwise: false)
            
            let duration: CFTimeInterval = 1
            let beginTime: CFTimeInterval = CACurrentMediaTime() + CFTimeInterval(i) * 1
            
            let a = CAKeyframeAnimation(keyPath: "position")
            a.duration = duration
            a.beginTime = beginTime
            a.path = path.cgPath
            a.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            a.isRemovedOnCompletion = false   // Both of these properties are need to end the
            a.fillMode = kCAFillModeForwards  // animation without resetting to the original position.
            v.layer.add(a, forKey: nil)
 
            
            let b = CABasicAnimation(keyPath: "opacity")
            b.duration = duration
            b.beginTime = beginTime
            b.fromValue = 0
            b.toValue = 1
            b.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            v.layer.add(b, forKey: nil)
        }
    }
    
    
    func things() {
        // Doesn't work ????
        let r = CGRect(x: 0, y: 0, width: 40, height: 40)
        let radius: CGFloat = 100
        let c = view.center
        let pi = CGFloat(M_PI * 2)
        let count = 5
        
        for i in 0 ..< count {
            let v = UIView(frame: r)
            
            view.addSubview(v)
            v.layer.cornerRadius = 20
            v.backgroundColor = UIColor(white: 0.3 + CGFloat(i) * 0.1, alpha: 1)
            
            let x = sin(0) * radius + c.x
            let y = cos(0) * radius + c.y
            
            v.center = CGPoint(x: x, y: y)
            
            let time: TimeInterval = 6
            
            for j in 0 ... i {
                let delay = TimeInterval(i) * 0.5
                
                UIView.animateKeyframes(withDuration: time, delay: delay, options: [], animations: {
                    let start = 1 / time * TimeInterval(j)
                    let rel = 1 / time
                    print(start, rel)
                    let x2 = sin(pi / CGFloat(count) * CGFloat(j + 1)) * radius + c.x
                    let y2 = cos(pi / CGFloat(count) * CGFloat(j + 1)) * radius + c.y
                    UIView.addKeyframe(withRelativeStartTime: start, relativeDuration: rel, animations: {
                        v.center = CGPoint(x: x2, y: y2)
                    })
                }, completion: { (completed) in
                    
                })
            }
        }

    }
    
    
}

