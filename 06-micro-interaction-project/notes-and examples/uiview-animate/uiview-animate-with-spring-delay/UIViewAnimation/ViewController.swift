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
    
    // Use the view Lifecycle methods to:
    // - Create and configure objects
    // - Show objects with an animation when the view appears
    // - Hide the objects as the view disappears
    

    // Mark: - View is loaded
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
            let r = CGRect(x: x, y: h, width: w, height: w)
            let b = UIButton(frame: r)
            
            buttonsArray.append(b)
            
            b.backgroundColor = buttonColors[i]
            b.setTitle("\(i + 1)", for: .normal)
            b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 34)
            
            view.addSubview(b)
        }
    }
    
    
    // MARK: - Do things after the voew appears
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //
    }
    
    
    // MARK: - trigger an animation just before the view appears
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let y = view.bounds.height - buttonsArray[0].bounds.width
        
        for i in 0 ..< buttonsArray.count {
            let b = buttonsArray[i]
            let d = TimeInterval(i) * 0.2
            
            UIView.animate(withDuration: 0.3, delay: d, options: [.curveEaseOut], animations: {
                b.frame.origin.y = y
            }, completion: nil)
            
        }

    }
    
    
    // MARK: - Hide objects as a view is removed. 
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let y = view.bounds.height + buttonsArray[0].bounds.height
        
        for i in 0 ..< buttonsArray.count {
            let b = buttonsArray[i]
            let d = TimeInterval(i) * 0.05
            
            UIView.animate(withDuration: 0.1, delay: d, options: [.curveEaseOut], animations: {
                b.frame.origin.y = y
            }, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

