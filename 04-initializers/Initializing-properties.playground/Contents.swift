//: Playground - noun: a place where people can play

import UIKit

class Record {
    static var count: Int = 0
    
    let id: Int
    
    init() {
        Record.count += 1
        id = Record.count
    }
}

class Message: Record {
    let name: String
    let text: String
    let time: Date
    var received: Bool
    
    init(name: String, text: String, date: Date, received: Bool) {
        self.name = name
        self.text = text
        self.time = date
        self.received = false
        
        super.init()
    }
    
    convenience init(name: String, text: String) {
        self.init(name: name, text: text, date: Date(), received: false)
    }
}

let m = Message(name: "A", text: "AAA")
print(m.id)
let n = Message(name: "B", text: "BBB")
print(n.id)

