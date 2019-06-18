//: [Previous](@previous)

import Foundation


class JKMath {
    
    /// 判断是否等于0
    private func equal(_ num1:Double ,_ num2:Double) -> Bool {
        if num1 - num2 > -0.0000001 && num1 - num2 < 0.0000001 {
            return true
        }
        return false
    }
    
    private func unsignedExpPower(_ base:Double,_ exp:Int) -> Double {
        if exp == 0 {
            return 1
        }
        
        if exp == 1 {
            return base
        }
        
        var result = unsignedExpPower(base, exp >> 1)
        result *= result

        if exp & 0x1 == 1{
            result *= base
        }
       
        return result
    }
    
    func power(_ base:Double,_ exp:Int) -> Double {
        
        if equal(base, 0.0) && exp <= 0 {
            return 0.0
        }
        
        var absExp = exp
        if exp < 0 {
            absExp = -exp
        }
        
        var result = unsignedExpPower(base, absExp)
        
        if exp < 0 {
            result = 1.0 / result
        }
        return result
    }
}


let math = JKMath()

var  num = math.power(-5, 2)
print(num)
num = math.power(0, -1)
print(num)
num = math.power(3.4, 0)
print(num)
num = math.power(-2.5, 23)
print(num)
