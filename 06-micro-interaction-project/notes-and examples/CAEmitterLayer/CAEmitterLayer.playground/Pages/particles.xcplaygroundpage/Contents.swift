import PlaygroundSupport
import UIKit


let container = setupIphoneView()
PlaygroundPage.current.liveView = container

let emitter = CAEmitterLayer()
emitter.emitterSize = container.frame.size

var point = emitter.position

emitter.emitterPosition = CGPoint(x: container.frame.midX, y: container.frame.size.height + 30
)


let cell = CAEmitterCell()
let likeImage = #imageLiteral(resourceName: "like.png").cgImage

cell.contents = likeImage
cell.minificationFilter = kCAFilterTrilinear
cell.scale = 0.01
cell.scaleRange = 1.5
cell.scaleSpeed = -0.15

cell.birthRate = 13

//Life in seconds
cell.lifetime = 15
cell.lifetimeRange = 4

//Magnitude of initial velocity with which particles travel
cell.velocity = 120
cell.velocityRange = 60

cell.alphaRange = 0.5
cell.alphaSpeed = -0.1

cell.spin = .pi * 2
cell.spinRange = .pi / 2

cell.emissionLongitude = (3 * .pi / 2)
cell.emissionRange = 7 * .pi / 12

emitter.emitterCells = [cell]
cell.speed = 2

emitter.birthRate = 3
emitter.speed = 0.2

container.layer.addSublayer(emitter)
