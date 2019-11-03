//: [Previous](@previous)

import Foundation

/**
 给定一个二叉树，返回所有从根节点到叶子节点的路径。
 
 说明: 叶子节点是指没有子节点的节点。
 
 示例:
 
 输入:
 
   1
 /   \
 2     3
 \
 5
 
 输出: ["1->2->5", "1->3"]
 
 解释: 所有根节点到叶子节点的路径为: 1->2->5, 1->3
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/binary-tree-paths
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

    /// 判断是否事叶子节点
    private func isLeaves(_ root:TreeNode?) -> Bool{
        return root != nil && root?.left == nil && root?.right == nil
    }
    
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var strs:[String] = [String]()
        if root == nil {
            return strs
        }
        if isLeaves(root) {
            strs.append("\(root!.val)")
        }
        let leftStrs = binaryTreePaths(root?.left)
        for str in leftStrs {
            strs.append("\(root!.val)"+"->"+str)
        }
        let rightStrs = binaryTreePaths(root?.right)
        for str in rightStrs {
            strs.append("\(root!.val)"+"->"+str)
        }
        return strs
    }
}
