//: [Previous](@previous)

import Foundation

/*
 链表中倒数第K个节点
 */

class Link {
    
    public class Node {
        var value:Int
        var next:Node?
        
        init(_ value:Int) {
            self.value = value
            self.next = nil
        }
    }
    
    private var root:Node?
    private var size:Int
    
    init() {
        self.size = 0
        self.root = nil
    }
    
    private func addOne(_ node:Node?,_ value:Int) ->Node {
        if node == nil {
            return Node.init(value)
        }else{
            let newNode = Node.init(value)
            newNode.next = node
            return newNode
        }
    }
    
    
    func add(_ value:Int)  {
        root = addOne(root, value)
    }
    
    private func removeOne(_ node:Node?,_ value:Int)->Node? {
        if node == nil {
            return nil
        }else if(node!.value == value){
            return node?.next
        }else{
            var curNode = node?.next
            var perNode = node
            while curNode != nil {
                if curNode!.value == value {
                    perNode?.next = curNode?.next
                    curNode?.next = nil
                    return root
                }
                curNode = curNode?.next
                perNode = perNode?.next
            }
            return root
        }
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
    
    func firstNode() -> Node? {
        return root
    }
    
    func remove(_ value:Int) {
        root = removeOne(root, value)
    }
    
    
    func reciprocal_k_Node(_ k:Int) -> Node? {
    return reciprocal_k_Node(root, k)
    }
    
    private func reciprocal_k_Node(_ node:Node? ,_ k:Int) -> Node? {
        if node == nil || k < 1 {
            return nil
        }
        
        var phead:Node? = node
        var qhead:Node? = nil
        
        for _ in 1..<k {
            if phead?.next != nil {
                phead = phead?.next
            } else {
                return qhead
            }
        }
        
        qhead = node
        
        while phead?.next != nil {
            phead = phead?.next
            qhead = qhead?.next
        }
        
        return qhead
    }
    
}


let link = Link()
link.add(1)
link.add(2)
link.add(3)
link.add(4)

let node = link.reciprocal_k_Node(3)

print(node!.value)
