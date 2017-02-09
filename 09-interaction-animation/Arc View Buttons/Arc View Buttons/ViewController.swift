//
//  ViewController.swift
//  Arc View Buttons
//
//  Created by mitchell hudson on 2/8/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(onScreenEdge(_:)))
        
        let w = view.bounds.width
        let h = view.bounds.height
        let size = w - 60
        let rect = CGRect(x: 60, y: h - size, width: size, height: size)
        let arcMenu = ArcMenu(frame: rect)
        
        view.addSubview(arcMenu)
        
        arcMenu.backgroundColor = UIColor.lightGray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func onScreenEdge(_ gesture: UIScreenEdgePanGestureRecognizer) {
        print("Screen Edge")
        print(gesture)
    }


}

