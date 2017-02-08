//
//  ViewController.swift
//  UIViewPropertyAnimator
//
//  Created by mitchell hudson on 2/7/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let fill = FillUpView(frame: view.bounds)
        view.addSubview(fill)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

