//: [Previous](@previous)

import Foundation

/*
 输入一颗二叉树和一个整数，打印出二叉树中结点值的和为输入整数的所有路径。路径定义为从树的根结点开始往下一直到叶结点所经过的结点形成一条路径
 */


public class Node {
    public var val: Int
    public var left: Node?
    public var right: Node?
    public init(_ val: Int) {
        self.val = val
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
        
        if node!.val > value {
            node?.left = addOne(node?.left, value)
        }else if  node!.val < value {
            node?.right = addOne(node?.right, value)
        }
        return node!
    }
    
    private func find(_ node:Node?, _ value:Int) -> Node? {
        
        var findNode:Node? = nil
        
        if node == nil {
            return findNode
        }
        
        if node!.val == value {
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
    
    func findPath(_ node:Node , _ val:Int ,_ sum: inout Int ,path:inout [Int]) {
        sum += node.val
        path.append(node.val)

        if sum == val {
            print("path is find:")
            for num in path {
                print("\(num)")
            }
        }
        
        if node.left != nil {
            findPath(node.left!, val, &sum, path: &path)
        }
        
        if node.right != nil {
            findPath(node.right!, val, &sum, path: &path)
        }
        
        sum -= path.last!
        path.removeLast()
    }
    
    
    func findPath(_ node:Node? , _ val:Int) -> [Int]? {
        if node == nil {
            return nil
        }
        
        var sum = 0;
        var path = [Int]()
        
        findPath(node!, val, &sum, path: &path)
        
        if path.count > 0 {
            return path
        }else {
            return nil
        }
        
    }
}


let tree = Solution()

let nums1 = [5,3,6,2,4,10,8,7,12,11,19]

let nums2 = [10,8,5,13]

for num in nums2 {
    tree.add(num)
}

tree.findPath(tree.root, 23)
