//: [Previous](@previous)

import Foundation

/*:
 [对称二叉树](https://leetcode-cn.com/problems/symmetric-tree)
 
 给定一个二叉树，检查它是否是镜像对称的。
 
 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。
 
    1
   / \
  2   2
 / \ / \
3  4 4  3
 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:
 
   1
  / \
 2   2
  \   \
  3    3
 说明:
 
 如果你可以运用递归和迭代两种方法解决这个问题，会很加分。

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
 方法一 递归解决
 */

func isMirror(_ left:TreeNode? ,_ right:TreeNode?) -> Bool{
    if left == nil && right != nil  || left != nil && right == nil{
        return false
    }
    if left == nil && right == nil {
        return true
    }
    
    return left!.val == right!.val &&
        isMirror(left?.left, right?.right) &&
        isMirror(left?.right, right?.left)
}


func isSymmetric(_ root: TreeNode?) -> Bool {
    return isMirror(root?.left,root?.right)
}


class Solution {
    
    func isMirror(_ left: TreeNode? ,_ right:TreeNode?) ->Bool {
        if left == nil && right != nil || left != nil && right == nil  {
            return false
        }
        return left?.val  == right?.val && isMirror(left?.left, right?.right) && isMirror(left?.right, right?.left)
    }
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard root != nil else { return true }
        return isMirror(root?.left, root?.right)
    }
}

let s = Solution()


/*
 方法二 迭代法
 */
