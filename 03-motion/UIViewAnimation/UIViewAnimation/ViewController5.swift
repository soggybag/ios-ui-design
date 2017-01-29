//
//  ViewController5.swift
//  UIViewAnimation
//
//  Created by mitchell hudson on 1/27/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController5: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let box = UIView(frame: view.bounds.insetBy(dx: 20, dy: 20))
        box.layer.cornerRadius = 20
        box.backgroundColor = UIColor.black
        view.addSubview(box)
        
        let c = view.center
        
        UIView.animate(withDuration: 0.5, delay: 1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
            box.frame = CGRect(x: c.x - 20, y: c.y - 20, width: 40, height: 40)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 2, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: [], animations: {
            box.frame = box.frame.offsetBy(dx: 0, dy: -100).insetBy(dx: 0, dy: -10)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.15, delay: 3, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: { 
            box.frame = box.frame.insetBy(dx: -120, dy: 0)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 4, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [], animations: {
            box.frame = box.frame.insetBy(dx: 0, dy: -100).offsetBy(dx: 0, dy: 100)
            box.backgroundColor = UIColor.red
        }, completion: nil)
        
        UIView.animate(withDuration: 0.8, delay: 5, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
            let r = CGRect(x: self.view.center.x - 20, y: self.view.bounds.height - 80, width: 40, height: 40)
            box.frame = r
            box.backgroundColor = UIColor(hue: 0.6, saturation: 0.5, brightness: 1, alpha: 1)
        }, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
