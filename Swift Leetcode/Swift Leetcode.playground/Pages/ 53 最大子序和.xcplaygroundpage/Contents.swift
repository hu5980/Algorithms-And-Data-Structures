//: [Previous](@previous)

import Foundation

/*:
 
 [最长子序和](https://leetcode-cn.com/problems/maximum-subarray)
 
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 
 示例:
 
 输入: [-2,6,-3,4,-1,2,1,-5,4],
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
 进阶:
 
 如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。

 */


class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var curSum = nums[0]
        var maxSum = nums[0]
        for i in 1..<nums.count {
            if curSum + nums[i] > nums[i] {
                curSum += nums[i]
            }else {
                curSum = nums[i]
            }
            maxSum = max(maxSum, curSum)
        }
        return maxSum
    }
}

let s = Solution()
s.maxSubArray([-2,6,-3,4,-1,2,1,-5,4])
