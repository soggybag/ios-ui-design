//
//  ViewController.swift
//  Transform3d
//
//  Created by mitchell hudson on 2/4/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Make a view set it's size and position.
        let w = view.bounds.width - 40
        let r = CGRect(x: 20, y: 20, width: w, height: w)
        let v = UIView(frame: r)
        view.addSubview(v)
        v.center = view.center
        v.backgroundColor = UIColor.red

        // Make a 3d transform. You can only apply this to a layer!
        var transform = CATransform3DIdentity;  // Create a transform
        transform.m34 = 1.0 / 300.0;            // Set the perspective
        // Now make a 3d rotation
        transform = CATransform3DRotate(transform, CGFloat(M_PI), 0, 1, 0)
        // second param is the angle in radians!

        // make a CABasicAnimation
        let a = CABasicAnimation(keyPath: "transform")
        a.duration = 3
        a.fromValue = CATransform3DIdentity
        a.toValue = transform
        v.layer.add(a, forKey: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

