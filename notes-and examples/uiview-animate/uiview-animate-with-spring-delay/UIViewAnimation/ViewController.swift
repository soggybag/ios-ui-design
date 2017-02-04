//
//  ViewController.swift
//  UIViewAnimation
//
//  Created by mitchell hudson on 1/27/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var buttonsArray = [UIButton]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        makeButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func makeButton() {
        var buttonColors = [UIColor]()
        
        for i in 0 ..< 5 {
            let h = 1 / 25 * CGFloat(i)
            let c = UIColor(hue: h, saturation: 0.89, brightness: 1, alpha: 1)
            buttonColors.append(c)
        }
        
        let w = view.bounds.width / CGFloat(buttonColors.count)
        let h = view.bounds.height
        
        for i in 0 ..< buttonColors.count {
            let x = CGFloat(i) * w
            let y = view.bounds.height - w
            let r = CGRect(x: x, y: h, width: w, height: w)
            let b = UIButton(frame: r)
            
            b.backgroundColor = buttonColors[i]
            b.setTitle("\(i + 1)", for: .normal)
            b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 34)
            
            view.addSubview(b)
            
            let d = TimeInterval(i) * 0.2
            
            UIView.animate(withDuration: 0.3, delay: d, options: [.curveEaseOut], animations: {
                b.frame.origin.y = y
            }, completion: nil)
            
        }
        
    }


}

