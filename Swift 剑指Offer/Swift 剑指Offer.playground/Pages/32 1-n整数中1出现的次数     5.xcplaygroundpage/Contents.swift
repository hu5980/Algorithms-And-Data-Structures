//: [Previous](@previous)

/*:
 ### 1-n整数中1出现的次数
 #### 常规算法 遍历所有数字 把所有数字里面的1 相加
 */

import Foundation

func numberOf1(_ n:Int) ->Int {
    var num = n
    var numSum = 0
    while num > 0 {
        if num % 10 == 1 {
            numSum += 1
        }
        num = num / 10
    }
    return numSum
}

func numberOf1Between1AndN(_ n:Int) ->Int {
    var num = 0
    for i in 1...n {
        num += numberOf1(i)
    }
    return num
}

let sum = numberOf1Between1AndN(100)
