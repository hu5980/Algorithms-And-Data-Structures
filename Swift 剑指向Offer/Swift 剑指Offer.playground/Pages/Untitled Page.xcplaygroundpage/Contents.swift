//: [Previous](@previous)

import Foundation

func positiveFormat(_ number:Double,positiveFormat:String? = ",###.00" ) ->String {
    if number > 0 {
        let numberFormatter = NumberFormatter.init()
        numberFormatter.positiveFormat = positiveFormat
        numberFormatter.numberStyle = .percent
        return numberFormatter.string(from: NSNumber(value:number))!
    }else{
        return "0.00"
    }
}


let a = positiveFormat(346666829.34, positiveFormat: ",###")
print(a)

let number = NSNumber(value: 1234.5678)


//四舍五入的整数
let none = NumberFormatter.localizedString(from: number, number: .none)
print(none)
