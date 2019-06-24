//: [Previous](@previous)

import Foundation

/*:
 
 [二叉树的所有路径](https://leetcode-cn.com/problems/binary-tree-paths)
 
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
         1.递归层次递归其他参数
         2.递归终止条件
         3.当前处理逻辑
         4.下一层递归
         5.是否恢复当前层参数
     */
    
    func binaryTreePaths(_ root:TreeNode,_ path:String ,_ res:inout [String]) {
        
        let path  =  (path == "") ? "\(root.val)" : (path + "->\(root.val)")
        if root.left == nil  && root.right == nil{
            res.append(path)
            return
        }
        
        if root.left == nil && root.right != nil {
            binaryTreePaths(root.right!, path, &res)
        }else if root.right == nil && root.left != nil {
            binaryTreePaths(root.left!, path, &res)
        }else {
            binaryTreePaths(root.left!, path, &res)
            binaryTreePaths(root.right!, path, &res)
        }
    }
    
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var res:[String] = [String]()
        let path = ""
        if root == nil { return res }
        binaryTreePaths(root!, path, &res)
        return res
    }
}


class Solution_1 {
    
    /*
     1.递归层次递归其他参数
     2.递归终止条件
     3.当前处理逻辑
     4.下一层递归
     5.是否恢复当前层参数
     */
    
    func binaryTreePaths(_ root:TreeNode?,_ path:String ,_ res:inout [String]) {
        var path = path
        guard root != nil else {
            return
        }
        if root?.left == nil && root?.right == nil {
            path.append("\(root!.val)")
            res.append(path)
        }else {
            binaryTreePaths(root?.left, path + "\(root!.val)" + "->", &res)
            binaryTreePaths(root?.right, path + "\(root!.val)" + "->", &res)
        }
    }
    
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var res:[String] = [String]()
        let path = ""
        if root == nil { return res }
        binaryTreePaths(root, path, &res)
        return res
    }
}
