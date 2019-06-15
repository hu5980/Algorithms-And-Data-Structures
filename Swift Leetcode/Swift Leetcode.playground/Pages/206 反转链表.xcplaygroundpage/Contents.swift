import Cocoa

/*:
 反转一个单链表。
 示例:
 
 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
 */

/*: 解题链接
 [链表的反转问题（递归和非递归方式)](https://www.cnblogs.com/kubixuesheng/p/4394509.html)
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {

    
    /// 非递归的解题方式
    ///
    /// - Parameter head: <#head description#>
    /// - Returns: <#return value description#>
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        //定义三个指针 保存原来的连接状态
        //当前指针
        var pNow = head
        // 当前结点的前驱指针，初始化是 NULL
        var pre:ListNode? = nil
        //当前结点的后继指针，初始化也是 null
        var pnext:ListNode? = nil
        //定义尾指针
        var tail:ListNode? = nil
        
        //开始遍历链表
        while pNow != nil {
            //如果当前结点不是 null，那么初始化 pnext 指针指向当前结点的下一个结点
            pnext = pNow?.next
            //如果找到了尾结点，初始化 tail 指针
            if pnext == nil {
                tail = pNow
            }
            //指针指向前一个结点，实现链表方向的反转，此时发生了断链
            pNow?.next = pre
            //勿忘断链的情形，需要使用 pre 指针保存状态，pre 等价于是后移一个结点
            pre = pNow
            //pnow 后移一个结点
            pNow = pnext
        }
        return tail
    }
    
    
    /// 递归的解题方式
    ///
    /// - Parameter head: <#head description#>
    /// - Returns: <#return value description#>
    func recursionReverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }else{
            let newNode = recursionReverseList(head?.next)
            head?.next?.next = head
            head?.next = nil
            return newNode
        }
    }
}
