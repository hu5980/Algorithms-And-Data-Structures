//: [Previous](@previous)

import Foundation

/*:
[无重复字符的最长子串](https://leetcode-cn.com/problems/longest-substring-without-repeating-characters)
 
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 
 示例 1:
 
 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 示例 2:
 
 输入: "bbbbb"
 输出: 1
 
 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 
 示例 3:
 
 输入: "pwwkew"
 输出: 3
 
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 
 
 */

class Solution {
    
    /*
     方法一 使用滑动窗口 跟 Map 来做
     
     其实就是一个队列,比如例题中的 abcabcbb，进入这个队列（窗口）为 abc 满足题目要求，当再进入 a，队列变成了 abca，这时候不满足要求。所以，我们要移动这个队列！
     
     如何移动？
     
     我们只要把队列的左边的元素移出就行了，直到满足题目要求！
     
     一直维持这样的队列，找出队列出现最长的长度时候，求出解！
    
     使用Map 的意思就是 移动的时候去判断Map里面是否出现过 现在的元素
     如果出现过 设置start 为
    
     
     */
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
       
        var chars:[Character] = Array.init(s)
        
        if chars.count <= 1 {
            return chars.count
        }
        
        var map:[Character:Int] = [Character:Int]()
        
        var start = 0
        var longest = 0
        map[chars[0]] = 0
        
        for end in 1..<chars.count {
            let char = chars[end]
            if map[char] != nil {
                // 这里之所以要使用 max(start, map[char]! + 1) 是为了 跳过那些 start之前的index
                
              /*
                 eg:
                                 e  0
                    start        w  5
                                 g  2
                                 c  3
                                 h  4
                // 此时e 进来了  map[e] = 0 但是这个0的小标小于 start ，如果让start =  map[e] + 1 的话 start 就又回去了 会出错
              */
                
                
                
                start =  max(start, map[char]! + 1)
                print("start = \(start)")
            }
            longest = max(longest, end - start + 1)
            map[char] = end
        }
        return longest
    }
}


class Solution1 {
    /*方法二 暴力法
     先算出所有的子串 然后判断子串是否有重复的字符 然后求出结果
     */
    func allUnique(_ str:String) -> Bool {
        var charSet = Set<Character>()
        let chars:[Character] = Array.init(str)
        for char in chars {
            if charSet.contains(char) {
                return false
            }
            charSet.insert(char)
        }
        return true
    }
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var chars:[Character] = Array.init(s)
        var longest = 0
        if chars.count <= 1 {
            return chars.count
        }
        for i in 0..<chars.count-1 {
            for j in i..<chars.count {
                let str =  String.init(chars[i...j])
                if allUnique(str) {
                    longest = max(longest, str.count)
                }
            }
        }
        return longest
    }
}

class Solution2 {
    /*方法三
     采取两个指针 分别在字符串的最左边 跟最右边 ，两边往中间找
     */
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var right = 1
        var left = 0
        var i = 0
        var result = 0
        
        if s.count > 0 {
            result = right - left
            let chars = Array(s.utf8)
            print("chars = \(chars)")
            while right < chars.count {
                i = left
                while i < right {
                    if chars[i] == chars[right] {
                        left = i + 1
                        break
                    }
                    i = i + 1
                }
                result = max(result,right-left+1)
                right = right + 1
            }
        }
        return result
    }
}

let solution1 = Solution()
let res1 = solution1.lengthOfLongestSubstring("abcadef")


let solution = Solution2()
let res = solution.lengthOfLongestSubstring("abcadef")

