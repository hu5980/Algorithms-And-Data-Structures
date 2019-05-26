
//: [Previous](@previous)

var str = "Hello, playground"

//: # headingOne1
/*:
 
 * item1
 
 * item2
 
 * item3
 
 */

//: [Next](@next)

import Foundation

/*
 输入一个整数数组，判断该数组是不是某二叉搜索树的后序遍历结果。如果是刚返回true，否则返回false
 
 */

/*
 思路： 二叉搜索树的后序遍历  是有特点的
         8
     6        10
  5     7   9    11
 上图是后序遍历序列5、7、6、9、1 1、10、8对应的二叉搜索树 在后序遍历得到的序列中，最后一个数字是树的根结点的值。数组中前面的数字可以分为两部分：第一部分是左子树结点的值，它们都比根结点的值小；第二部分是右子树结点的值，它们都比根结点的值大。 以数组{5，7，6，9，11，10，8）为例，后序遍历结果的最后一个数字8就是根结点的值。在这个数组中，前3个数字5、7和6都比8小，是值为8的结点的左子树结点；后3个数字9、11和10都比8大，是值为8的结点的右子树结点。 我们接下来用同样的方法确定与数组每一部分对应的子树的结构。这其实就是一个递归的过程。对于序列5、7、6，最后一个数字6是左子树的根结点的值。数字5比6小，是值为6的结点的左子结点，而7则是它的右子结点。同样，在序列9、11、10中，最后一个数字10是右子树的根结点，数字9比10小，是值为10的结点的左子结点，而11则是它的右子结点。 我们再来分析另一个整数数组{7，4，6，5）。后序遍历的最后一个数是根结点，因此根结点的值是5。由于第一个数字7大于5，因此在对应的二叉搜索树中，根结点上是没有左子树的，数字7、4和6都是右子树结点的值。但我们发现在右子树中有一个结点的值是4，比根结点的值5小，这违背了二叉搜索树的定义。因此不存在一棵二叉搜索树，它的后序遍历的结果是7、4、6、5。 找到了规律之后再写代码，就不是一件很困难的事情了
 */


func verifyBST(_ nums:[Int]) -> Bool {
    var flag = true
    let root = nums.last!  // 这是根节点的值
    
    var numsLeft:[Int] = [Int]()  // 这是左子树 数组
    var numsRight:[Int] = [Int]() // 这是右子树 数组
    
    // 这个循环是把 左子树都放到numsLeft 右子树都放到numsRight里面
    for i in 0..<nums.count - 1 {
        if nums[i] > root {
            for j in i..<nums.count - 1 {
                numsRight.append(nums[j])
            }
            break;
        }
        numsLeft.append(nums[i])
    }
    
    // 这里是遍历左子树 如果左子树不小于根节点 则返回false
    for num in numsLeft {
        if root < num {
            return false
        }
    }
    
    // 这里是遍历右子树 如果右子树小于根节点 则返回false
    for num in numsRight {
        if root > num {
            return false
        }
    }
    
    if numsLeft.count > 0{
        flag = verifySquenceOfBST(numsLeft)
    }
    
    if flag  && numsRight.count > 0{
        flag = verifySquenceOfBST(numsRight)
    }
    
    return flag
}

    
func verifySquenceOfBST(_ nums:[Int]?) -> Bool {
    if nums?.count ?? 0 == 0 {
        return false
    }
    return verifyBST(nums!)
}

verifySquenceOfBST([5,7,6,9,11,10,8])

verifySquenceOfBST([7,4,6,5])

verifySquenceOfBST([4,11,8])

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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var nums = [[Int]]()
        if root == nil {
            return nums
        }

        var queue:[[TreeNode]] =  [[TreeNode]]()

        queue.append([root!])
        while queue.count > 0 {
            let nodes =  queue.removeFirst()  // 获取入栈的数组
            var subNums:[Int] = [Int]()
            var subNode:[TreeNode] =  [TreeNode]()
            for node in nodes {
                subNums.append(node.val)
                if node.left != nil {
                    subNode.append(node.left!)
                }

                if node.right != nil {
                    subNode.append(node.right!)
                }
            }
            nums.append(subNums)
            if subNode.count > 0 {
                queue.append(subNode)
            }
        }

        return nums
//        guard root != nil else {
//            return [[Int]]()
//        }
//
//        var result = [[Int]]()
//        var queue = [TreeNode]()
//        queue.append(root!)
//
//        while queue.count != 0 {
//            let size = queue.count
//            var temp = [Int]()
//            for i in 0 ..< size {
//                let node = queue[i]
//                temp.append(node.val)
//                if node.left != nil {
//                    queue.append(node.left!)
//                }
//                if node.right != nil {
//                    queue.append(node.right!)
//                }
//            }
//            queue.removeFirst(size)
//            result.append(temp)
//        }
//
//        return result
    }
}

