

import Foundation

/*:
 实现 pow(x, n) ，即计算 x 的 n 次幂函数。
 
 示例 1:
 
 输入: 2.00000, 10
 输出: 1024.00000
 示例 2:
 
 输入: 2.10000, 3
 输出: 9.26100
 示例 3:
 
 输入: 2.00000, -2
 输出: 0.25000
 解释: 2-2 = 1/22 = 1/4 = 0.25
 说明:
 
 -100.0 < x < 100.0
 n 是 32 位有符号整数，其数值范围是 [−231, 231 − 1] 。
 
 */

/*
 方法一 :暴力法   遍历 1 到 n 每次都做 x*x 时间复杂度 O(n)
 */

func myPow(_ x: Double, _ n: Int) -> Double {
    if x == Double(0) {
        return 0
    }
    
    if n == 0 {
        return 1
    }
    
    var res:Double = 1
    let p = n < 0 ? -n : n
    
    for _ in 1...p {
        res = res * x
    }
    return n > 0 ? res : 1/res
}


/*
 方法二 ： 二分法  因为x^n = x^(n/2) * x^(n/2)  这样的话时间复杂度是O(log(n))
 
 */

//
//func myPow


func myPow_1(_ x: Double, _ n: Int) -> Double {
    if x == Double(0) || n == 0 {
        return 1
    }
    
    let p = n < 0 ? -n : n
    var res:Double = 1
    
    if n == 1 {
        return x
    }
    res = myPow_1(x, p/2)
    if p % 2 == 0 {
        res = res * res
    }else {
        res = res * res * x
    }

    return n > 0 ? res : 1/res
}

let res = myPow_1(1,100)
