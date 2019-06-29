//: [Previous](@previous)

import Foundation

/*:
 
 [有效的字母异位词](https://leetcode-cn.com/problems/valid-anagram)
 
 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。
 
 示例 1:
 
 输入: s = "anagram", t = "nagaram"
 输出: true
 示例 2:
 
 输入: s = "rat", t = "car"
 输出: false
 说明:
 你可以假设字符串只包含小写字母。
 
 进阶:
 如果输入字符串包含 unicode 字符怎么办？你能否调整你的解法来应对这种情况？
 
 */


class Solution {
    
    func isAnagram(_ s: String, _ t: String) -> Bool {
        let char_s:[Character] = Array.init(s)
        let char_t:[Character] = Array.init(t)
        
        if char_s.count != char_t.count {
            return false
        }
        
        var map:[Character:Int] = [Character:Int]()
        
        for i in 0..<char_s.count {
            var count = (map[char_s[i]] ?? 0) + 1
            map[char_s[i]] = count
            count = (map[char_t[i]] ?? 0) - 1
            map[char_t[i]] = count
        }
        
        for val in map.values {
            if val != 0 {
                return false
            }
        }
        
        return true
    }
}
