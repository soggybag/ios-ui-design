//
//  ViewController.swift
//  FrameBoundsAndCenter
//
//  Created by mitchell hudson on 1/23/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let box = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        box.backgroundColor = UIColor.red
        view.addSubview(box)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

