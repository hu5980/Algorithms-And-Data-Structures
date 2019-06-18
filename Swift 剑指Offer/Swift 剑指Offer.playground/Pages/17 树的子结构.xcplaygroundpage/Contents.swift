//: [Previous](@previous)

import Foundation

/*
 　输入两棵二叉树A和B，判断B是不是A的子结构。我们约定空树不是任意一个树的子结构
 */

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


let tree = Tree()
var nums = [1,4,7,9,3,2,5,-1]
for num in nums {
    tree.add(num)
}



let tree1 = Tree()
var nums1 = [2]
for num in nums1 {
    tree1.add(num)
}

/*
    判断一棵树是不是另一棵树的子树
 1. 首先找出与子树相同的头节点
 2. 找到之后让这个头节点的树与该树进行比较 如果一样则包含有这样的子树 如果不一样 则用另外的与该树头节点相同的子树比较
 */


func isSubTree(_ treeOne:Node? ,_ treeTwo:Node?) -> Bool {
    if treeTwo == nil {
        return true
    }
    
    if treeOne == nil {
        return false
    }
    
    if treeOne?.value != treeTwo?.value {
        return false
    }
    
    return isSubTree(treeOne?.left, treeTwo?.left) && isSubTree(treeOne?.right, treeTwo?.right)
}



func hasSubTree(_ treeOne:Node? ,_ treeTwo:Node?) -> Bool {
    
    var flag = false
    if treeOne == nil || treeTwo == nil {
        return flag
    }
    
    if treeOne!.value == treeTwo!.value {
        flag = isSubTree(treeOne, treeTwo)
    }
    
    if !flag {
        flag = hasSubTree(treeOne?.left, treeTwo)
    }
    
    if !flag{
        flag = hasSubTree(treeOne?.right, treeTwo)
    }
    
    return flag
}

let subTree = hasSubTree(tree.root, tree1.root)
print("subTree = \(subTree)")
