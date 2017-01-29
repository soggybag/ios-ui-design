//
//  ViewController.swift
//  CircleMath-1
//
//  Created by mitchell hudson on 1/29/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let c = view.center
        let r: CGFloat = 120
        
        for i in 0 ..< 8 {
            let rect = CGRect(x: 0, y: 0, width: 40, height: 40)
            let v = UIView(frame: rect)
            v.backgroundColor = UIColor.orange
            
            let t = CGFloat(M_PI * 2) / 8 * CGFloat(i)
            let x = sin(t) * r + c.x
            let y = cos(t) * r + c.y
            
            v.center.x = x
            v.center.y = y
            
            view.addSubview(v)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

