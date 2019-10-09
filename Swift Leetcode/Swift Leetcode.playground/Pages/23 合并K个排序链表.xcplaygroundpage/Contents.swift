//: [Previous](@previous)

import Foundation

/*:
 
 合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。
 
 示例:
 
 输入:
 [
     1->4->5,
     1->3->4,
     2->6
 ]
 输出: 1->1->2->3->4->4->5->6
 
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

/*:
 方法一 ：分治  首先实现合并两个链表的算法 ，然后两两合并  
 */
class Solution {
    func mergeTwoLists(_ l1:ListNode?, _ l2:ListNode?) -> ListNode? {
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
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if  lists.count == 0 {
            return nil
        }else if lists.count == 1 {
            return lists.first as? ListNode
        }else if lists.count == 2 {
            return mergeTwoLists(lists.first as? ListNode , lists.last as? ListNode)
        }else{
            var newLists    = lists
            var resultLists = [ListNode?]()
            while newLists.count > 1 {
                let mid = newLists.count / 2
                for i in 0..<mid {
                    resultLists.append(mergeTwoLists(newLists[i*2], newLists[i*2+1]))
                }
                if mid * 2 < newLists.count {
                    resultLists.append(newLists.last as? ListNode)
                }
                newLists = resultLists
                resultLists.removeAll()
            }
            return newLists.last as? ListNode
        }
    }
}

/*: 超出时间限制*/
class Solution_2 {
    func mergeTwoLists(_ l1:ListNode?, _ l2:ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil {
            return l1 == nil ? l2 : l1
        }
        if l1!.val < l2!.val {
            l1?.next        = mergeTwoLists(l1?.next, l2)
            return l1
        }else {
            l2?.next        = mergeTwoLists(l1, l2?.next)
            return l2
        }
    }
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if  lists.count == 0 {
            return nil
        }else{
             var list_0 = lists[0]
            for i in 1..<lists.count {
               
               list_0 = mergeTwoLists(list_0, lists[i])
            }
            return list_0
        }
    }
}


/*:
 方法二 放到一个数组中，然后数组排序,然后组成一个链表
 */
class Solution1 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil
        }
        var nodes = [ListNode?]()
        for i in 0..<lists.count {
            var list = lists[i]
            while list != nil {
                nodes.append(list)
                list = list?.next
            }
        }
        
        nodes.sort { (node1, node2) -> Bool in
            node1!.val < node2!.val
        }
        
        let head = ListNode(-1)
        var cur:ListNode? = head
        for i in 0..<nodes.count {
            cur?.next = nodes[i]
            cur = cur?.next
        }
        return head.next
    }
}

/*:
 方法三 放到一个数组中，然后数组排序,然后组成一个链表
 */
class Solution3 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.count == 0 {
            return nil
        }
        var nodes = [ListNode?]()
        for i in 0..<lists.count {
            var list = lists[i]
            while list != nil {
                nodes.append(list)
                list = list?.next
            }
        }
        
        nodes.sort { (node1, node2) -> Bool in
            node1!.val < node2!.val
        }
        
        let head = ListNode(-1)
        var cur:ListNode? = head
        for i in 0..<nodes.count {
            cur?.next = nodes[i]
            cur = cur?.next
        }
        return head.next
    }
}


/*:
 方法四： 小顶堆
 */
