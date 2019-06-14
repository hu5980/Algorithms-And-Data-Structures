//: [Previous](@previous)

/*:
 
## 连续子数组的最大和
输入一个整型数组，数组里有正数也有负数。数组中一个或连续的多个整数组成一个子数组。求所有子数组的和的最大值
要求时间复杂度为O(n)。例如输入的数组为{1,-2,3,10,-4,7,2,-5}，和最大的子数组为{3,10,-4,7,2}，因此输出为该子数组的和18。
 
 ### 动态规划法
- (继承前人遗产吗) 当我们往后扫描时，对第j+1个元素有两种选择——要么放入前面找到的子数组，要么做为新子数组的第一个元素：
 1.1 如果currSum+当前元素a[j] >= a[j]，则令currSum加上a[j]
 1.2 否则currSum重新赋值，置为下一个元素，即currSum = a[j]。
- (更新历代最强吗) 比较当前最大子数组和与最大子数组的和：
 2.1 同时，当currSum > maxSum，则更新maxSum = currSum
 2.2 否则保持原值，不更新。
 
*/

import Foundation

func getMaxSubNumSum(_ nums:[Int]?) -> Int {
    if nums?.count ?? 0 == 0 {
        return 0
    }
    var currSum = nums![0]
    var maxSum = nums![0]
    
    for i in 1..<nums!.count {
        
        if currSum + nums![i] > nums![i] {
            currSum += nums![i]
        }else {
            currSum = nums![i]
        }
        
        if maxSum < currSum {
            maxSum = currSum
        }
    }
    return maxSum
}

var nums = [1,-2,3,10,-4,7,2,-5];

let maxSum =  getMaxSubNumSum(nums)

