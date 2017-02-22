//
//  ViewController.swift
//  Emitter Layer
//
//  Created by mitchell hudson on 2/16/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let emitter = CAEmitterLayer()
        emitter.position = view.center
        emitter.bounds = view.bounds
        emitter.backgroundColor = UIColor.magenta.cgColor
        
        emitter.birthRate = 22
        
        let cell = CAEmitterCell()
        cell.lifetime = 6
        cell.lifetimeRange = 2
        cell.birthRate = 15
        cell.velocity = 100
        cell.emissionLongitude = CGFloat(M_PI * 2)
        cell.contents = UIImage(named: "26")!.cgImage
        // cell.color = UIColor.black.cgColor
        cell.speed = 0.3
        cell.scale = 1
        
        // ...
        
        emitter.emitterCells = [cell]
        
        view.layer.addSublayer(emitter)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

