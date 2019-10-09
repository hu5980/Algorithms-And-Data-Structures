//: [Previous](@previous)

import Foundation

/*:
 给定一个非空二叉树，返回其最大路径和。
 
 本题中，路径被定义为一条从树中任意节点出发，达到任意节点的序列。该路径至少包含一个节点，且不一定经过根节点。
 
 示例 1:
 
 输入: [1,2,3]
 
 1
 / \
 2   3
 
 输出: 6
 示例 2:
 
 输入: [-10,9,20,null,null,15,7]
 
    -10
    / \
   9  20
     /  \
    15   7
 
 输出: 42
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-maximum-path-sum
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
    func maxPathSum(_ root: TreeNode?) -> Int {
        var val = Int.min
        maxPathSum(root, &val)
        return val
    }
    
    func maxPathSum(_ root: TreeNode? , _ val:inout Int) -> Int {
        if root == nil {
            return 0
        }
        let left = maxPathSum(root?.left, &val)
        let right = maxPathSum(root?.right, &val)
        let lmr = root!.val + max(0, left) + max(0, right);
        let ret = root!.val + max(0, max(left, right));
        val = max(val, max(lmr, ret));
        return ret;
    }
}

class Solution1 {
    
    var ret = Int.min
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        maxSum(root)
        return ret
    }
    
    func maxSum(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let left = max(0, maxSum(root?.left)), right = max(0, maxSum(root?.right))
        ret = max(ret, left + right + root!.val)
        return max(left, right) + root!.val
    }
}
