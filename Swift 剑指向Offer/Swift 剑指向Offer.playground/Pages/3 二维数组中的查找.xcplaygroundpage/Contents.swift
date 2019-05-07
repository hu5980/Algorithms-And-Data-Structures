//: [Previous](@previous)


import Foundation

/*
 在一个二维数组中，每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数
 
 eg:    1   2   8    9
        2   4   9    12
        4   7   10   13
        6   8   11   15
 */


class ArrayLookup {
    
    func twoDimensionalArrayLookup(_ nums:[[Int]],_ rows:Int,_ colums:Int,_ num:Int) -> Bool {
        var found = false
        
        if colums > 0 && rows > 0 {
            // 用i表示行 j表示列
            var i = 0 ,j = colums-1
            while i < rows && j >= 0 {
                var currentNum = nums[i][j]
                if currentNum == num {
                    found = true
                    break
                }else if currentNum > num {
                    j -= 1
                }else{
                    i += 1
                }
            }
        }
        return found
    }
}


let lookUp = ArrayLookup()

let nums = [[1,2,8,9],[2,4,9,12],[4,7,10,13],[6,8,11,15]]

let found = lookUp.twoDimensionalArrayLookup(nums,4,4,11)

print(found)
