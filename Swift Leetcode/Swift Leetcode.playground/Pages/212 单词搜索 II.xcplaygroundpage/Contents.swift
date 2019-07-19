//: [Previous](@previous)

import Foundation

/*
 
 [ 单词搜索2](https://leetcode-cn.com/problems/word-search-ii)
 
 给定一个二维网格 board 和一个字典中的单词列表 words，找出所有同时在二维网格和字典中出现的单词。
 
 单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母在一个单词中不允许被重复使用。
 
 示例:
 
 输入:
 words = ["oath","pea","eat","rain"] and board =
 [
 ['o','a','a','n'],
 ['e','t','a','e'],
 ['i','h','k','r'],
 ['i','f','l','v']
 ]
 
 输出: ["eat","oath"]
 
 */


class Solution {
    class TrieNode {
        var word: String?
        var children = [Character: TrieNode]()
    }
    
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let trieRoot = buildTrie(words)
        
        var board = board
        var result = Set<String>()
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                dfs(&board, i, j, trieRoot, &result)
            }
        }
        
        return Array(result)
    }
    
    func dfs(_ board: inout [[Character]], _ i: Int, _ j: Int, _ trieNode: TrieNode, _ result: inout Set<String>) {
        if let word = trieNode.word {
            result.insert(word)
        }
        
        guard i >= 0 && j >= 0 && i < board.count && j < board[i].count else { return }
        guard board[i][j] != "#" else { return }
        
        let char = board[i][j]
        guard let nextTrieNode = trieNode.children[char] else { return }
        
        var board = board
        board[i][j] = "#"
        for (nexti, nextj) in [(i-1, j), (i+1, j), (i, j-1), (i, j+1)] {
            dfs(&board, nexti, nextj, nextTrieNode, &result)
        }
        board[i][j] = char
    }
    
    func buildTrie(_ words: [String]) -> TrieNode {
        let root = TrieNode()
        for word in words {
            var node = root
            for char in word {
                if node.children[char] == nil {
                    node.children[char] = TrieNode()
                }
                node = node.children[char]!
            }
            node.word = word
        }
        return root
    }
}
