//: [Previous](@previous)

import Foundation

/**
 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。

 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
 
 
 示例:

 输入："23"
 输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 说明:
 尽管上面的答案是按字典序排列的，但是你可以任意选择答案输出的顺序。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/letter-combinations-of-a-phone-number
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


class Solution {
    
    let dict:[Character: [String]] =
    [
        "2": ["a", "b", "c"],
        "3": ["d", "e", "f"],
        "4": ["g", "h", "i"],
        "5": ["j", "k", "l"],
        "6": ["m", "n", "o"],
        "7": ["p", "q", "r", "s"],
        "8": ["t", "u", "v"],
        "9": ["w", "x", "y", "z"],
        
    ]
    
    func letterCombinations(_ digits: String) -> [String] {
        
        if digits.isEmpty{
            return [String]()
        }
        if digits.count == 1{
            return dict[Character(digits)]!
        }
        // 求出下一个字母所代表的所有的字符
        var nextComb = letterCombinations(String(digits.dropFirst()))
        // 当前的数字所对应的字符数组
        var current = dict[digits[digits.startIndex]]!
        var result = [String]()
        for c in current{
            for i in 0..<nextComb.count{
                result.append(String(c) + nextComb[i])
            }
        }
        return result
    }
}

let s = Solution()
let res = s.letterCombinations("23")
print(res)
