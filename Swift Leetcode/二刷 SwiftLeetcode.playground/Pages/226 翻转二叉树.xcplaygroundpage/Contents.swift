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
方法一 递归 采用深度优先遍历来做 
*/
class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil { return nil }
        var temp = root?.left
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
            var temp = node?.left
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


