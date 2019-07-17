//: [Previous](@previous)

import Foundation



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

    /** Initialize your data structure here. */
    init() {
        root = Node()
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
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
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var cur = root
        for c in word {
            if cur.map[c] == nil {
                return false
            }
            cur = cur.map[c]!
        }
        return cur.isWord
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var cur = root
        for c in prefix {
            if cur.map[c] == nil {
                return false
            }
            cur = cur.map[c]!
        }
        return true
    }
}
