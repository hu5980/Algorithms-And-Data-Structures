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

/*
 方法一  存到数组里面 然后排序 ，再取出来组成一个链表  时间复杂度 n(logn)
 */
class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
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

/**
 方法二 ： 迭代
 */

class Solution1 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        return nil
    }
}

/**
 方法三 ：小顶堆
 */
class Solution2 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
       return nil
    }
}


/**
 方法四： 分治
 */
class Solution3 {
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil || l2 == nil {
            return l1 != nil ? l1 : l2
        }
        
        if l1!.val < l2!.val{
            l1?.next = mergeTwoLists(l1?.next, l2)
            return l1
        }else{
            l2?.next = mergeTwoLists(l1, l2?.next)
            return l2
        }
    }
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
      
        if lists.count == 0 {
            return nil
        }else if lists.count == 1 {
            return lists.first as? ListNode
        }else if lists.count == 2 {
            return mergeTwoLists(lists.first as? ListNode, lists.last as? ListNode)
        }else {
            var newLists = lists
            var mid = newLists.count / 2
            var tempLists = [ListNode?]()
            
            while mid > 0 {
                for i in 0..<mid {
                    tempLists.append(mergeTwoLists(newLists[i*2], newLists[i*2+1]))
                }
                
                if mid * 2 < newLists.count {
                    tempLists.append(newLists.last as? ListNode)
                }
                newLists = tempLists
                mid = newLists.count / 2
                tempLists.removeAll()
            }
            return newLists.first as? ListNode
        }
    }
}
