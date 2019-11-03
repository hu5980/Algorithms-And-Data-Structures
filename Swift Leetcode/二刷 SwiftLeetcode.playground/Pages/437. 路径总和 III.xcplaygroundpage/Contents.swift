//: [Previous](@previous)

import Foundation
/**
 
 给定一个二叉树，它的每个结点都存放着一个整数值。

 找出路径和等于给定数值的路径总数。

 路径不需要从根节点开始，也不需要在叶子节点结束，但是路径方向必须是向下的（只能从父节点到子节点）。

 二叉树不超过1000个节点，且节点数值范围是 [-1000000,1000000] 的整数。

 示例：

 root = [10,5,-3,3,2,null,11,3,-2,null,1], sum = 8

       10
      /  \
     5   -3
    / \    \
   3   2   11
  / \   \
 3  -2   1

 返回 3。和等于 8 的路径有:

 1.  5 -> 3
 2.  5 -> 2 -> 1
 3.  -3 -> 11

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/path-sum-iii
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
    
    private func findPath(_ root: TreeNode?, _ sum: Int) -> Int {
        if root == nil {
            return 0
        }
        var res  = 0
        
        if root!.val == sum {
            res += 1
        }
        res += findPath(root?.left, sum - root!.val)
        res += findPath(root?.right, sum - root!.val)
        return res
    }
    
    func pathSum(_ root: TreeNode?, _ sum: Int) -> Int {
        if root == nil {
            return 0
        }
        
        var res = findPath(root, sum)
        
        res += pathSum(root?.left, sum)
        res += pathSum(root?.right, sum)
        return res
    }
}
