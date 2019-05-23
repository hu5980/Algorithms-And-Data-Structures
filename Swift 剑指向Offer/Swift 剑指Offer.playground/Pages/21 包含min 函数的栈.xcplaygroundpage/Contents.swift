//: [Previous](@previous)

import Foundation

/*
 定义栈的数据结构，请在该类型中实现一个能够得到栈的最小元素的min函数 在该栈中 调用min push pop 的时间复杂度都是O(1)
 */

class Stack {
    
    var data:[Int]?
    var assistData:[Int]?
    
    init() {
        data = nil
        assistData = nil
    }
    
    func pop() -> Int? {
        let pop = data?.removeLast()
        if pop != nil &&  assistData?.last  == pop {
            assistData?.removeLast()
        }
        return pop
    }
    
    func push(_ value:Int) {
        if data == nil {
            data = [value]
            assistData = [value]
        }else {
            data?.append(value)
            if assistData!.last! < value {
                assistData!.append(assistData!.last!)
            }else{
                assistData!.append(value)
            }
        }
    }
    
    func min() -> Int? {
        return assistData?.last
    }
}


let stack = Stack()

stack.push(3)
stack.push(4)
stack.push(2)
stack.push(1)

stack.pop()

let min = stack.min()


print("min = \(min!)")
