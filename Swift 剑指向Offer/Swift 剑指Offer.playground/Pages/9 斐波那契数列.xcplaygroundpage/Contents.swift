//: [Previous](@previous)

/*
 写一个函数,输入n,求斐波那契数列的第n项
 */

import Foundation



class Fibonacii {
    func fibonacii_a(_ num:Int64) -> Int64 {
        if num <=   0 {
            return 0
        }
        
        if num == 1 {
            return num
        }
        return fibonacii_a(num - 1) + fibonacii_a(num - 2)
    }
    
    
    func fibonacii_b(_ num:Int) -> Int {
       
        var result = [0,1]
        
        if num < 2 {
            return result[num]
        }
        
        var fibNOne = 0
        var fibNTwo = 1
        
        var finN = 1
        
        for _ in 2...num {
            finN = fibNOne +  fibNTwo
            fibNTwo = fibNOne
            fibNOne = finN
        }
        
        
        return finN
    }
}


let fibonacii = Fibonacii()

fibonacii.fibonacii_b(50)
