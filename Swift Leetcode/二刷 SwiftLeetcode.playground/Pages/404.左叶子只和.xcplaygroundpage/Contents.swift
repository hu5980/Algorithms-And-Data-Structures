//: [Previous](@previous)

import Foundation

/**
 计算给定二叉树的所有左叶子之和。

 示例：

     3
    / \
   9  20
     /  \
    15   7

 在这个二叉树中，有两个左叶子，分别是 9 和 15，所以返回 24

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sum-of-left-leaves
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
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
    
    var sum = 0
    
    /// 判断是否事叶子节点
    private func isLeaves(_ root:TreeNode?) -> Bool{
        return root != nil && root?.left == nil && root?.right == nil
    }
    
    /// 遍历所有的节点
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        if isLeaves(root?.left) {
            sum += root!.left!.val
        }else{
            sumOfLeftLeaves(root?.left)
        }
        sumOfLeftLeaves(root?.right)
        
        return sum
    }
}
