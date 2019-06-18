//: [Previous](@previous)

/*:
 ## 丑数
 编写一个程序，找出第 n 个丑数。
 
 丑数就是只包含质因数 2, 3, 5 的正整数。
 
 任意一个丑数一定是另一个丑数乘以2或3或5得到的，我们可以使用一个数组将已经确认为丑数的数按照从小到大的顺序记录下来，每个丑数都是前面的丑数乘以2、3或5得来的。
 　　 　　 
如何确保数组中的丑数是排好序的？假设数组中已经有若干个排好序的丑数，并且其中最大的丑数为M。那么下一个丑数一定是数组中某个数乘以2或3或5的结果，所以我们把数组中的每个数都乘以2，找到第一个大于M的结果M2（小于等于M的结果肯定已经在数组中了，不需要考虑）；同理，把数组中的每个数都乘以3，找到第一个大于M的结果M3；把数组中的每个数都乘以5，找到第一个大于M的结果M5。那么下一个丑数一定是M2、M3、M5当中的最小值。
实际上，在寻找M2、M3、M5的过程中，不需要每次都从头开始遍历，只要记住上一次遍历到的位置，继续往后遍历即可

 原文：[https://blog.csdn.net/qq_34342154/article/details/78768201]
 */

import Foundation

func getUglyNumber(_ n:Int) -> Int {
    
    if n < 0 {
        return 0
    }
    
    if n == 1 {
        return 1
    }
    
    var ugly:[Int] = [Int]()
    ugly.append(1)
    var index = 1
    var p2Index = 0
    var p3Index = 0
    var p5Index = 0
    
    
    while index < n {
        let minNum = min(ugly[p2Index]*2, ugly[p3Index]*3, ugly[p5Index]*5)
        ugly.append(minNum)
        index += 1
        if ugly[p2Index]*2 <= minNum {
            p2Index += 1
        }
        
        if ugly[p3Index]*3 <= minNum {
            p3Index += 1
        }
        
        if ugly[p5Index]*5 <= minNum {
            p5Index += 1
        }
    }
    return ugly[n-1]
}



getUglyNumber(10)
