//: [Previous](@previous)

import Foundation


/*:
 
 [二叉树的最小深度](https://leetcode-cn.com/problems/minimum-depth-of-binary-tree)
 
 给定一个二叉树，找出其最小深度。
 
 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。
 
 说明: 叶子节点是指没有子节点的节点。
 
 示例:
 
 给定二叉树 [3,9,20,null,null,15,7],
 
   3
  /  \
  9  20
    /  \
   15   7
 返回它的最小深度  2.
 

 
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


/*
 方法一 ：使用递归求解
 */

func minDepth(_ root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    
    if root?.left == nil && root?.right == nil {
        return 1
    }
    
    var minDeep = Int.max
    
    if root?.left != nil  {
        minDeep = min(minDeep, minDepth(root?.left))
    }
    
    if root?.right != nil   {
        minDeep = min(minDeep, minDepth(root?.right))
    }
    
    
    
    return 1 + minDeep
}


/*
 方法二 使用递归：
 这里重写了 min 方法
 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。在[1, 2]对应的树中，很明显，结点1不是叶子结点，结点2才是。所以比较的时候 如何左边是0 返回右边的最小值 ，右边是0 返回左边的最小值 左边小于右边返回左边 ，否则就是右边
 */

func min(_ a: Int, _ b: Int) -> Int {
    if a == 0 {
        return b
    } else if b == 0 {
        return a
    }
    return a < b ? a : b
}

func minDepth_1(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    
    //min(minDepth(root?.left), minDepth(root?.right))
    
    return min(minDepth_1(root.left), minDepth_1(root.right)) + 1
}

class Solution {
    struct NewTreeNode {
        public var depth:Int
        public var node:TreeNode
        init(_ node:TreeNode,_ depth:Int) {
            self.depth = depth
            self.node = node
        }
    }
    
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        var minDepth = Int.max
        var queue:[NewTreeNode] = [NewTreeNode]()
        queue.append(NewTreeNode(root!, 1))
        while queue.count > 0 {
            let newNode = queue.removeFirst()
            let currentDepth = newNode.depth
            if newNode.node.left == nil && newNode.node.right == nil {
                minDepth = min(minDepth, currentDepth)
            }
            if newNode.node.left != nil {
                queue.append(NewTreeNode.init(newNode.node.left!, currentDepth + 1))
            }
            if newNode.node.right != nil {
                queue.append( NewTreeNode.init(newNode.node.right!, currentDepth + 1))
            }
        }
        return minDepth
    }
}
