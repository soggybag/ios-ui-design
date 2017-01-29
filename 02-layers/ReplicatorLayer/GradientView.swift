//
//  GradientView.swift
//  SubClassingTricks
//
//  Created by mitchell hudson on 1/26/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit



class GradientView: UIView {

    // class var layerClass: AnyClass { get }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
