//: [Previous](@previous)

import Foundation

/*
 请实现一个函数 输入一个证书 输出该二进制表示中1 的个数
 */

func positiveFormat(_ number:Float,positiveFormat:String? = ",###.00" ) ->String {
    if number > 0 {
        let numberFormatter = NumberFormatter.init()
        numberFormatter.positiveFormat = positiveFormat
        numberFormatter.minimumIntegerDigits = 1 //设置整数最少1位
        return numberFormatter.string(from: NSNumber(value:number))!
    }else{
        return "0.00"
    }
}



class BitOperation {
    func NumberOf1InBinary(_ num:Int) -> Int {
        var count = 0
        var n = num
        while n > 0 {
            if n & 1 == 1{
                count += 1
            }
            n = n >> 1
            print("n = \(n)")
        }
        return count
    }

    
    func NumberOf1InBinary_A(_ num:Int) -> Int {
        var count = 0
        var flug:Int = 1
        while flug > 0 {
            if num & flug == 1{
                count += 1
            }
            flug = flug << 1
            print("flug = \(flug)")
        }
        return count
    }

}


let bit = BitOperation()
bit.NumberOf1InBinary_A(15)

