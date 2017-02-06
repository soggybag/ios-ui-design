//
//  ViewController.swift
//  MicroInteractions
//
//  Created by mitchell hudson on 1/28/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let r = CGRect(x: 20, y: 0, width: view.bounds.width - 40, height: 60)
        
        let a = CoverCircleView(frame: r.offsetBy(dx: 0, dy: 100))
        view.addSubview(a)
        
        let b = CoverCircleView2(frame: a.frame.offsetBy(dx: 0, dy: 100))
        view.addSubview(b)
        
        let c = CoberCircleView3(frame: b.frame.offsetBy(dx: 0, dy: 100))
        view.addSubview(c)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

