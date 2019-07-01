//: [Previous](@previous)

import Foundation

/*:
 
 [计算右侧小于当前元素的个数](https://leetcode-cn.com/problems/count-of-smaller-numbers-after-self)
 
 给定一个整数数组 nums，按要求返回一个新数组 counts。数组 counts 有该性质： counts[i] 的值是  nums[i] 右侧小于 nums[i] 的元素的数量。
 
 示例:
 
 输入: [5,2,6,1]
 输出: [2,1,1,0]
 解释:
 5 的右侧有 2 个更小的元素 (2 和 1).
 2 的右侧仅有 1 个更小的元素 (1).
 6 的右侧有 1 个更小的元素 (1).
 1 的右侧有 0 个更小的元素.
 
 
 */

class Solution {
    func countSmaller(_ nums: [Int]) -> [Int] {
        var res: [Int] = [Int](repeating: 0, count: nums.count)
        var vals = nums.sorted()
        
        for i in 0..<nums.count {
            let index = binarySearch(vals, nums[i])
            res[i] = index
            vals.remove(at: index)
        }
        
        return res
    }
    
    func binarySearch(_ nums: [Int], _ val: Int) -> Int {
        var start = 0
        var end = nums.count-1
        var mid = (end - start) / 2
        
        while start < end {
            if nums[mid] >= val {
                end = mid
            }else {
                start = mid+1
            }
            mid = start + (end - start) / 2
        }
        return mid
    }
}
