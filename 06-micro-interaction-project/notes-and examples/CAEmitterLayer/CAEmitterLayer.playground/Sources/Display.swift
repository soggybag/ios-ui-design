import Foundation
import UIKit
import PlaygroundSupport


public func setupIphoneView(_ color1: UIColor = #colorLiteral(red: 0.2278653988, green: 0.2446833879, blue: 0.7450980392, alpha: 1), _ color2: UIColor = #colorLiteral(red: 0.09803921569, green: 0.262745098, blue: 0.5843137255, alpha: 1), size: CGSize = CGSize(width: 400, height: 700)) -> UIView {
    let container = UIView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
    
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = container.frame
    
    gradientLayer.colors = [color1.cgColor, color2.cgColor]
    gradientLayer.locations = [0.0, 1.0]
    
    container.layer.addSublayer(gradientLayer)
    
    return container
}
