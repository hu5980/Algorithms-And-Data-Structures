//: [Previous](@previous)

import Foundation

public class Node {
    var value:Int
    var left:Node?
    var right:Node?
    
    init(_ value:Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}

class Tree {
    
    public var root:Node?
    public var size:Int
    
    init() {
        self.size = 0
        self.root = nil
    }
    
    private func addOne(_ node:Node?,_ value:Int) ->Node {
        if node == nil {
            return Node.init(value)
        }
        
        if node!.value > value {
            node?.left = addOne(node?.left, value)
        }else if  node!.value < value {
            node?.right = addOne(node?.right, value)
        }
        return node!
    }
    
    private func find(_ node:Node?, _ value:Int) -> Node? {
        
        var findNode:Node? = nil
        
        if node == nil {
            return findNode
        }
        
        if node!.value == value {
            findNode = node
        }
        if findNode == nil {
            findNode = find(node?.left, value)
        }
        
        if findNode == nil {
            findNode = find(node?.right, value)
        }
        return findNode
    }
    
    func find(_ value:Int) -> Node? {
        return find(root, value)
    }
    
    
    
    func add(_ value:Int)  {
        root = addOne(root, value)
    }
    
    func printmidSortTree(_ node:Node?) {
        if node != nil {
            printmidSortTree(node?.left)
            print(node!.value)
            printmidSortTree(node?.right)
        }
    }
    
    func printBeforeSortTree(_ node:Node?) {
        if node != nil {
            print(node!.value)
            printmidSortTree(node?.left)
            printmidSortTree(node?.right)
        }
    }
    
    func printAfterSortTree(_ node:Node?) {
        if node != nil {
            printmidSortTree(node?.left)
            printmidSortTree(node?.right)
            print(node!.value)
        }
    }
}


/// 二叉树镜像
///
/// - Parameter node: <#node description#>
/// - Returns: <#return value description#>
func mirrorRecursiverly(_ node:Node?) -> Node? {
    var newNode = node
    if newNode == nil {
        return newNode
    }

    var leftNode = newNode?.left
    newNode?.left = newNode?.right
    newNode?.right = leftNode
    
    newNode?.left = mirrorRecursiverly(newNode?.left)
    newNode?.right = mirrorRecursiverly(newNode?.right)
    return newNode
}

let tree = Tree()
tree.add(5)
tree.add(6)
tree.add(3)
tree.add(4)


tree.printmidSortTree(tree.root)



print("反转后的答案为")

let new =  mirrorRecursiverly(tree.root)
tree.printmidSortTree(new)



//func isSymmetric(_ root: Node?) -> Bool {
//    
//
//}
