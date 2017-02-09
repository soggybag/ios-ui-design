//
//  ViewController6.swift
//  PropertyAnimator
//
//  Created by mitchell hudson on 1/31/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController6: UIViewController {

    var thing: ThreeCircles!
    
    
    
    @IBOutlet weak var lobesSlider: UISlider!
    @IBOutlet weak var radius: UISlider!
    @IBOutlet weak var lobeRadius: UISlider!
    
    
    @IBAction func lobeSliderChanged(_ sender: UISlider) {
        thing.numberOfLobes = Int(sender.value)
    }
    
    @IBAction func lobeRadiusChanged(_ sender: UISlider) {
        thing.lobeRadius = CGFloat(sender.value)
    }
    
    @IBAction func radiusChanged(_ sender: UISlider) {
        thing.radius = CGFloat(sender.value)
    }
    
    @IBAction func animateSwitchChanged(_ sender: UISwitch) {
        thing.isAnimated = sender.isOn
    }
    
    
    @IBAction func fudgeSliderChanged(_ sender: UISlider) {
        thing.fudge = CGFloat(sender.value)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let w = view.bounds.width - 40
        let r = CGRect(x: 20, y: 20, width: w, height: w)
        let v = ThreeCircles(frame: r)
        v.center = view.center
        v.center.y = v.center.y - 60
        v.backgroundColor = UIColor.orange
        view.addSubview(v)
        
        thing = v
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
