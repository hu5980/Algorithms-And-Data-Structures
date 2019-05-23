//: [Previous](@previous)

import Foundation


class Node {
    var value:Int
    var next:Node?
    var sibling:Node?
    
    init(_ value:Int) {
        self.value = value
        self.next = nil
        self.sibling = nil
    }
}

private func cloneNodes(_ node:Node?) {
    var curNode = node
    while curNode != nil {
        var cloneNode =  Node.init(curNode!.value)
        cloneNode.next = curNode?.next
        cloneNode.sibling = nil
        curNode?.next = cloneNode
        curNode = cloneNode.next
    }
}

private func connectSiblingNodes(_ node:Node?) {
    var curNode = node
    
    while curNode != nil {
        if curNode?.sibling != nil {
            curNode?.next?.sibling = curNode?.sibling?.next
        }
        curNode?.next = curNode?.next?.next
    }
}

private func reconnectNodes(_ node:Node?) -> Node? {
    var curNode = node
    var cloneNode:Node?
    var cloneHead:Node?
    
    if curNode != nil {
        cloneHead = curNode!.next
        cloneNode = curNode!.next
        curNode?.next = cloneHead?.next
        curNode = curNode?.next
    }
    
    while curNode != nil {
        cloneHead?.next = curNode?.next
        cloneNode = cloneNode?.next
        curNode?.next = cloneNode?.next
        curNode = curNode?.next
    }
    
    return cloneHead
}

func clone(_ node:Node?) -> Node? {
    cloneNodes(node)
    connectSiblingNodes(node)
    let newNode =  reconnectNodes(node)
    return newNode
}

