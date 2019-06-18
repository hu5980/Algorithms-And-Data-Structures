//: [Previous](@previous)

import Foundation

/*
 给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数
 输入: [1,2,3,4,5,6,7] 和 k = 3
 输出: [5,6,7,1,2,3,4]
 解释:
 向右旋转 1 步: [7,1,2,3,4,5,6]
 向右旋转 2 步: [6,7,1,2,3,4,5]
 向右旋转 3 步: [5,6,7,1,2,3,4]
 */

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        if k < 0  {
            fatalError("异常")
        }
        let newKey = k % nums.count
        var startIndex = nums.count - newKey
        while startIndex < nums.count {
            let temp = nums.last!
            
            for i in 0..<nums.count - 1 {
                let index = nums.count - 2 - i
                nums[index + 1] = nums[index]
            }
            nums[0] = temp
            startIndex += 1
        }
    }
    
    func rotate_1(_ nums: inout [Int], _ k: Int) {
        if k < 0  {
            fatalError("异常")
        }
        let newKey = k % nums.count

        let index = nums.count - newKey
        nums[0..<index].reverse()
        nums[index..<nums.count].reverse()
        nums.reverse()
    }
}

let solution = Solution()
var nums = [8,2,0,4,1,4,2,1,0]

solution.rotate_1(&nums, 3)

print(nums)
