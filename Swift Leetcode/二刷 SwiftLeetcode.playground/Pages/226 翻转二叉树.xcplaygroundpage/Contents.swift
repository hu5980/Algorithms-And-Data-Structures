//: [Previous](@previous)

import Foundation

/**
 翻转一棵二叉树。

 示例：

 输入：

      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 输出：

      4
    /   \
   7     2
  / \   / \
 9   6 3   1

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/invert-binary-tree
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
方法一 递归 采用深度优先遍历来做 
*/
class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil { return nil }
        let temp = root?.left
        root?.left = root?.right
        root?.right = temp
        
        invertTree(root?.left)
        invertTree(root?.right)

        return root
    }
}

/**
 方法二 迭代 采用层序遍历 来做
 */
class Solution1 {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
       if root == nil { return nil }
       var queue = [TreeNode?]()
        queue.append(root)
        while !queue.isEmpty {
            let node =  queue.removeLast()
            let temp = node?.left
            node?.left = node?.right
            node?.right = temp
            if root?.left != nil {
                 queue.append(root?.left)
            }
           
            if root?.right != nil {
                queue.append(root?.right)
            }
        }
        return root
    }
}


