//: Playground - noun: a place where people can play

import UIKit

public class Node {
    var data : Int
    var next : Node?
    
    init(data : Int) {
        self.data = data
    }
}
    
var head : Node = Node(data : 1)
print(head.data)

var newNode : Node = Node(data : 2)
head.next = newNode

if let node = head.next {
    print(node.data)
}


public class NodeDouble {
    var data : Int
    var next : NodeDouble?
    var prev : NodeDouble?
    
    init(data : Int) {
        self.data = data
    }
    
}

