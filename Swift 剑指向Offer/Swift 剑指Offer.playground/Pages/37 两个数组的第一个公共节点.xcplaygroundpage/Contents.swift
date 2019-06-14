//: [Previous](@previous)

import Foundation

/*:
 ## 两个数组的第一个公共节点
 输入两个公共数组，找出它们的公共节点
 
 - 方法一： 把每一个节点的地址存到一个集合里面 遍历链表二 找到第一个地址已经存在集合里面的节点
 
 - 方法二： 如果两个链表存在公共节点 则公共节点后面的所有节点都是一样的 ，这样我们可以从后面开始向前面比较 如果存在公共节点则从两个栈里面出栈 最后一个公共节点就是我们要找的
 
 - 方法三:首先遍历两个链表得到他们的长度 就能知道哪个比较长 以及长多少 ，然后长的先走若干步 ，接着再同时在两个链表上遍历 ，找到第一个相同的节点就是他们的公共节点
 
 */

class Node{
    var value:Int;
    var next:Node?
    init(_ value:Int) {
        self.value = value
        self.next = nil
    }
}

let node = Node.init(1)
let node1 = Node.init(1)

print(Unmanaged.passUnretained(node).toOpaque())
print(Unmanaged.passUnretained(node1).toOpaque())

var set:Set<UnsafeMutableRawPointer> = Set()
set.insert(Unmanaged.passUnretained(node).toOpaque())
set.insert(Unmanaged.passUnretained(node1).toOpaque())

print(set)

func findFirstCommonNode(_ head1:Node? ,_ head2:Node?) -> Node? {
    if head1 == nil || head2 == nil {
        return nil
    }
    var set:Set<UnsafeMutableRawPointer> = Set()

    var curHead1 = head1
    var curHead2 = head2

    while curHead1 != nil {
        set.insert(Unmanaged.passUnretained(curHead1!).toOpaque())
        curHead1 = curHead1?.next
    }

    while curHead2 != nil {
        if set.contains(Unmanaged.passUnretained(curHead2!).toOpaque()) {
            return curHead2
        }else {
            curHead2 = curHead2?.next
        }
    }
    return nil
}
