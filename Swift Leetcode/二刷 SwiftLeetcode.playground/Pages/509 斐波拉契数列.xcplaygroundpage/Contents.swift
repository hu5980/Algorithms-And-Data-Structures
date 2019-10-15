//: [Previous](@previous)

import Foundation

class Solution {
    func fib(_ N: Int) -> Int {
        if N == 0 {
            return 0
        }
        var first = 0
        var second = 1
        for _ in 0..<N-1 {
            let temp = second
            second = first + second
            first = temp
        }
        return second
    }
}

let s = Solution()
s.fib(64)
