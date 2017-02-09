//
//  ViewController3.swift
//  PropertyAnimator
//
//  Created by mitchell hudson on 1/26/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
    
    
    @IBOutlet weak var a: UIView!
    @IBOutlet weak var b: UIView!
    @IBOutlet weak var c: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let h = view.bounds.height
        let y = h / 4
        
        var start = view.center
        start.y = h + y
        
        a.center = start
        b.center = start
        c.center = start
        
        a.alpha = 0
        b.alpha = 0
        c.alpha = 0
        
        UIView.animate(withDuration: 1) { 
            self.a.center.y = y
            self.b.center.y = y * 2
            self.c.center.y = y * 3
            
            self.a.alpha = 1
            self.b.alpha = 1
            self.c.alpha = 1
        }
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
