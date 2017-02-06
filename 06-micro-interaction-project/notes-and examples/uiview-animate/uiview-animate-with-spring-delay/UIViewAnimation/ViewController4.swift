//
//  ViewController4.swift
//  UIViewAnimation
//
//  Created by mitchell hudson on 1/27/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let numBoxes = 6
        let margin: CGFloat = 20
        let columns = 2
        let w = view.bounds.width
        let size = (w - margin * CGFloat(columns + 1)) / CGFloat(columns)
        for i in 0 ..< numBoxes {
            let rx = margin + margin * CGFloat(i % columns) + (size * CGFloat(i % columns))
            let ry = margin + margin * CGFloat(i / columns) + (size * CGFloat(i / columns))
            let rect = CGRect(x: rx, y: ry, width: size, height: size)
            let box = UIView(frame: rect)
            view.addSubview(box)
            box.backgroundColor = UIColor(hue: 0.54, saturation: 0.7, brightness: 1, alpha: 1)
            
            box.alpha = 0
            let t = CGAffineTransform(rotationAngle: 45).scaledBy(x: 0.15, y: 0.15)
            box.transform = t
            
            let d = TimeInterval(i) * 0.2
            
            UIView.animate(withDuration: 0.4, delay: d, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                box.transform = CGAffineTransform.identity
                box.alpha = 1
            }, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
