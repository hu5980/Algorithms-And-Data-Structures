//: [Previous](@previous)

import Foundation

/*字符串的排列*/

// 使用set 进行去重
var set:Set<String> = Set()

func exchange(_ str:String,index1:Int ,index2:Int) ->String {
    if index1 >= str.count || index2 >= str.count {
        return str
    }
    if index1 == index2 {
        return str
    }
    var chars = Array(str)
    chars.swapAt(index1, index2)
    return String.init(chars)
}

func permutation(_ str: String ,_ start:Int ,_ end:Int) {
    if start == end {
        set.insert(str)
        return
    }
    for i in start..<end {
        let newStr =  exchange(str, index1: start, index2: i)
        permutation(newStr, start + 1, end)
    }
}


func permutation(_ str:String?) {
    if str == nil {
        return
    }
    if str!.count == 1 {
        print(str!)
        return
    }
    permutation(str!, 0, str!.count)
}



let str = exchange("abc", index1: 0, index2: 1)
permutation("aabdef")
print(set)
