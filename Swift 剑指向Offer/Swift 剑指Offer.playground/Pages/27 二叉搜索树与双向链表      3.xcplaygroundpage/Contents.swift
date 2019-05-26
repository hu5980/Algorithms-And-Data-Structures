//: [Previous](@previous)

import Foundation

/*
 输入一棵二叉搜索树，将该二叉搜索树转换成一个排序的双向链表。要求不能创建任何新的结点，只能调整树中结点指针的指向。比如输入下图中左边的二叉搜索树，则输出转换之后的排序双向链表。
 */

class Node {
    var value:Int
    var left:Node?
    var right:Node?
    
    init(_ value:Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}

class Solution {
    
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
    
    
    var leftHead:Node?
    var rightHead:Node?
    
    func convertTwoWayList(rootNode:Node?) -> Node? {
        convertSubList(rootNode: rootNode)
        return leftHead
    }
    
    private func convertSubList(rootNode:Node?) {
        if rootNode == nil {
            return
        }
        convertSubList(rootNode: rootNode?.left)
        
        if rightHead == nil {
            leftHead = rootNode
            rightHead = rootNode
        } else {
            // 右节点和根节点双向指针  注意更新右节点
            rightHead?.right = rootNode
            rootNode?.left = rightHead
            rightHead = rootNode
        }
        convertSubList(rootNode: rootNode?.right)
    }
    
    func printList(_ node:Node?) {
        var newNode = node
        while newNode != nil {
            print(newNode!.value)
            newNode = newNode?.right
        }
    }
}

let tree = Solution()

tree.add(6)
tree.add(4)
tree.add(5)
tree.add(3)
tree.add(8)
tree.add(7)


let root = tree.convertTwoWayList(rootNode: tree.root)

tree.printList(root)
