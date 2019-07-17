//: [Previous](@previous)

import Foundation

/*:
 
 [词典中最长单词](https://leetcode-cn.com/problems/longest-word-in-dictionary)
 
 给出一个字符串数组words组成的一本英语词典。从中找出最长的一个单词，该单词是由words词典中其他单词逐步添加一个字母组成。若其中有多个可行的答案，则返回答案中字典序最小的单词。
 
 若无答案，则返回空字符串。
 
 示例 1:
 
 输入:
 words = ["w","wo","wor","worl", "world"]
 输出: "world"
 解释:
 单词"world"可由"w", "wo", "wor", 和 "worl"添加一个字母组成。
 示例 2:
 
 输入:
 words = ["a", "banana", "app", "appl", "ap", "apply", "apple"]
 输出: "apple"
 解释:
 "apply"和"apple"都能由词典中的单词组成。但是"apple"得字典序小于"apply"。
 
 */


class Trie {
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
    private var size:Int
    
    init() {
        root = Node()
        size = 0
    }
    
    func getSize() -> Int {
        return size
    }
    
    public func add(_ word:String) {
        var cur = root
        for c in word {
            if cur.map[c] == nil {
                cur.map[c] = Node()
            }
            cur = cur.map[c]!
        }
        
        if cur.isWord == false {
            cur.isWord = true
            size += 1
        }
    }
    
    public func contain(_ word:String) -> Bool {
        var cur = root
        for c in word {
            if cur.map[c] == nil {
                return false
            }
            cur = cur.map[c]!
        }
        return cur.isWord
    }
    
    public func searchWith(_ prefix: String) -> Bool {
        var cur = root
        for c in prefix {
            if cur.map[c] == nil {
                return false
            }
            cur = cur.map[c]!
        }
        return true
    }
    
    public func longestInDictionary()->String {
        return longest(root, "")
    }
    
    private func longest(_ node:Node? ,_ curRes:String)-> String {
        if node == nil { return curRes }
        var result = curRes
        for key in node!.map.keys {
           var res =  longest(node!.map[key]!,"\(curRes)\(key)")
            result = result.count > res.count ?  result : res
        }
        return result
    }
    
    
}

class Solution {
    func longestWord(_ words: [String]) -> String {
        let trie = Trie()
        for word in words {
            trie.add(word)
        }
        return trie.longestInDictionary()
    }
}


let s = Solution()
s.longestWord(["a","ap","app","appl","apple","appla"])
