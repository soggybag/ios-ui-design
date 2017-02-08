//
//  ButtonLoader.swift
//  UIBezierPath
//
//  Created by mitchell hudson on 2/2/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ButtonLoader: UIView {
    
    let outerView = UIView()
    let innerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(outerView)
        addSubview(innerView)
        
        outerView.layer.borderColor = UIColor.clear.cgColor
        outerView.layer.borderWidth = 3
        outerView.layer.cornerRadius = 5
        outerView.layer.backgroundColor = UIColor.black.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func start() {
        outerView.frame = bounds
        innerView.isHidden = true
        
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: { 
            self.outerView.layer.cornerRadius = 10
            
        }, completion: nil)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
