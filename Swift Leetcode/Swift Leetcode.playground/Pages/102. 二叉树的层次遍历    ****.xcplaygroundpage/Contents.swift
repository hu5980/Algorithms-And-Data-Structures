//: [Previous](@previous)

import Foundation

/*:
 
 [层序遍历](https://leetcode-cn.com/problems/binary-tree-level-order-traversal)
 
 给定一个二叉树，返回其按层次遍历的节点值。 （即逐层地，从左到右访问所有节点）。
 
 例如:
 给定二叉树: [3,9,20,null,null,15,7],
 
 3
 / \
 9  20
 /  \
 15   7
 返回其层次遍历结果：
 
 [
 [3],
 [9,20],
 [15,7]
 ]
 
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

class Solution {

    /*
     最简单的解法就是递归，首先确认树非空，然后调用递归函数 levelOrder(node, level)，参数是当前节点和节点的层次。程序过程如下：
     
     输出列表称为 res，当前最高层数就是列表的长度 res.count。比较访问节点所在的层次 level 和当前最高层次 res.count 的大小，如果前者更大就向 res 添加一个空列表。
     将当前节点插入到对应层的列表 res[level] 中。
     递归非空的孩子节点：levelOrder(node.left / node.right, level + 1)。
     
     */
    
    var res = [[Int]]()

    func levelOrder(_ root: TreeNode ,_ level:Int) {
        if res.count == level {
            res.append([Int]())
        }
        res[level].append(root.val)
        if root.left != nil {
            levelOrder(root.left!, level + 1)
        }
        
        if root.right != nil {
            levelOrder(root.right!, level + 1)
        }
    }

    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else { return res }
        levelOrder(root!, 0)
        return res
    }
}



class Solution1 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        
    }
}
