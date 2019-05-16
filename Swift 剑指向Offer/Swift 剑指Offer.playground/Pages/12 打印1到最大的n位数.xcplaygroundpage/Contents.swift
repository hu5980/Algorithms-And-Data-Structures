//: [Previous](@previous)

import Foundation

/*
 输入数字n ，按顺序打印从1最大的n位十进制数 大数问题
 */

class PrintDigits {
    
    func printToMaxOfNDigits(_ n:Int) {
        if n <= 0 {
            return
        }
        
        var number:[Character] = Array.init(repeating: "9", count: n)
        var subNumber:[Character] = Array.init(repeating: "1", count: 1)
        
        var strNumber = String.init(number)
        var strSubNumber = String.init(subNumber)
        
        while strNumber < strSubNumber {
            
            
        }
        
        print(number)
        
    }
}


let digits = PrintDigits()

digits.printToMaxOfNDigits(2)
