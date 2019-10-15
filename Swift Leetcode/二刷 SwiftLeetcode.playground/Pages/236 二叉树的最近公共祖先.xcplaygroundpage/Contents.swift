//: [Previous](@previous)

import Foundation

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
    func lowestCommonAncestor(_ root:TreeNode?, _ p:TreeNode?, _ q:TreeNode?) -> TreeNode? {
        if root == nil || root?.val == p?.val || root?.val == q?.val { return root }
        let left = lowestCommonAncestor(root?.left, p, q)
        let right = lowestCommonAncestor(root?.right, p, q)
        return left == nil ? right :(right == nil ? left : root)
    }
}
