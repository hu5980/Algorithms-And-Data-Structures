//: [Previous](@previous)

import Foundation

/*:
 
 [存在重复元素 III](https://leetcode-cn.com/problems/contains-duplicate-iii)
 
 给定一个整数数组，判断数组中是否有两个不同的索引 i 和 j，使得 nums [i] 和 nums [j] 的差的绝对值最大为 t，并且 i 和 j 之间的差的绝对值最大为 ķ。
 
 示例 1:
 
 输入: nums = [1,2,3,1], k = 3, t = 0
 输出: true
 示例 2:
 
 输入: nums = [1,0,1,1], k = 1, t = 2
 输出: true
 示例 3:
 
 输入: nums = [1,5,9,1,5,9], k = 2, t = 3
 输出: false
 
 */

class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        var set: Set<Int> = []
        for (index, num) in nums.enumerated() {
            if t == 0 {
                if set.contains(num) {
                    return true
                }
            } else {
                if set.contains(where: { abs($0 - num) <= t }) {
                    return true
                }
            }
            set.insert(num)
            if index >= k {
                set.remove(nums[index - k])
            }
        }
        return false
    }
}


let s = Solution()
s.containsNearbyAlmostDuplicate([1,2,1,4,5,6,7,8], 5, 0)


let a:[[Int]] = [[1,2,3,4,5],[1,2,3],[12],[345]]
a[1...]
