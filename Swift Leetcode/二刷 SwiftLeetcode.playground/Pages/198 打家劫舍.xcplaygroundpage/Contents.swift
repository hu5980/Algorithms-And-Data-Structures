
//: [Previous](@previous)

import Foundation

/**
 你是一个专业的小偷，计划偷窃沿街的房屋。每间房内都藏有一定的现金，影响你偷窃的唯一制约因素就是相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警。

 给定一个代表每个房屋存放金额的非负整数数组，计算你在不触动警报装置的情况下，能够偷窃到的最高金额。

 示例 1:

 输入: [1,2,3,1]
 输出: 4
 解释: 偷窃 1 号房屋 (金额 = 1) ，然后偷窃 3 号房屋 (金额 = 3)。
      偷窃到的最高金额 = 1 + 3 = 4 。
 示例 2:

 输入: [2,7,9,3,1]
 输出: 12
 解释: 偷窃 1 号房屋 (金额 = 2), 偷窃 3 号房屋 (金额 = 9)，接着偷窃 5 号房屋 (金额 = 1)。
      偷窃到的最高金额 = 2 + 9 + 1 = 12 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/house-robber
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


/**
 方法一 采用动态规划 ，没有缓存结果 会导致超时问题
 */

class Solution {
    func dprob(_ nums: [Int] ,_ begin:Int) -> Int {
        if begin == nums.count - 1 {
            return nums[begin]
        }else if begin == nums.count - 2 {
            return max(nums[begin], nums[begin+1])
        }else{
            return max(nums[begin] + dprob(nums, begin + 2), dprob(nums, begin + 1))
        }
    }
    
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        return dprob(nums, 0)
    }
}
/**
方法二 采用动态规划 ，缓存结果
*/
class Solution1 {
    var totol:[Int] = [Int]()
    func dprob(_ nums: [Int] ,_ begin:Int) -> Int {
        if begin == nums.count - 1 {
            return nums[begin]
        }else if begin == nums.count - 2 {
            return max(nums[begin], nums[begin+1])
        }else{
            if totol[begin + 2] == -1{
                totol[begin + 2] = dprob(nums, begin + 2)
            }
            if totol[begin + 1] == -1 {
                totol[begin + 1] = dprob(nums, begin + 1)
            }
            return max(nums[begin] + totol[begin + 2], totol[begin + 1])
        }
    }
    
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        totol = Array.init(repeating: -1, count: nums.count)
        return dprob(nums, 0)
    }
}

/**
方法三 采用动态规划 ，缓存结果,从正向开始
*/
class Solution2 {

    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {return 0}
        if nums.count == 1 {return 1}
        var total = Array.init(repeating: 0, count: nums.count)
        total[0] = nums[0]
        total[1] = max(nums[0], nums[1])
        
        for i in 2..<nums.count {
            total[i] = max(nums[i] + total[i-2], total[i-1])
        }
        return total[nums.count-1]
    }
}

let s = Solution2()
let result = s.rob([114,117,207,117,235,82,90])

print(result)
