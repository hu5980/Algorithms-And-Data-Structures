//: [Previous](@previous)

import Foundation

/*
 [二叉搜索树结点最小距离](https://leetcode-cn.com/problems/minimum-distance-between-bst-nodes)
 
 给定一个二叉搜索树的根结点 root, 返回树中任意两节点的差的最小值。
 
 示例：
 
 输入: root = [4,2,6,1,3,null,null]
 输出: 1
 解释:
 注意，root是树结点对象(TreeNode object)，而不是数组。
 
 给定的树 [4,2,6,1,3,null,null] 可表示为下图:
 
      4
    /  \
   2    6
  / \
 1   3
 
 最小的差值是 1, 它是节点1和节点2的差值, 也是节点3和节点2的差值。
 注意：
 
 二叉树的大小范围在 2 到 100。
 二叉树总是有效的，每个节点的值都是整数，且不重复。
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
 方法一 ： 递归法 二叉搜索树 是有序的 所以最小值 就是这个二叉搜索树的相邻节点的最小值
 */

func dfs(_ root: TreeNode? ,_ low:Int,_ high:Int , _ res:inout Int) {
    if root == nil { return }
    if low != Int.min { res = min(res, root!.val - low) }
    if high != Int.min { res = min(res, high - root!.val) }
    dfs(root?.left,low,root!.val,&res)
    dfs(root?.right,root!.val,high,&res)
}


func minDiffInBST(_ root: TreeNode?) -> Int {
    var res:Int = Int.max
    dfs(root, Int.min, Int.max, &res)
    return res
}
