//
//  ViewController4.swift
//  PropertyAnimator
//
//  Created by mitchell hudson on 1/26/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {
    
    @IBOutlet weak var a: UIView!
    @IBOutlet weak var b: UIView!
    @IBOutlet weak var c: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let array = [a, b, c]
        let h = view.bounds.height
        let x = view.center.x
        let y = h / 4
        
        for i in 0 ..< array.count {
            let v = array[i]!
            v.center.x = x
            v.center.y = h + y * CGFloat(i)
            v.alpha = 0
            let d = TimeInterval(0.3 * CGFloat(i))
            
            /*
            UIView.animate(withDuration: 0.6, delay: d, options: [.curveEaseIn], animations: {
                v.center.y = CGFloat(i + 1) * y
                v.alpha = 1
            }, completion: nil)
            */
            
            /*
            UIView.animate(withDuration: 0.5, delay: d, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.4, options: [], animations: { 
                v.center.y = CGFloat(i + 1) * y
                v.alpha = 1
            }, completion: nil)
            */
            
            v.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
            v.center.y = CGFloat(i + 1) * y
            UIView.animate(withDuration: 0.5, delay: d, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.4, options: [], animations: {
                v.alpha = 1
                v.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
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
