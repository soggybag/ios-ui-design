//
//  ViewController.swift
//  UIBezierPath
//
//  Created by mitchell hudson on 2/2/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var circle: CirclePath!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let w = view.bounds.width - 40
        
        let rect = CGRect(x: 20, y: 20, width: w, height: w)
        
        let v = CirclePath(frame: rect)
        // let v = DrawCircle(frame: rect)
        // let v = Centipede(frame: view.bounds)
        
        view.addSubview(v)
        
        /*
        let v = UIView(frame: CGRect(x: 40, y: 400, width: 200, height: 40))
        v.layer.cornerRadius = 20
        v.layer.borderColor = UIColor.black.cgColor
        v.layer.borderWidth = 5
        
        view.addSubview(v)
        v.backgroundColor = UIColor(white: 0, alpha: 0)
        
        UIView.animate(withDuration: 1, delay: 1, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            v.frame = v.frame.insetBy(dx: 80, dy: 0)
            v.backgroundColor = UIColor(white: 0, alpha: 0.5)
        }, completion: nil)
        
        
        
        
        let a = UIView()
        let b = UIView()
        
        view.addSubview(a)
        
        UIView.transition(from: a, to: b, duration: 2, options: [], completion: nil)
        */
        
        /*
        let l = CALayer()
        let startframe = CGRect(x: 0, y: 0, width: 200, height: 0)
        let endFrame = CGRect(x: 0, y: 0, width: 200, height: 400)
        l.backgroundColor = UIColor.magenta.cgColor
        
        view.layer.addSublayer(l)
        
        let aa = CABasicAnimation(keyPath: "frame")
        aa.fromValue = startframe
        aa.toValue = endFrame
        aa.duration = 5
        l.add(aa, forKey: nil)
        */
        
        /*
        let l = CAShapeLayer()
        let startframe = CGRect(x: 0, y: 0, width: 200, height: 0)
        let endFrame = CGRect(x: 0, y: 0, width: 200, height: 400)
        l.fillColor = UIColor.magenta.cgColor
        let endPath = UIBezierPath(rect: endFrame)
        let startPath = UIBezierPath(rect: startframe)
        
        l.path = startPath.cgPath
        
        view.layer.addSublayer(l)
        
        
        let aa = CABasicAnimation(keyPath: "path")
        aa.fromValue = startPath
        aa.toValue = endPath
        aa.duration = 5
        l.add(aa, forKey: nil)
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

