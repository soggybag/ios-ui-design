//
//  ViewController.swift
//  UIBezierPath
//
//  Created by mitchell hudson on 2/2/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let w = view.bounds.width - 40
        
        let rect = CGRect(x: 20, y: 20, width: w, height: w)
        
        // let v = CirclePath(frame: rect)
        let v = DrawCircle(frame: rect)
        // let v = Centipede(frame: view.bounds)
        
        view.addSubview(v)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

