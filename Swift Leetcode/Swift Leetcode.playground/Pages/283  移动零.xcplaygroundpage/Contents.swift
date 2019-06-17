//: [Previous](@previous)

/*:
 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 - 输入: [0,1,0,3,12]
 - 输出: [1,3,12,0,0]
 
 说明:
 
 - 必须在原数组上操作，不能拷贝额外的数组。
 - 尽量减少操作次数。
 */

import Foundation

//: ### 开辟了新的空间  不符合要求
//: 时间s复杂度O(n) 空间复杂度O(n)
func moveZeroes(_ nums: inout [Int]) {
    var newNums:[Int] = [Int]()
    for num in nums {
        if num != 0 {
            newNums.append(num)
        }
    }
    for _ in newNums.count..<nums.count {
        newNums.append(0)
    }
    nums = newNums
}

/*:
 ### 方法二:
不开辟新空间 通过挪动0 的位置进行处理 并将0挪到后面
> [0,1,0,3,12]
> [1,0,0,3,12]
> [1,3,0,0,12]
> [1,3,12,0,0]
 */
func moveZeroes_1(_ nums: inout [Int]) {
    // 用来标记0的位置
    var k = 0
    for i in 0..<nums.count {
        // 如果 nums[i] == 0 的话 k 不变
        if nums[i] != 0 {
            // i != k  交换nums[i] nums[k] 并设置k += 1
            if i != k {
                nums.swapAt(i, k)
            }
            k += 1
        }
    }
}

/*:
 ### 方法三:
 不开辟新的空间 ，因为是前面有可能为0。所以可以直接往前挪
 > [0,1,0,3,12]
 > [1,1,0,3,12]
 > [1,3,0,3,12]
 > [1,3,12,3,12]
 */
func moveZeroes_2(_ nums: inout [Int]) {
    // 用来标记0的位置
    var k = 0
    for i in 0..<nums.count {
        if nums[i] != 0 {
            nums[k] = nums[i]
            k += 1
        }
    }
    
    for i in k..<nums.count {
        nums[i] = 0
    }
}



var nums = [0,1,0,3,12]

moveZeroes_1(&nums)

print(nums)
