//: [Previous](@previous)

import Foundation

func FirstNotRepeatingChar(_ str:String?) ->Character? {
    if str == nil {
        return nil
    }
    
    var map:[Character:Int] = [Character:Int]()
    
    let chars:[Character] = Array.init(str!)
    
    for char in chars {
        if map[char] == nil {
            map[char] = 1
        } else {
            map[char] = map[char]! + 1
        }
    }
    
    for key in map.keys {
        if map[key] == 1 {
            return key
        }
    }
    
    return nil
}

let char = FirstNotRepeatingChar("abcabcf")

func firstUniqChar(_ s: String) -> Int {
//    let chars:[Character] = Array.init(s)
//    var map:[Character:Int] = [Character:Int]()
//
//    for char in chars {
//        if map[char] == nil {
//            map[char] = 1
//        } else {
//            map[char] = map[char]! + 1
//        }
//    }
//
//    for index in 0..<chars.count {
//        if map[chars[index]] == 1 {
//            return index
//        }
//    }
//    return -1
    
    var arr = Array.init(repeating: 0, count: 26)
    
    
    
    for scalar in s.unicodeScalars {
        let index = Int(scalar.value - 97)
        let cur = arr[index]
        arr[index] = cur + 1
    }
    
    var first = 0
    
    for scalar in s.unicodeScalars {
        let index = Int(scalar.value - 97)
        if arr[index] == 1 {
            return first
        }
        first += 1
    }
    
    return -1
}

firstUniqChar("loveleetcode")



