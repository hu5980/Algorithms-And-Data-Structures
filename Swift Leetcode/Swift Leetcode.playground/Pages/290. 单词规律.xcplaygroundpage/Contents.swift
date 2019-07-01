//: [Previous](@previous)

import Foundation

/*:
 
 [单词规律](https://leetcode-cn.com/problems/word-pattern)

 给定一种规律 pattern 和一个字符串 str ，判断 str 是否遵循相同的规律。
 
 这里的 遵循 指完全匹配，例如， pattern 里的每个字母和字符串 str 中的每个非空单词之间存在着双向连接的对应规律。
 
 示例1:
 
 输入: pattern = "abba", str = "dog cat cat dog"
 输出: true
 示例 2:
 
 输入:pattern = "abba", str = "dog cat cat fish"
 输出: false
 示例 3:
 
 输入: pattern = "aaaa", str = "dog cat cat dog"
 输出: false
 示例 4:
 
 输入: pattern = "abba", str = "dog dog dog dog"
 输出: false
 说明:
 你可以假设 pattern 只包含小写字母， str 包含了由单个空格分隔的小写字母
 
 
 */
class Solution {
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        let chars:[Character] = Array(pattern)
        let strs:[String] = str.components(separatedBy: " ")
        
        if chars.count != strs.count {
            return false
        }
        
        var res = true
        var map:[Character:String] = [Character:String]()
        for index in 0..<chars.count {
            if map[chars[index]] == nil {
                map[chars[index]] = strs[index]
            }else {
                if map[chars[index]] != strs[index] {
                    res = false
                }
            }
        }
        
        var map1:[String:Character] = [String:Character]()
        for index in 0..<chars.count {
            if map1[strs[index]] == nil {
                map1[strs[index]] = chars[index]
            }else {
                if map1[strs[index]] != chars[index] {
                    res = false
                }
            }
        }
        return res
    }
}


let s = Solution()
let res = s.wordPattern("abba", "dog dog dog dog")
print(res)
