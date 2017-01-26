//
//  ReplicatorView.swift
//  SubClassingTricks
//
//  Created by mitchell hudson on 1/26/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class ReplicatorView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let r = CAReplicatorLayer()
        r.frame = bounds
        layer.addSublayer(r)
        
        r.instanceCount = 12
        r.instanceDelay = 0.1
        r.preservesDepth = false
        r.instanceColor = UIColor.cyan.cgColor
        
        let angle = Float(M_PI * 2) / 30
        r.instanceTransform = 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
