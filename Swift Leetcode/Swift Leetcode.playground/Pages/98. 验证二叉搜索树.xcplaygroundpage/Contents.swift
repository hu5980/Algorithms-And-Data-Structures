//: [Previous](@previous)

import Foundation
/*:
 
 [验证二叉树](https://leetcode-cn.com/problems/validate-binary-search-tree)
 
 给定一个二叉树，判断其是否是一个有效的二叉搜索树。
 
 假设一个二叉搜索树具有如下特征：
 
 节点的左子树只包含小于当前节点的数。
 节点的右子树只包含大于当前节点的数。
 所有左子树和右子树自身必须也是二叉搜索树。
 示例 1:
 
 输入:
   2
  / \
 1   3
 输出: true
 示例 2:
 
 输入:
     5
    / \
   1   4
       / \
       3  6
 输出: false
 解释: 输入为: [5,1,4,null,null,3,6]。
           根节点的值为 5 ，但是其右子节点值为 4
 
 
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
 方法一 采用中序遍历来做
 */
class Solution {
    func _kisValidBST(_ root: TreeNode?,_ vals:inout [Int]) {
        if root == nil { return  }
        _kisValidBST(root?.left, &vals)
        vals.append(root!.val)
        _kisValidBST(root?.right, &vals)
    }

    func isValidBST(_ root: TreeNode?) -> Bool {
        var res = true
        var vals = [Int]()
        _kisValidBST(root, &vals)
        if vals.count < 2 { return res }
        for i in 1..<vals.count {
            if vals[i] <= vals[i-1] {
                res = false
            }
        }
        return res
    }
}

/*:
 方法二 ：递归
 */
class Solution1 {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return helper(root,nil,nil)
    }
    
    func helper(_ root:TreeNode?, _ min: Int?,_ max: Int?) -> Bool{
        guard let root = root else{
            return true
        }
        if let min = min , root.val <= min{
            return false
        }
        if let max = max , root.val >= max{
            return false
        }
        return helper(root.left, min,root.val) && helper(root.right,root.val,max)
    }
}


