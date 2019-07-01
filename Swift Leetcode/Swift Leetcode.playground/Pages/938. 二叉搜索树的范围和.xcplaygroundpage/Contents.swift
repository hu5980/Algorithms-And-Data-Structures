import Foundation

/*:
 
 [二叉搜索树的范围和](https://leetcode-cn.com/problems/range-sum-of-bst)
 
 给定二叉搜索树的根结点 root，返回 L 和 R（含）之间的所有结点的值的和。
 
 二叉搜索树保证具有唯一的值。
 
   
 
 示例 1：
 
 输入：root = [10,5,15,3,7,null,18], L = 7, R = 15
 输出：32
 示例 2：
 
 输入：root = [10,5,15,3,7,13,18,1,null,6], L = 6, R = 10
 输出：23
   
 
 提示：
 
 树中的结点数量最多为 10000 个。
 最终的答案保证小于 2^31。
 
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
     运用递归 加 减支
     */
    func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
        guard root != nil else {
            return 0
        }
        if root!.val < L  {
            return rangeSumBST(root?.right, L, R)
        }
        if root!.val  > R {
            return rangeSumBST(root?.left, L, R)
        }
        return root!.val + rangeSumBST(root?.right, L, R) + rangeSumBST(root?.left, L, R)
    }
}
