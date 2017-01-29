//
//  ViewController.swift
//  SubClassingTricks
//
//  Created by mitchell hudson on 1/26/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let r = ReplicatorView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        r.backgroundColor = UIColor.lightGray
        r.center = view.center
        view.addSubview(r)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

