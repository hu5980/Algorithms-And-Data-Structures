//: [Previous](@previous)

import Foundation


/*反转字符串*/

class MyString {
    
    func reverse(_ str:String) -> String {
        var chars =  Array(str)
        var i = 0
        var j = chars.count - 1
        
        while i<j {
            (chars[i],chars[j]) = (chars[j],chars[i])
            i += 1
            j -= 1
        }
        return String.init(chars)
    }
}


let myStr = MyString()

let str = myStr.reverse("hello,world")
