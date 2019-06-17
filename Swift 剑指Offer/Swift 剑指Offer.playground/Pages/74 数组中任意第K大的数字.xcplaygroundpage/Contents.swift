/*:
 # 寻找乱序数组中第K大的数
 ## 思路如下
 拿到这个题目，我们首先想到的肯定的是对数组进行排序，然后再取第K大的数。所以在这里我们先罗列两个方法
 ###### -、基于快排实现
 说道排序首先想到的应该是快排，它的时间复杂度为O（NlogN），但是在这里又有一些不同，因为我们不需要对我们不关注的那一部分进行排序
 
 思路：根据key值把数组分割为两半，一半数字大、一半数字小。其中这两半有一半不是我们所要的，可以去除，只在我们需要的那一部分进行递归下去即可
 
 ![图1](1.png)
 */

import Foundation

func quickSort(_ nums:inout [Int] ,_ left:Int , _ right:Int) {
    if left >= right {
        return
    }
    
    var i = left
    var j = right
    
    let key = nums[left]
    
    while i != j {
        while nums[j] >= key && i < j {
            j -= 1
        }
        while nums[i] <= key && i < j {
            i += 1
        }
        if (i < j){
            nums.swapAt(j, i)
        }
    }
    nums.swapAt(left, i)
    quickSort(&nums, 0, i-1)
    quickSort(&nums, i+1, right)
}

//var nums = [6,1,2,7,9,3,4,5,10,8]

var nums = [2,3,2,4,2,5,2,5,2,2]

quickSort(&nums, 0, nums.count - 1)

print(nums)


func baseQuickSort(_ nums:inout [Int] ,_ left:Int , _ right:Int) {
    if left >= right {
        return
    }
    
    var i = left
    var j = right
    
    let key = nums[left]
    
    while i != j {
        while nums[j] >= key && i < j {
            j -= 1
        }
        while nums[i] <= key && i < j {
            i += 1
        }
        if (i < j){
            nums.swapAt(j, i)
        }
    }
    nums.swapAt(left, i)
    
    if i == nums.count / 2 {
        print("result = \(nums[i])")
        return
    }

    baseQuickSort(&nums, 0, i-1)
    baseQuickSort(&nums, i+1, right)
}

baseQuickSort(&nums, 0, nums.count - 1)
