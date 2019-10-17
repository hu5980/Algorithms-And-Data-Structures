//: [Previous](@previous)

import Foundation

/**
 实现一个 Trie (前缀树)，包含 insert, search, 和 startsWith 这三个操作。
 
 示例:
 
 Trie trie = new Trie();
 
 trie.insert("apple");
 trie.search("apple");   // 返回 true
 trie.search("app");     // 返回 false
 trie.startsWith("app"); // 返回 true
 trie.insert("app");
 trie.search("app");     // 返回 true
 说明:
 
 你可以假设所有的输入都是由小写字母 a-z 构成的。
 保证所有输入均为非空字符串。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/implement-trie-prefix-tree
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Trie {
    /// 节点 内部类
    private class Node {
        var isWord:Bool
        var next:[Character:Node]
        convenience init() {
            self.init(false)
        }
        
        init(_ isWord:Bool) {
            self.isWord = isWord
            self.next = [Character:Node]()
        }
    }
    
    private var root:Node
    
    
    /** Initialize your data structure here. */
    init() {
        root = Node()
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
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
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var curNode = root
        for char in word {
            if !curNode.next.keys.contains(char) {
                return false
            }
            curNode = curNode.next[char]!
        }
        if curNode.isWord {
            return true
        }
        return false
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var curNode = root
        for char in prefix {
            if !curNode.next.keys.contains(char) {
                return false
            }
            curNode = curNode.next[char]!
        }
        return true
    }
}
