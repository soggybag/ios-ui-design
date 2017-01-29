//
//  ViewController.swift
//  AddTarget
//
//  Created by mitchell hudson on 1/26/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // make a boxy thing
        let boxy = Boxy(frame: view.bounds.insetBy(dx: 0, dy: 10).offsetBy(dx: 0, dy: 10))
        view.addSubview(boxy)
        
        // Add some actions Each has a title and a closure.
        boxy.addAction(title: "Hello") { 
            print("Hello!!!!")
        }
        
        boxy.addAction(title: "World") { 
            print("World!!!!!!")
        }
        
        boxy.addAction(title: "Foo") { 
            print("Foo was pressed")
        }
        
        boxy.addAction(title: "CHOCO BARS") { 
            print("I like choco bars!!!!!")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    


}

