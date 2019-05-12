//: [Previous](@previous)

import Foundation


class MyArray {
    
    func partSort(_ nums:inout [Int] ,_ start:Int ,_ end:Int) -> Int {
        var low = start
        var height = end
        
        
        let key = nums[height]
        
        while low < height {
            while low < height && nums[low] <= key {
                low += 1
            }
            
            while low < height && nums[height] >= key {
                height -= 1
            }
            
            if low < height {
                var temp = nums[low]
                nums[low] = nums[height]
                nums[height] = temp
            }
        }
        var temp = nums[height]
        nums[height] = nums[end]
        nums[end] = height
        return low
    }
    
    func findMidNumber(_ nums:[Int]) -> Int {
        
        var low = 0
        var height = nums.count - 1
        var len = nums.count - 1
        let mid = (len - 1) / 2
        
        var div = partSort(nums, low, height)
        
        while div != mid {
            if mid < div {
                div = partSort(nums, low, div - 1)
            }else {
                div = partSort(nums, div + 1, height)
            }
        }
    
        return nums[mid]
    }
}

let arr = MyArray()

arr.findMidNumber([12,3,10,8,6,7,11,13,9])
