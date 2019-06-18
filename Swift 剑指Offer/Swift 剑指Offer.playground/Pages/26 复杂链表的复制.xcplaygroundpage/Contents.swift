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

/*第一步仍然是根据原始链表的每个结点N创建对应的N'。（把N'链接在N的后面）*/
private func cloneNodes(_ node:Node?) {
    var curNode = node
    while curNode != nil {
        let cloneNode =  Node.init(curNode!.value)
        cloneNode.next = curNode?.next
        cloneNode.sibling = nil
        curNode?.next = cloneNode
        curNode = cloneNode.next
    }
}

/*第二步设置复制出来的结点的Sibling。（把N'的Sibling指向N的Sibling）*/
private func connectSiblingNodes(_ node:Node?) {
    let curNode = node
    
    while curNode != nil {
        if curNode?.sibling != nil {
            curNode?.next?.sibling = curNode?.sibling?.next
        }
        curNode?.next = curNode?.next?.next
    }
}

/*第三步把这个长链表拆分成两个链表：把奇数位置的结点用Next链接起来就是原始链表，偶数数值的则是复制链表*/
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

