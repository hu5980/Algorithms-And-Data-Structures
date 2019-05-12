//: [Previous](@previous)

import Foundation

/*
 在一个字符串中找到只出现一次的字符
 */


class Hash{
    
    func findFirshCharAndOnlyOnce( _ str:String ) -> Character? {
        
        var map:[Character:Int] = [Character:Int]()
        
        let chars =  Array(str)
        
        for char in chars {
            var value = map[char]
            map[char] = (value ?? 0) + 1
        }
        
        for char in chars {
            var value = map[char] ?? 0
            if value == 1 {
                return char
            }
        }
        return nil
    }
}


let hash = Hash()
hash.findFirshCharAndOnlyOnce("abaccdeff")
