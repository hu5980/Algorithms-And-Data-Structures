//: [Previous](@previous)

import Foundation



public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


/*:
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
 
 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换
 
 
 给定 1->2->3->4, 你应该返回 2->1->4->3.
 
 
 
 */



class Solution {
    /*:
     方法一 迭代  一个一个的替换 ，使用了三个指针来表示 pre前一个node cur 当前的node next 后一个node
     */
    func swapPairs(_ head: ListNode?) -> ListNode? {
 
        let dummyHead = ListNode.init(-1)
        dummyHead.next = head
        
        var pre = dummyHead
        var cur = head
        var next = head?.next
        
        while next != nil {
            cur?.next = next?.next
            next?.next = cur
            pre.next = next
            pre = cur!
            cur = cur?.next
            next = cur?.next
        }
        return dummyHead.next
        
    }
    
    /*:
     方法二 递归的方式去做 交换前面两个 然后后面的子串使用递归的方式继续交换
     */

    
    func swapPairs_1(_ head: ListNode?) -> ListNode? {
        if head != nil || head?.next != nil {
            return head
        }
        var next = head?.next
        head?.next = swapPairs_1(next?.next)
        next?.next = head
        return next
    }
}
