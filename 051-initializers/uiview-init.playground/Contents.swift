//: Playground - noun: a place where people can play

import UIKit

class SpecialView: UIView {
    
    init(location: CGPoint) {
        let size = CGSize(width: 100, height: 100)
        let rect = CGRect(origin: location, size: size)
        
        super.init(frame: rect)
        
        backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
