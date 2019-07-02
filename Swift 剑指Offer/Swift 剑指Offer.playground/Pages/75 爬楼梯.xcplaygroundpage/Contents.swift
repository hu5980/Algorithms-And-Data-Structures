//: [Previous](@previous)

import Foundation

class Solution {
    
    var nums:[Int] = [Int]()
    
    func climbStairs(_ n: Int) -> Int {
        nums = Array.init(repeating: -1, count: n + 1)
        if n < 3  {
            return n
        }
        
        nums[0] = 0
        nums[1] = 1
        nums[2] = 2
        for n in 3...n {
            nums[n] = nums[n-1] + nums[n-2]
        }
        
        return nums[n]
    }
}


let s = Solution()

s.climbStairs(4)
