//: [Previous](@previous)

import Foundation


/*:
 给定一个已按照升序排列 的有序数组，找到两个数使得它们相加之和等于目标数。
 
 函数应该返回这两个下标值 index1 和 index2，其中 index1 必须小于 index2。
 
 说明:
 
 返回的下标值（index1 和 index2）不是从零开始的。
 你可以假设每个输入只对应唯一的答案，而且你不可以重复使用相同的元素。
 示例:
 
 输入: numbers = [2, 7, 11, 15], target = 9
 输出: [1,2]
 解释: 2 与 7 之和等于目标数 9 。因此 index1 = 1, index2 = 2 。
 
 [两数之和](https://leetcode-cn.com/problems/two-sum-ii-input-array-is-sorted)
 
 */

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    
    var map:[Int:Int] = [Int:Int]()
    
    for i in 0..<numbers.count {
        map[numbers[i]] = i
    }
    
    print(map)
    
    for i in 0..<numbers.count {
        if map[target - numbers[i]] != nil {
            return [i + 1,map[target - numbers[i]]! + 1]
        }
    }
    
    return [Int]()
}

var nums  = [2, 3, 4, 6]

twoSum(nums, 10)

