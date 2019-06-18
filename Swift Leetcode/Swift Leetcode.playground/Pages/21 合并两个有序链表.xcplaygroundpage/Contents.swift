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


/*: 方法一 ： 分别遍历两个链表 然后将其中一个合并到另一个上
 */
func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if l1 == nil || l2 == nil {
        return l1 == nil ? l2 : l1
    }
    
    if l1!.val < l2!.val {
        l1?.next = mergeTwoLists(l1?.next, l2)
        return l1
    }else{
        l2?.next = mergeTwoLists(l1, l2?.next)
        return l2
    }
}
