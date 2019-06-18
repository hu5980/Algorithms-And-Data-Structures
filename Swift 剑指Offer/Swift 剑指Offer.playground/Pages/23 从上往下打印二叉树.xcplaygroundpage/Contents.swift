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
    
    // 层序遍历
    /*
     主要思路 用一个队列 利用队列先入先出的特性 ，先把root节点入队 然后出队 再把左右子树入队 只要队列不为0 就打印
     */
    func printLayerSortTree(_ node:Node?) {
        if node == nil {
            return
        }
        var queue = [Node]()
        queue.append(node!)
        while queue.count > 0 {
            let node = queue.removeFirst()
            print(node.value)
            
            if node.left != nil {
                queue.append(node.left!)
            }
            
            if node.right != nil {
                queue.append(node.right!)
            }
        }
    }
}


let tree = Tree()
tree.add(5)
tree.add(3)
tree.add(4)
tree.add(1)
tree.add(2)
tree.add(6)
tree.add(7)

tree.printmidSortTree(tree.root)

print("--------------")

tree.printLayerSortTree(tree.root)
