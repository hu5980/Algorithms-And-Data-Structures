//: [Previous](@previous)

import Foundation

class Link{
    
    private var root:Node?
    private var size:Int
    
    class Node {
        var value:Int
        var next:Node?
        
        init(_ value:Int) {
            self.value = value
            self.next = nil
        }
    }
    
    init() {
        self.root = nil
        self.size = 0
    }
    
    
    func getSize() -> Int {
        return size
    }
    
    func add(_ value:Int) {
        root = addOne(root, value)
    }
    
    private func addOne(_ node:Node?, _ value:Int) ->Node {
        if node == nil {
            return Node.init(value)
        }else {
            let newNode = Node.init(value)
            newNode.next = node
            return newNode
        }
    }
    
    func remove(_ value:Int) {
        root = reomve(root, value)
    }
    
    private func reomve(_ node:Node?,_ value:Int) -> Node? {
        
        if node == nil {
            return nil
        }else if node!.value == value {
            return node?.next
        }else {
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
    
    func search(_ value:Int) -> Node? {
        var curNode = root
        while curNode != nil {
            if curNode!.value == value{
                return curNode
            }
            curNode = curNode?.next
        }
        return nil
    }
    
    
    func reversalLink() {
        let reversalRoot =  self.reversalLink(root)
        printfLink(reversalRoot)
    }
    
    private func reversalLink(_ node:Node?) -> Node? {
        var curNode = node
        var newNode:Node? = nil
        
        while curNode != nil {
            newNode = addOne(newNode, curNode!.value)
            curNode = curNode?.next
        }
        return newNode
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


let link = Link()

print("反转前")
link.add(3)
link.add(4)
link.add(5)
link.add(6)
link.add(7)

link.printfLink()

print("反转后")

link.reversalLink()

link.search(4)?.value

print("删除后")
link.remove(7)
link.remove(3)

link.printfLink()

let a = 3.142344

print(a.hashValue)
