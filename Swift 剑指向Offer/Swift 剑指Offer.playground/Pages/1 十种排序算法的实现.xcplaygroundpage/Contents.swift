//: [Previous](@previous)

import Foundation


class Sort {
    
    /// 冒泡排序
    func bubbleSort(_ nums:[Int]) -> [Int] {
        var newNums = nums
        for i in 0..<newNums.count-1 {
            for j in i+1..<newNums.count{
                if newNums[i] > newNums[j] {
                   let temp = newNums[j]
                    newNums[j] = newNums[i]
                    newNums[i] = temp
                }
            }
        }
        return newNums
    }
    
    /// 选择排序
    func selectSort(_ nums:[Int]) -> [Int] {
        var newNums = nums
        for i in 0..<newNums.count-1 {
            var min = i
            for j in i+1..<newNums.count{
                if newNums[min] > newNums[j] {
                    min = j
                }
            }
            if i != min {
                let temp = newNums[min]
                newNums[min] = newNums[i]
                newNums[i] = temp
            }
        }
        return newNums
    }
    
    /// 插入排序
    func insertSort(_ nums:[Int]) -> [Int]  {
        var newNums = nums
        for i in 1..<newNums.count {
            var j = i - 1
            var t = i
            while j > 0 {
                if newNums[j] > newNums[t]{
                    let temp  = newNums[t]
                    newNums[t] = newNums[j]
                    newNums[j] = temp
                    t -= 1
                    j -= 1
                }
            }
        }
        return newNums
    }
    
//    func mergeSort(_ nums:[Int]) -> [Int] {
//        var newNums = nums
//
//        return nums
//    }
    
    
    
    ///快速排序
    func quickSort(_ nums:inout [Int] ,_ left:Int , _ right:Int ) {
        if left >= right {
            return
        }
        var i = left
        var j = right
        let key = nums[i]

        while j > i {
            while nums[j] >= key && i < j {
                j -= 1
            }
            nums[i] = nums[j]
            while nums[i] <= key && i < j {
                i += 1
            }
            nums[j] = nums[i]
        }
        nums[i] = key
        quickSort(&nums, left, i-1)
        quickSort(&nums, i+1, right)
    }
}

let sort = Sort()

var nums =  [6,2,7,3,8,9]

sort.quickSort(&nums, 0, nums.count - 1)

print(nums)

