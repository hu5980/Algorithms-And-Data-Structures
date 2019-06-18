//: [Previous](@previous)

import Foundation

/*:
 ### 旋转数组
 给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数
 
 示例 1:
 
 输入: [1,2,3,4,5,6,7] 和 k = 3
 
 输出: [5,6,7,1,2,3,4]
 
 解释:
 向右旋转 1 步: [7,1,2,3,4,5,6]
 
 向右旋转 2 步: [6,7,1,2,3,4,5]
 
 向右旋转 3 步: [5,6,7,1,2,3,4]
 
 
 */

/*:
 ### 方法一：超时
 每挪动一个元素 ，遍历一遍 时间复杂度是o(n) * o(k)
 
 */

func rotate(_ nums: inout [Int], _ k: Int) {
    var rotateCount = k
    if  k > nums.count {
        rotateCount = k % nums.count
    }
    while rotateCount > 0 {
        let lastNum = nums.last!
        for i in 0..<nums.count-1 {
            nums[nums.count - 1 - i] = nums[nums.count - 2 - i]
        }
        nums[0] = lastNum
        rotateCount -= 1
    }
}


/*:
 ### 方法二：
 nums 总数为count
 尝试用交换位置的方式去做 ，如果k = 2，则nums[count - k] 直接挪2
 
 */

func rotate_1(_ nums: inout [Int], _ k: Int) {
  
    
}


/*:
 ### 方法三：
 取反的方式
 
 */

func rotate_2(_ nums: inout [Int], _ k: Int) {
    var rotateCount = k
    if  k > nums.count {
        rotateCount = k % nums.count
    }
    nums[0..<rotateCount].reverse()
    nums[rotateCount..<nums.count].reverse()
    nums.reverse()
}


var nums = [1,2]

rotate_2(&nums, 3)

print(nums)
