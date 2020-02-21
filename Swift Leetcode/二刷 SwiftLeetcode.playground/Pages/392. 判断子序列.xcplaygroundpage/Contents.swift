//: [Previous](@previous)

import Foundation

/**
 
 给定字符串 s 和 t ，判断 s 是否为 t 的子序列。

 你可以认为 s 和 t 中仅包含英文小写字母。字符串 t 可能会很长（长度 ~= 500,000），而 s 是个短字符串（长度 <=100）。

 字符串的一个子序列是原始字符串删除一些（也可以不删除）字符而不改变剩余字符相对位置形成的新字符串。（例如，"ace"是"abcde"的一个子序列，而"aec"不是）。

 示例 1:
 s = "abc", t = "ahbgdc"

 返回 true.

 示例 2:
 s = "axc", t = "ahbgdc"

 返回 false.

 后续挑战 :

 如果有大量输入的 S，称作S1, S2, ... , Sk 其中 k >= 10亿，你需要依次检查它们是否为 T 的子序列。在这种情况下，你会怎样改变代码？

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/is-subsequence
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */


class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let nums = [1,2,3]
        let s = nums[0...2]
        print(s)

        return true
    }
}

//class Solution {
//    func search(_ nums: [Int], _ target: Int) -> Int {
//        if nums.count == 0 {
//            return -1
//        }
//        if nums.count == 1 && nums[0] == target {
//            return 0
//        }
//        
//        let mid = nums.count/2
//        if nums[mid] == target {
//            return mid
//        }
//        if nums[mid] > target {
//            return search(nums[0...(mid-1)],target)
//        }else{
//            return search(nums[(mid+1)...(nums.count-1)],target)
//        }
//    }
//}


let s = Solution()
s.search([1,2,3,4,5,6,7], 3)
