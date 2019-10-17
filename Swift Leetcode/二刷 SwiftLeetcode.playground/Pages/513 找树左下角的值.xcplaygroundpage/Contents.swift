//: [Previous](@previous)

import Foundation

/**
 给定一个二叉树，在树的最后一行找到最左边的值。

 示例 1:

 输入:

     2
    / \
   1   3

 输出:
 1
  

 示例 2:

 输入:

         1
        / \
       2   3
      /   / \
     4   5   6
        /
       7

 输出:
 7

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/find-bottom-left-tree-value
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
 方法一 ： 采用层序遍历来做
 */


class Solution {
    func findBottomLeftValue(_ root: TreeNode?) -> Int {
        var data:[[TreeNode?]] = [[TreeNode?]]()
        var floorData:[TreeNode?] = [root]
        var index = -1
        
        
        while floorData.count > 0 {
            var curNode = floorData.removeFirst()
           
            if curNode?.left != nil {
                
            }
        }
        
        return data.last![0]!.val
    }
}
