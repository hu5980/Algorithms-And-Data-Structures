//: [Previous](@previous)

import Foundation

/*:
 
 [长度最小的子数组](https://leetcode-cn.com/problems/minimum-size-subarray-sum/)
 
 给定一个含有 n 个正整数的数组和一个正整数 s ，找出该数组中满足其和 ≥ s 的长度最小的连续子数组。如果不存在符合条件的连续子数组，返回 0。
 
 示例:
 
 输入: s = 7, nums = [2,3,1,2,4,3]
 输出: 2
 解释: 子数组 [4,3] 是该条件下的长度最小的连续子数组。
 
 */

class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var l = 0
        var r = -1
        var sum = 0
        var res = nums.count + 1
        
        while l < nums.count {
            if r + 1 < nums.count && sum < s {
                r += 1
                sum += nums[r]
            }else {
                sum -= nums[l]
                l += 1
            }
            if sum >= s {
                res = min(res, r - l + 1)
            }
        }
        
        if res == nums.count + 1 {
            return 0
        }
        return res
    }
}

let solution = Solution()

solution.minSubArrayLen(7, [2,3,1,2,4,3])
