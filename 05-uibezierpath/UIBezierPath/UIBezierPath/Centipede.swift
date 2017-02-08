//
//  Centipede.swift
//  UIBezierPath
//
//  Created by mitchell hudson on 2/2/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class Centipede: UIView {

    let gradient = CAGradientLayer()
    let centipede = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        layer.addSublayer(gradient)
        
        addSubview(centipede)
        
        centipede.layer.cornerRadius = 75 / 2
        centipede.backgroundColor = UIColor.black
        
        moveCentipede()
    }
    
    
    func moveCentipede() {
        let w = bounds.width
        let h = bounds.height
        let y = h / 2 - 75 / 2
        
        let rect = CGRect(x: -200, y: y, width: 200, height: 75)
        centipede.frame = rect
        
        UIView.animate(withDuration: 3, delay: 0.5, options: [.curveEaseInOut], animations: { 
            self.centipede.center.x = w / 2
        }, completion: nil)
        
        UIView.animate(withDuration: 3, delay: 3.5, options: [.curveEaseInOut], animations: { 
            self.centipede.center.x = w + 100
        }, completion: { (completed) in
            // self.centipede.center.x = -100
            self.moveCentipede()
        })
        
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
