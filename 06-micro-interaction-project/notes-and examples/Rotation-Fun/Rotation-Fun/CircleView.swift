//
//  CircleView.swift
//  Rotation-Fun
//
//  Created by mitchell hudson on 2/4/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import UIKit

class CircleView: UIView {

    // Make a couple layers to draw things
    let circleShapeLayer = CAShapeLayer()   // This draws the circle
    let markLayer = CALayer()               // This draws the small red circle
    
    
    // MARK: - Computed properties
    
    // use the property to set the rotation of this layer.
    var value: Float = 0 {
        didSet {
            // We need this to disable the implicit animation. Try removing (*) and see what happens.
            CATransaction.begin()                       // *
            CATransaction.setDisableActions(true)       // *
            circleShapeLayer.strokeEnd = CGFloat(value) // Set the stroke end point this draws the stroke.
            positionMark()                              // This moves the red dot to the end of the stroke.
            CATransaction.commit()                      // *
        }
    }
    
    
    // MARK: - Initilizers 
    
    // 1) init from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    // 1) init from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    // 2) Called when the view is drawn. We need this becuase it is invoked when constraints are applied.
    override func layoutSubviews() {
        setup()
    }
    
    func setup() {
        // Add out layers as sublayers
        layer.addSublayer(circleShapeLayer)
        layer.addSublayer(markLayer)
        // Call the helper methods to draw things.
        drawCircle()
        drawMark()
    }
    
    
    // MARK: - Utility methods
    
    func drawCircle() {
        // Draws the dashed circle. We'll handle this with a path.
        let path = UIBezierPath()           // Make a path.
        let c = CGPoint(x: bounds.width / 2, y: bounds.height / 2) // Find the center
        let r = bounds.width / 2 - 20       // Define a radius
        
        // Here we define the starting and ending point of the circle in radians.
        // Ask me if you want to talk about the math here.
        let start = CGFloat(M_PI * 2 * 3 / 8)   // Start at 3/8th around the circle
        let end = CGFloat(M_PI * 2 * 9 / 8)     // end at 9/8th abound the circle
        
        // Make an arcing path around the center from the start angle to the end angle.
        path.addArc(withCenter: c, radius: r, startAngle: start, endAngle: end, clockwise: true)
        
        // Add the path to the layer.
        circleShapeLayer.path = path.cgPath
        
        // Set the drawing options
        circleShapeLayer.strokeColor = UIColor.black.cgColor    // Stroke Color
        circleShapeLayer.fillColor = UIColor.clear.cgColor      // Fill color
        circleShapeLayer.lineWidth = 10                         // line width
        circleShapeLayer.lineDashPattern = [2, 5]               // use a dashed line 1 pixel with 5 pixels spacing
        
    }
    
    func drawMark() {
        let size: CGFloat = 20
        markLayer.frame = CGRect(x: 0, y: 0, width: size, height: size)
        markLayer.backgroundColor = UIColor.red.cgColor
        markLayer.cornerRadius = size / 2
        
        // markLayer.anchorPoint = CGPoint(x: 120, y: 0)
        // markLayer.position = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        
        positionMark()
    }
    
    func positionMark() {
        
        
        let start = CGFloat(M_PI * 2 * 3 / 8)
        let range = CGFloat(M_PI * 2 * 0.75)
        let r = bounds.width / 2 - 20
        let c = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        
        let t = start + CGFloat(value) * range
        let x = CGFloat(cos(t)) * r + c.x
        let y = CGFloat(sin(t)) * r + c.y
        
        markLayer.position = CGPoint(x: x, y: y)
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
