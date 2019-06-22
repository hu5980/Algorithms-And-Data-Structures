
import Foundation

/*:
 [排列硬币](https://leetcode-cn.com/problems/arranging-coins)
 
 你总共有 n 枚硬币，你需要将它们摆成一个阶梯形状，第 k 行就必须正好有 k 枚硬币。
 
 给定一个数字 n，找出可形成完整阶梯行的总行数。
 
 n 是一个非负整数，并且在32位有符号整型的范围内。
 
 示例 1:
 
 n = 5
 
 硬币可排列成以下几行:
 ¤
 ¤ ¤
 ¤ ¤
 
 因为第三行不完整，所以返回2.
 示例 2:
 
 n = 8
 
 硬币可排列成以下几行:
 ¤
 ¤ ¤
 ¤ ¤ ¤
 ¤ ¤
 
 因为第四行不完整，所以返回3.
 */


/*
 方法一 ：暴力法  时间复杂度o(n)
 */
func arrangeCoins(_ n: Int) -> Int {
    if n <= 1 {
        return n
    }
    var row = 0
    var num = n
    while row + 1 <= num {
        row += 1
        num -= (row)
    }
    return row
}


/*
 方法二： 推导数学公式  row*(row+1) = 2n  时间复杂度o(n)
 */

func arrangeCoins_1(_ n: Int) -> Int {
    if n <= 1 {
        return n
    }
    
    var row = 1
    while row * (row + 1) <= 2*n  {
        row += 1
    }
    return row - 1
}

/*
 方法三： 二分法   还是运用了 求和公式row*(row+1) = 2n  ，但是我们这里在找这个row的时候 不是从1开始遍历 ，因为是有序的 所以我们可以 使用二分查找的方式 在1...n 里面进行查找 极大的提高查找效率 时间复杂度n(logn)
 */
func arrangeCoins_2(_ n: Int) -> Int {
    if n <= 1 {
        return n
    }
    var left = 1
    var height = n
    while left < height {
        let mid = left + (height - left) / 2
        if mid * (mid + 1) / 2 <= n {
            left = mid + 1
        }else{
            height = mid
        }
    }
    return left - 1
}



arrangeCoins_2(10)


arrangeCoins_1(10)
