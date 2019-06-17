//: [Previous](@previous)

import Foundation

class Link {
    
    class Node {
        var value:Int
        var next:Node?
        
        init(_ value:Int) {
            self.value = value
            self.next = nil
        }
        
//        static func == (lhs: Node?, rhs: Node?) -> Bool {
//           return true
//        }
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
    
    
    
    /// 在O(1)时间内删除节点
    ///
    /// - Parameters:
    ///   - node: 节点
    ///   - toBeDeleteNode: 删除的节点
    /// - Returns: 返回的节点
//    func deleteNode(head:inout Node?,toBeDeleted:inout Node?) {
//        var node:Node?
//        guard let headNode = head,let deleteNode = toBeDeleted else {
//            return
//        }
//
//        if head == toBeDeleted { //删除是表头
//            node = headNode.next!
//            head = node
//        } else {
//            if deleteNode.next == nil { // 删除的最后节点是尾节点
//                node = headNode
//                while node?.next != toBeDeleted {
//                    node = node?.next
//                }
//                node?.next = nil
//            } else {
//                node = deleteNode.next!
//                deleteNode.value = node?.value
//                deleteNode.next = node?.next
//            }
//        }
//    }
    
    func removeFistNode() {
     //   deleteNode(head: &root, toBeDeleted: &root)
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
}

let link = Link()
link.add(1)
link.add(2)
link.add(3)
link.add(4)
link.add(5)

link.remove(4)

link.printfLink()

link.removeFistNode()
link.printfLink()
