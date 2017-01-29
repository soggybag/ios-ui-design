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
        
        print("????")
        
        let replicatorLayer = CAReplicatorLayer()
        
        let redSquare = CALayer()
        redSquare.backgroundColor = UIColor.red.cgColor
        redSquare.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        
        let instanceCount = 5
        
        replicatorLayer.instanceCount = instanceCount
        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(110, 0, 0)
        
        let offsetStep = -1 / Float(instanceCount)
        replicatorLayer.instanceBlueOffset = offsetStep
        replicatorLayer.instanceGreenOffset = offsetStep
        
        replicatorLayer.addSublayer(redSquare)
        
        print(replicatorLayer.instanceCount)
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
