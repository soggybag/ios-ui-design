//
//  Boxy.swift
//  AddTarget
//
//  Created by mitchell hudson on 1/26/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

// This struct represents a button and it's action
struct BoxyAction {
    let button: UIButton
    let action: () -> ()
}

class Boxy: UIView {
    
    var buttonArray = [BoxyAction]()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.lightGray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    func addAction(title: String, action: @escaping ()->() ) {
        // Adding an action with a title generates a button in this view.
        let h: CGFloat = 40
        let y = h * CGFloat(buttonArray.count)
        let w = bounds.width
        let b = UIButton(frame: CGRect(x: 0, y: y, width: w, height: h))
        b.setTitle(title, for: .normal)
        addSubview(b)
        
        // Make a boxy Action with a button and an action, save it in the array
        let boxyAction = BoxyAction(button: b, action: action)
        buttonArray.append(boxyAction)
        
        // Add a target to the button.
        b.addTarget(self, action: #selector(handleButton(sender:)), for: .touchUpInside)
    }
    
    func handleButton(sender: UIButton) {
        // When the button invokes it's target we'll find the button in the array and 
        // execute the target.
        print("Boxy button Tapped!")
        for b in buttonArray {
            if b.button == sender {
                print("Found a boxy button")
                b.action()
                break
            }
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
