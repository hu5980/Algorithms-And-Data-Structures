//: [Previous](@previous)

import Foundation

/*:
 [字母异位词分组](https://leetcode-cn.com/problems/group-anagrams)
 
 给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。
 
 示例:
 
 输入: ["eat", "tea", "tan", "ate", "nat", "bat"],
 输出:
 [
    ["ate","eat","tea"],
    ["nat","tan"],
    ["bat"]
 ]
 说明：
 所有输入均为小写字母。
 不考虑答案输出的顺序。
 */


/*:
 方法一：排序数组分类
 思路
 
 当且仅当它们的排序字符串相等时，两个字符串是字母异位词
 时间复杂度 O(NKlogK) 其中 NN 是 strs 的长度，而 KK 是 strs 中字符串的最大长度。当我们遍历每个字符串时，外部循环具有的复杂度为 O(N)O(N)。然后，我们在 O(K \log K)O(KlogK) 的时间内对每个字符串排序
 
  空间复杂度：O(NK)O(NK)，排序存储在 ans 中的全部信息内容。
 */

func groupAnagrams(_ strs: [String]) -> [[String]] {
    
    var result:[[String]] = [[String]]()
    
    var map:[String:[String]] =  [String:[String]]()
    
    for str in strs {
        var strChars = Array.init(str)
        strChars.sort()
        if map[String.init(strChars)] == nil {
            map[String.init(strChars)] = [str]
        }else{
            map[String.init(strChars)]!.append(str)
        }
    }
    
    for val in map.values {
        result.append(val)
    }
    
    return result
}

extension Character {
    func toInt() -> Int
    {
        var intFromCharacter:Int = 0
        for scalar in String(self).unicodeScalars
        {
            intFromCharacter = Int(scalar.value)
        }
        return intFromCharacter
    }
}


/*
 方法二：
 按计数分类
 思路
 
 当且仅当它们的字符计数（每个字符的出现次数）相同时，两个字符串是字母异位词。
 
 算法
 
 我们可以将每个字符串 \text{s}s 转换为字符数 \text{count}count，由26个非负整数组成，表示 \text{a}a，\text{b}b，\text{c}c 的数量等。我们使用这些计数作为哈希映射的基础。
 */


func groupAnagrams_1(_ strs: [String]) -> [[String]] {

    var result:[[String]] = [[String]]()
    var map:[[Int]:[String]] = [[Int]:[String]]()
    
    for str in strs {
        var num:[Int] = Array .init(repeating: 0, count: 26)
        var strChars:[Character] = Array.init(str)

        for char in strChars {
            let index = char.toInt() - Character.init("a").toInt()
            num[index] =  num[index] + 1
        }
        
        if map[num] == nil {
            map[num] = [str]
        }else{
            map[num]?.append(str)
        }
    }

    for val in map.values {
        result.append(val)
    }
    return result
}



let result = groupAnagrams_1(["eat", "tea", "tan", "ate", "nat", "bat"])
print(result)

