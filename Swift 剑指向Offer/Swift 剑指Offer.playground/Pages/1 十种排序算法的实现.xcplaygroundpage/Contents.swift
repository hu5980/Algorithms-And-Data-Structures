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
    
    func mergeSort(_ nums:[Int]) -> [Int] {
        var newNums = nums
        
        return nums
    }
}

let sort = Sort()

let nums =  [8,3,5,9,10,1,-1,4,6,24]

let newNums = sort.insertSort(nums)


print(newNums)
