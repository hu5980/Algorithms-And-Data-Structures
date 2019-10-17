//: [Previous](@previous)

import Foundation

/**
 设计一个支持以下两种操作的数据结构：

 void addWord(word)
 bool search(word)
 search(word) 可以搜索文字或正则表达式字符串，字符串只包含字母 . 或 a-z 。 . 可以表示任何一个字母。

 示例:

 addWord("bad")
 addWord("dad")
 addWord("mad")
 search("pad") -> false
 search("bad") -> true
 search(".ad") -> true
 search("b..") -> true
 说明:

 你可以假设所有单词都是由小写字母 a-z 组成的。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-and-search-word-data-structure-design
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

 */

class WordDictionary {
    
    private class Node {
        var isWord:Bool
        var next:[Character:Node]
        
        init(_ isWord:Bool) {
            self.isWord = isWord
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
    
    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
        var curNode = root
        for char in word {
            if !curNode.next.keys.contains(char) {
                curNode.next[char] = Node()
            }
            curNode = curNode.next[char]!
        }
        if !curNode.isWord {
            curNode.isWord = true
        }
    }
    
    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    private func bfs(_ node: Node, _ chars: [Character], _ nextIdx: Int) -> Bool {
        if nextIdx == chars.count {
            return node.isWord
        }
        
        for (nextChar, nextNode) in node.next where nextChar == chars[nextIdx] || chars[nextIdx] == "." {
            if bfs(nextNode, chars, nextIdx + 1) {
                return true
            }
        }
        
        return false
    }
    
    
    func search(_ word: String) -> Bool {
        return bfs(root, Array(word), 0)
    }
}
