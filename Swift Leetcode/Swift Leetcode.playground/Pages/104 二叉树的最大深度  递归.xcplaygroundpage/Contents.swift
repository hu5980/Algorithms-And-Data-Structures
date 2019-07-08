
import Foundation

/*:
 [二叉树的最大深度](https://leetcode-cn.com/problems/maximum-depth-of-binary-tree)
 
 定一个二叉树，找出其最大深度。
 
 二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。
 
 说明: 叶子节点是指没有子节点的节点。
 
 示例：
 给定二叉树 [3,9,20,null,null,15,7]，
 
   3
  /  \
 9  20
    /  \
   15   7
 
 返回它的最大深度 3 。
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


/*:
 方法一 ：递归
 */

class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        return 1 + max(maxDepth(root?.left), maxDepth(root?.right))
    }
}

/*
 方法二 迭代法
 */

class Solution1 {
    
    struct NewTreeNode {
        public var depth:Int
        public var node:TreeNode
        init(_ node:TreeNode,_ depth:Int) {
            self.depth = depth
            self.node = node
        }
    }

    func maxDepth(_ root: TreeNode?) -> Int {
        var maxDepth = 0
        if root == nil {
            return maxDepth
        }
        
        var queue:[NewTreeNode] = [NewTreeNode]()
        queue.append(NewTreeNode(root!, 1))
        while queue.count > 0 {
            let newNode = queue.removeFirst()
            maxDepth = max(maxDepth, newNode.depth)
            if newNode.node.left != nil {
                queue.append(NewTreeNode.init(newNode.node.left!, maxDepth + 1))
            }
            if newNode.node.right != nil {
                queue.append( NewTreeNode.init(newNode.node.right!, maxDepth + 1))
            }
            
        }
        return maxDepth
    }
}

