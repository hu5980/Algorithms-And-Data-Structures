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
