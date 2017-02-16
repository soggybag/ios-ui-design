//: [Previous](@previous)

import Foundation
import PlaygroundSupport
import UIKit

let container = setupIphoneView(UIColor.black, UIColor.black, size: CGSize(width: 500, height: 700))
PlaygroundPage.current.liveView = container


// Emitter
let starsEmitter = CAEmitterLayer()
starsEmitter.emitterPosition = CGPoint(x: container.frame.midX, y: -50)
starsEmitter.emitterShape = kCAEmitterLayerSurface
starsEmitter.emitterMode = kCAEmitterLayerSurface


let starsCell = CAEmitterCell()
starsCell.scale = 0.15
starsCell.scaleRange = 0.4

starsCell.birthRate = 10
starsCell.lifetime = 10
starsCell.lifetimeRange = 2
starsCell.contents = #imageLiteral(resourceName: "particle.png").cgImage

starsCell.velocityRange = 100
starsCell.emissionLongitude = .pi
starsCell.yAcceleration = 15

starsEmitter.emitterCells = [starsCell] 

container.layer.addSublayer(starsEmitter)

