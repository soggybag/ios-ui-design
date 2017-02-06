//
//  ViewController.swift
//  Animate-stuff
//
//  Created by mitchell hudson on 1/28/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setup() {
        // Set the number of the boxes and the default frame of the box.
        let numBoxes = 6
        let boxRect = CGRect(x: 0, y: 0, width: 120, height: 60)
        
        // Make some boxes.
        for i in 0 ..< numBoxes {
            let box = UIView(frame: boxRect)
            view.addSubview(box)
            let hue = 1 / CGFloat(numBoxes) * CGFloat(i)
            box.backgroundColor = UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1)
            box.center.x = view.center.x
            let y = view.bounds.height / CGFloat(numBoxes + 1)*CGFloat(i + 1)
            box.center.y = view.bounds.height + y
            box.alpha = 0
            let delay = TimeInterval(i) * 0.33
            let rotate = CGAffineTransform(rotationAngle: CGFloat(M_PI / 2))
            let scaleAndRotate = rotate.scaledBy(x: 0.05, y: 0.05)
            
            // Rotate and scale the box.
            box.transform = scaleAndRotate
            
            // UIView.animate(withDuration: 0.7, delay: delay, options: [.], animations: {
            UIView.animate(withDuration: 0.5, delay: delay, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: [], animations: {
                box.center.y = y
                box.alpha = 1
                // Reset the box to it's default rotation and scale. 
                box.transform = CGAffineTransform.identity
            }, completion: nil)
        }
    }


}

