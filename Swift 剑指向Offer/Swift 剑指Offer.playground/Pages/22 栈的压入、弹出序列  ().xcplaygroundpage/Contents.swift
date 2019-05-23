//: [Previous](@previous)

import Foundation

/*
输入两个整数序列，第一个序列表示栈的压入顺序，请判断第二个序列是否为该栈的弹出顺序。假设压入栈的所有数字均不相等。例如序列1、2、3、4、5是某栈的压栈序列，序列4、5、3、2、1是该压栈序列对应的一个弹出序列，但4、3、5、1、2就不可能是该压栈序列的弹出序列
 */


/*
 如果下一个弹出的数字刚好是栈顶数字，那么直接弹出。
 如果下一个弹出的数字不在栈顶，我们把压栈序列中还没有入栈的数字压入辅助栈，直到把下一个需要弹出的数字压入栈顶为止。
 如果所有的数字都压入栈了仍然没有找到下一个弹出的数字，那么该序列不可能是一个弹出序列。

 */

func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
    if pushed.count == 0 || popped.count == 0 {
        return false
    }
    var result = false

    var pop = 0 // 指向popOrder的index
 
    var assistData = [Int]()
    var data = pushed
    
    while data.count >= 0   && pop < popped.count  {
        if popped[pop] != assistData.last  {
            assistData.append(data.first!)
            data.removeFirst()
        }else {
            assistData.removeLast()
            pop  += 1
        }
    }
    
    if pop == popped.count  {
        result = true
    }
    
    return result
}


let result = validateStackSequences([1,2,3,4,5], [4,3,5,1,2])

print(result)
