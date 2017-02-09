//
//  ViewController2.swift
//  PropertyAnimator
//
//  Created by mitchell hudson on 1/26/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    var circleView: CircleView!
    
    
    @IBAction func slider(_ sender: UISlider) {
        circleView.value = sender.value
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let w = view.bounds.width - 40
        let s = CGSize(width: w, height: w)
        let r = CGRect(origin: view.center, size: s)
        circleView = CircleView(frame: r)
        circleView.center = view.center
        circleView.backgroundColor = UIColor.red
        
        view.addSubview(circleView)
        
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
