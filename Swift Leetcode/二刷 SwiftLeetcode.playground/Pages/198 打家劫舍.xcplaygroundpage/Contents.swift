
//: [Previous](@previous)

import Foundation


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
