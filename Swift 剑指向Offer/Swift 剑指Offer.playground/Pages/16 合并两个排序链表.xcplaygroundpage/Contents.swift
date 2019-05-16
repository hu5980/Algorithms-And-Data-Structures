//: [Previous](@previous)

import Foundation

class Link {
    
    public var root:Node?
    public var size:Int
    
    class Node {
        var value:Int
        var next:Node?
        
        init(_ value:Int) {
            self.value = value
            self.next = nil
        }
    }
    
    init() {
        root = nil
        size = 0
    }
    
    private func addOne(_ node:Node? ,_ value:Int) -> Node {
        if node == nil {
            return Node.init(value)
        }else {
            let newNode = Node.init(value)
            newNode.next = node
            return newNode
        }
    }
    
    // 有顺序的添加到链表中
    private func addOneSorted(_ node:Node? ,_ value:Int) -> Node {
        if node == nil {
            return Node.init(value)
        }else if node!.value <= value {
            let newNode = Node.init(value)
            newNode.next = node
            return newNode
        }else {
            var pNode = node
            var qNode = node?.next
            
            while qNode != nil {
                if value >= qNode!.value {
                    let newNode = Node.init(value)
                    newNode.next = pNode?.next
                    pNode?.next = newNode
                    return node!
                }
                qNode = qNode?.next
                pNode = pNode?.next
            }
            pNode?.next = Node.init(value)
            return node!
        }
    }
    
    
    /// 合并两个有序的链表
    ///
    /// - Parameters:
    ///   - linkOne: 链表1
    ///   - linkTwo: 链表2
    /// - Returns: 新的链表
    func mergeTwoLink(_ linkOne: Node? , _ linkTwo:Node?) -> Node? {
        if linkOne == nil || linkTwo == nil {
            return linkOne == nil ? linkTwo : linkOne
        }
        var newNodeTwo = linkTwo
        var newNodeOne = linkOne
        while newNodeOne != nil {
            newNodeTwo = addOneSorted(newNodeTwo, newNodeOne!.value)
            newNodeOne = newNodeOne?.next
        }
        return newNodeTwo
    }
    
    func mergeTwoLink_A(_ linkOne: Node? , _ linkTwo:Node?) -> Node? {
        if linkOne == nil || linkTwo == nil {
            return linkOne == nil ? linkTwo : linkOne
        }
        
        var newNode:Node
        
        if linkOne!.value > linkTwo!.value {
            newNode = linkOne!
            newNode.next = mergeTwoLink(linkOne?.next, linkTwo)
        }else {
            newNode = linkTwo!
            newNode.next = mergeTwoLink(linkOne, linkTwo?.next)
        }
        return newNode
    }
    
    func printMergeLink(_ node:Node?) {
        printfLink(node)
    }
    
    func add(_ value:Int) {
        root = addOneSorted(root, value)
    }
    
    func printfLink() {
        printfLink(root)
    }
    
    private func printfLink(_ node:Node?)  {
        var pNode = node
        while pNode != nil {
            print("\(pNode!.value)")
            pNode = pNode?.next
        }
    }
}


let link1 = Link()
link1.add(5)

link1.add(22)

//print("有序链表1")
//link1.printfLink()

let link2 = Link()
link2.add(1)
link2.add(2)

//print("有序链表2")
//link2.printfLink()

print("有序链表1与有序链表2合并")
let mergeLink = Link().mergeTwoLink_A(link1.root, link2.root)

//let mergeLink1 = Link().mergeTwoLink(link1.root, link2.root)

Link().printMergeLink(mergeLink)
print("有序链表1与有序链表2合并1")
//Link().printMergeLink(mergeLink1)
