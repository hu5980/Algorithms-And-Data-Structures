//: [Previous](@previous)

import Foundation

//TODO 速度不够快 需要优化

/*
 输入某二叉树的前序遍历和中序遍历的结果，请重建出该二叉树。假设输入的前序遍历和中序遍历的结果中都不含重复的数字。例如输入前序遍历序列{1,2,4,7,3,5,6,8}和中序遍历序列{4,7,2,1,5,3,8,6}，则重建二叉树并返回
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

    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        
        if preorder.count > 0  && preorder.count == inorder.count {
            let root = TreeNode(preorder[0])
            let index = inorder.firstIndex(of: root.val)!
            
            if index > 0 {
                root.left =  buildTree(Array(preorder[1...index]),Array(inorder[0...index-1]))
            }
            
            if index < inorder.count - 1 {
                root.right =  buildTree(Array(preorder[index + 1...preorder.count - 1]), Array(inorder[index + 1...inorder.count - 1]))
            }
            return root
        }
        
        return nil
       
    }
    
    func printTree(_ root:TreeNode?) {
        if root != nil {
            print(root!.val)
            printTree(root?.left)
            printTree(root?.right)
        }
    }
}


let solttionTree = Solution()
let root =  solttionTree.buildTree([1,2,4,7,3,5,6,8], [4,7,2,1,5,3,8,6])
solttionTree.printTree(root)


