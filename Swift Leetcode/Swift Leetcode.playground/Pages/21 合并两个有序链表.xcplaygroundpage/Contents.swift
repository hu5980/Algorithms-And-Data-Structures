//: [Previous](@previous)

import Foundation

/*:### 合并两个有序链表
 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 
  示例：
 
  输入：1->2->4, 1->3->4
 
  输出：1->1->2->3->4->4

 */




public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


/*: 方法一 ：使用递归 使用递归必须首选搞清楚一个问题，这个函数的功能是什么？
 
 */
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil || l2 == nil {
        return l1 == nil ? l2 : l1
    }
    
    if l1!.val < l2!.val {
         l1?.next = mergeTwoLists(l1?.next, l2)
        return l1
    }else {
         l2?.next = mergeTwoLists(l1, l2?.next)
        return l2
    }
}

/*:方法二 ：使用迭代
 */

func mergeTwoLists1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil || l2 == nil {
        return l1 == nil ? l2 : l1
    }
    let headNode = ListNode(-1)
    var curNode:ListNode? = headNode
    var curl1 = l1
    var curl2 = l2
    while curl1?.val != nil && curl2?.val != nil {
        if curl1!.val < curl2!.val {
            curNode?.next = curl1
            curNode = curNode?.next
            curl1 = curl1?.next
        }else{
            curNode?.next = curl2
            curNode = curNode?.next
            curl2 = curl2?.next
        }
    }
    curNode?.next = curl1 == nil ? curl2 : curl1
    return headNode.next
}
