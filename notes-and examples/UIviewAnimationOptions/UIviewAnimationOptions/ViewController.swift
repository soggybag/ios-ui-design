//
//  ViewController.swift
//  UIviewAnimationOptions
//
//  Created by mitchell hudson on 1/30/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var box1: UIView!
    @IBOutlet weak var box2: UIView!
    @IBOutlet weak var box3: UIView!
    @IBOutlet weak var box4: UIView!
    
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider3: UISlider!
    @IBOutlet weak var slider4: UISlider!
    
    
    @IBAction func slider1(_ sender: UISlider) {
        
    }
    
    @IBAction func slider2(_ sender: UISlider) {
        
    }
    
    @IBAction func slider3(_ sender: UISlider) {
        
    }
    
    @IBAction func slider4(_ sender: UISlider) {
        
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        start()
    }
    
    
    
    func start() {
        let time = TimeInterval(slider1.value)
        let spring = CGFloat(slider2.value)
        let vel = CGFloat(slider3.value)
        let x = view.bounds.width - 20 - (box1.bounds.width / 2)
        
        box1.layer.presentation()?.removeAllAnimations()
        
        UIView.animate(withDuration: time, delay: 0, usingSpringWithDamping: spring, initialSpringVelocity: vel, options: [.repeat], animations: {
            self.box1.center.x = x
        }, completion: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }


}

