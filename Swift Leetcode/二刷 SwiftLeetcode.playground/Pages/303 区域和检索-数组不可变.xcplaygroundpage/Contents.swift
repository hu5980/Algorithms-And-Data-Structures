//: [Previous](@previous)

import Foundation

/**
 给定一个整数数组  nums，求出数组从索引 i 到 j  (i ≤ j) 范围内元素的总和，包含 i,  j 两点。

 示例：

 给定 nums = [-2, 0, 3, -5, 2, -1]，求和函数为 sumRange()

 sumRange(0, 2) -> 1
 sumRange(2, 5) -> -1
 sumRange(0, 5) -> -3
 说明:

 你可以假设数组不可变。
 会多次调用 sumRange 方法。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/range-sum-query-immutable
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/**
 方法一 ：将数组里面的每一个值的和都求出来，区间值 就是从0加在这两个索引的差
 例如 sumRange(2, 5) 就是 sum1 =  nums[0] + nums[1] + .... + nums[5]
 sum2 = nums[0] + nums[1]
 sumRange(2, 5) = sum1 - sum2
 */
class NumArray {
    private var sum:[Int]
    init(_ nums: [Int]) {
        sum = [Int].init(repeating: 0, count: nums.count+1)
        sum[0] = 0
        for i in 0..<nums.count  {
            sum[i+1] = sum[i] + nums[i]
        }
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        return sum[j+1] - sum[i]
    }
}

let nums = [-2, 0, 3, -5, 2, -1]
let numArray = NumArray.init(nums)
numArray.sumRange(2, 5)


/**
 方法二 线段树 解决这个问题
 
 */
