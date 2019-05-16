//: [Previous](@previous)

import Foundation

/*
 输入一个整数数组，实现一个函数来调整数组中数字的顺序。
 使得所有奇数数字位于数组的前半部分，所有的偶数在数组的后半部分
 */



class MyArray {
    func reorderOddEven(_ num:inout [Int] , _ length:Int ) {
        var p = 0
        var q = length - 1
        while p < q {
            while num[p] % 2 != 0 && p < q {
                p += 1
            }
            while num[q] % 2 == 0 && p < q {
                q -= 1
            }
            if p < q {
                let temp = num[q]
                num[q] = num[p]
                num[p] = temp
            }
        }
    }
}


var array =  MyArray()
var nums = [3,4,3,4,5]
array.reorderOddEven(&nums, 5)

print(nums)
