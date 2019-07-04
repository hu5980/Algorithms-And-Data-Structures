//: [Previous](@previous)

import Foundation

/*:
 
 [整数拆分](https://leetcode-cn.com/problems/integer-break)
 
 给定一个正整数 n，将其拆分为至少两个正整数的和，并使这些整数的乘积最大化。 返回你可以获得的最大乘积。
 
 示例 1:
 
 输入: 2
 输出: 1
 解释: 2 = 1 + 1, 1 × 1 = 1。
 示例 2:
 
 输入: 10
 输出: 36
 解释: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36。
 说明: 你可以假设 n 不小于 2 且不大于 58。
 
 
 */

class Solution {
    func max3(_ a:Int,_ b:Int,_ c:Int) ->Int {
        return max(a, max(b, c))
    }
    // 将n 进行分割（至少分割两部分） ，可以获取最大乘积
    func breakInteger(_ n:Int) -> Int {
        if n == 1 {
            return 1
        }
        var res = -1
        for i in 1...n-1 {
            res = max3(res, i*(n-1) ,i * breakInteger(n-i))
        }
        return res
    }
    func integerBreak(_ n: Int) -> Int {
        return breakInteger(n)
    }
}


class Solution1 {
    func max3(_ a:Int,_ b:Int,_ c:Int) ->Int {
        return max(a, max(b, c))
    }
    
    // 将n 进行分割（至少分割两部分） ，可以获取最大乘积
    func breakInteger(_ n:Int , _ mem: inout [Int]) -> Int {
        mem[1] = 1
        for i in 2...n {
            for j in 1...i-1 {
                mem[i] = max3(mem[i], j * (i-j), j * mem[i-j])
            }
        }
        return mem[n]
    }
    
    func integerBreak(_ n: Int) -> Int {
        var mem:[Int] = Array.init(repeating: -1, count: n + 1)
        return breakInteger(n ,&mem)
    }
}

let res = Solution().integerBreak(20)
print(res)
