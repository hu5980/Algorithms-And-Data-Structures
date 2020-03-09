//: [Previous](@previous)

import Foundation

/**
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
     3   6
 输出: false
 解释: 输入为: [5,1,4,null,null,3,6]。
      根节点的值为 5 ，但是其右子节点值为 4 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/validate-binary-search-tree
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

/**
 方法一 使用中序遍历
 */

class Solution {
    func midOrder(_ root: TreeNode? ,_ nums: inout [Int]) {
        if root == nil {
            return
        }
        midOrder(root?.left, &nums)
        nums.append(root!.val)
        midOrder(root?.right, &nums)
    }
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        if root == nil { return true }
        var nums = [Int]()
        midOrder(root, &nums)
        if nums.count < 2  { return true }
    
        for i in 1..<nums.count {
            if nums[i-1] >= nums[i] {  return false }
        }
        return true
    }
}

/**
 采用递归的方式来做
 */
class Solution1 {
    
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBST(root, nil, nil)
    }
    
    func isValidBST(_ root: TreeNode? ,_ min:Int? ,_ max:Int?) -> Bool {
        if root == nil { return true }
        
        if let min = min , root!.val <= min {
            return false
        }
        
        if let max = max , root!.val >= max {
            return false
        }

        return isValidBST(root?.left, min, root?.val) && isValidBST(root?.right, root?.val, max)
        
    }
}
