//
//  ViewController3.swift
//  UIViewAnimation
//
//  Created by mitchell hudson on 1/27/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    var buttonsArray = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        makeButton()
        makeInfo()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func makeButton() {
        var buttonColors = [UIColor]()
        
        for i in 0 ..< 5 {
            let h = 1 / 25 * CGFloat(i)
            let c = UIColor(hue: h, saturation: 0.89, brightness: 1, alpha: 1)
            buttonColors.append(c)
        }
        
        let w = view.bounds.width / CGFloat(buttonColors.count)
        let h = view.bounds.height
        
        for i in 0 ..< buttonColors.count {
            let x = CGFloat(i) * w
            let y = view.bounds.height - w
            let r = CGRect(x: x, y: h, width: w, height: w)
            let b = UIButton(frame: r)
            
            b.backgroundColor = buttonColors[i]
            b.setTitle("\(i + 1)", for: .normal)
            b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 34)
            
            view.addSubview(b)
            
            let d = TimeInterval(i) * 0.13
            
            UIView.animate(withDuration: 0.5, delay: d, usingSpringWithDamping: 0.33, initialSpringVelocity: 0, options: [], animations: {
                b.frame.origin.y = y
            }, completion: nil)
            
        }
        
    }
    
    
    func makeInfo() {
        let w = view.bounds.width
        let h = view.bounds.height
        let s = w / 5
        let v = UIView(frame: CGRect(x: 0, y: h - s * 2, width: w, height: s))
        view.addSubview(v)
        // v.backgroundColor = UIColor(white: 0, alpha: 0.3)
        
        let v2 = UIView(frame: CGRect(x: 0, y: 0, width: w, height: s / 2))
        v2.backgroundColor = UIColor(white: 0, alpha: 0.3)
        let l2 = UILabel(frame: v2.bounds.insetBy(dx: 5, dy: 0))
        l2.text = "This is a bold title"
        l2.font = UIFont.boldSystemFont(ofSize: s / 4)
        v2.addSubview(l2)
        
        v.addSubview(v2)
        
        let v3 = UIView(frame: CGRect(x: 0, y: s/2, width: w, height: s / 2))
        v3.backgroundColor = UIColor(white: 0, alpha: 0.1)
        v.addSubview(v3)
        
        let l3 = UILabel(frame: v3.bounds.insetBy(dx: 5, dy: 0))
        l3.text = "Some subtitle text"
        l3.font = UIFont.systemFont(ofSize: s / 4)
        l3.textAlignment = .right
        v3.addSubview(l3)
        
        let line = UIView(frame: CGRect(x: 0, y: h - s * 2 - 3, width: w, height: 3))
        line.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
        line.center.x = line.center.x - w / 2
        view.addSubview(line)
        let g = CAGradientLayer()
        line.layer.addSublayer(g)
        g.frame = line.bounds
        let colorA = UIColor(hue: 0, saturation: 1, brightness: 1, alpha: 1).cgColor
        let colorB = UIColor(hue: 1 / 25 * 5, saturation: 1, brightness: 1, alpha: 1).cgColor
        g.colors = [colorA, colorB]
        g.startPoint = CGPoint(x: 0, y: 0)
        g.endPoint = CGPoint(x: 1, y: 0)
        
        // Animate stuff
        v2.alpha = 0
        UIView.animate(withDuration: 0.6, delay: 1, options: [.curveLinear], animations: {
            v2.alpha = 1
        }, completion: nil)
        
        v3.alpha = 0
        UIView.animate(withDuration: 0.6, delay: 1.8, options: [.curveLinear], animations: {
            v3.alpha = 1
        }, completion: nil)
        
        let squish = CGAffineTransform(scaleX: 0, y: 1)
        line.transform = squish
        UIView.animate(withDuration: 1.35, delay: 3, options: [.curveEaseOut], animations: { 
            line.transform = CGAffineTransform.identity
        }, completion: nil)
        
    }


}
