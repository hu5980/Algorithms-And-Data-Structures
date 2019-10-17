//: [Previous](@previous)

import Foundation

/**
 
 实现一个 MapSum 类里的两个方法，insert 和 sum。
 
 对于方法 insert，你将得到一对（字符串，整数）的键值对。字符串表示键，整数表示值。如果键已经存在，那么原来的键值对将被替代成新的键值对。
 
 对于方法 sum，你将得到一个表示前缀的字符串，你需要返回所有以该前缀开头的键的值的总和。
 
 示例 1:
 
 输入: insert("apple", 3), 输出: Null
 输入: sum("ap"), 输出: 3
 输入: insert("app", 2), 输出: Null
 输入: sum("ap"), 输出: 5
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/map-sum-pairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */

class MapSum {
    
    private class Node {
        var isWord:Bool
        var val:Int
        var next:[Character:Node]
        
        init(_ isWord:Bool) {
            self.isWord = isWord
            self.val = 0
            self.next = [Character:Node]()
        }
        
        convenience init() {
            self.init(false)
        }
    }
    
    private var root:Node
    
    /** Initialize your data structure here. */
    init() {
        root = Node()
    }
    
    func insert(_ key: String, _ val: Int) {
        var curNode = root
        for char in key {
            if !curNode.next.keys.contains(char) {
                curNode.next[char] = Node()
            }
            curNode = curNode.next[char]!
        }
        
        if !curNode.isWord {
            curNode.isWord = true
        }
        curNode.val = val
    }
    
    func sum(_ prefix: String) -> Int {
        var sum = 0
        var curNode = root
        for char in prefix {
            if !curNode.next.keys.contains(char) {
                getSumVal(curNode, &sum)
                
            }
            if curNode.next.keys.contains(char)  {
                curNode = curNode.next[char]!
            }else{
                return 0
            }
            
        }
        getSumVal(curNode, &sum)
        return sum
    }
    
    private func getSumVal(_ node:Node , _ sum :inout Int) {
        if node.isWord   {
            sum += node.val
        }
        
        for node in node.next.values {
            getSumVal(node, &sum)
        }
    }
}


let mapsum = MapSum()
mapsum.insert("a", 3)
mapsum.sum("ap")
mapsum.insert("b", 2)

mapsum.sum("a")


