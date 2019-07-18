//: [Previous](@previous)

import Foundation

/*:
 
 [添加与搜索单词](https://leetcode-cn.com/problems/add-and-search-word-data-structure-design)
 
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
 
 
 */

class WordDictionary {
    
    private class Node {
        var isWord:Bool
        var map:[Character:Node]
        
        init(_ isWord:Bool) {
            self.isWord = isWord
            self.map = [Character:Node]()
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
        var cur = root
        for c in word {
            if cur.map[c] == nil {
                cur.map[c] = Node()
            }
            cur = cur.map[c]!
        }
        if cur.isWord == false {
            cur.isWord = true
        }
    }
    
    
    private func bfs(_ node: Node, _ chars: [Character], _ nextIdx: Int) -> Bool {
        if nextIdx == chars.count {
            return node.isWord
        }
        for (nextChar, nextNode) in node.map where nextChar == chars[nextIdx] || chars[nextIdx] == "." {
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



let wordDic = WordDictionary()
wordDic.addWord("ran")
wordDic.addWord("rune")
wordDic.addWord("runner")
wordDic.addWord("runs")
wordDic.addWord("add")
wordDic.addWord("adds")
wordDic.addWord("adder")
wordDic.addWord("addee")
wordDic.search("r.n")
wordDic.search("ru.n.e")
wordDic.search("add")
wordDic.search("......")
wordDic.search("....e.")


