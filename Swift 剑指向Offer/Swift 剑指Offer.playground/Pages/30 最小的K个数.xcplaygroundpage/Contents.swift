//: [Previous](@previous)

import Foundation


/*:
 ## 利用快速排序的方式来做
 快速排序的时间复杂度是o(nlog(n))的 为什么 这里是O(n)呢
 
 我们都知道快排是向下递归的，那么在平均或者说是期望情况下它找到的永远是中间位置，这就有点类似折半查找了，所以第一次它会对n个数进行划分，第二次循环它只会进入一边，然后对n/2个数进行划分，以此类推，总共需要对n+n/2+n/4+...+2+1=n(1+1/2+1/4+...)+2+1个数进行操作，1+1/2+1/4+...<2，因此该表达式小于2n，所以它的期望时间复杂度为O(n)
 
 这种算法会改变 数组
 
 */
func partition(_ nums:inout [Int], _ left:Int , _ right:Int) -> Int {
   
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
        
        if i < j {
            nums.swapAt(i, j)
        }
    }
    nums.swapAt(left, i)
    return i
}


func getLeastNumber(_ nums:inout [Int], _ left:Int , _ right:Int ,_ k:Int) -> [Int]? {
    if nums.count == 0 || right < left  || left < 0 {
        return nil
    }
    var newLeft = left
    var newRight = right
    var index = partition(&nums, 0, nums.count - 1)
    
    while index != k - 1 {
        if index > k - 1 {
            newRight = index - 1
            index = partition(&nums, newLeft, newRight)
        }else {
            newLeft = index + 1
            index = partition(&nums, newLeft, newRight)
        }
    }
    
  
    var newArr:[Int] = [Int]()
    for i in 0..<k {
        newArr.append(nums[i])
    }
    return newArr
}

var nums = [3,5,4,2,9,8,7,5,6,2,1,0,-3,-9,3,4,5,6,7,4,33,23,13,67,13,56,98,42,12,32,41,40]
let leastNums = getLeastNumber(&nums, 0, nums.count - 1, 10)


print(leastNums!)


/*:
 利用二叉堆来做
 */


func leftChildIndex(_ parent:Int) -> Int {
    return parent*2 + 1
}

func rightChildIndex(_ parent:Int) -> Int {
    return parent*2 + 2
}

func parentIndex(_ child:Int) ->Int {
    return (child - 1) / 2
}

func shiftUp(_ nums: inout [Int] ,_ index:Int) {
    var newIndex = index
    while newIndex > 0 && nums[parentIndex(newIndex)] < nums[newIndex] {
        nums.swapAt(newIndex, parentIndex(newIndex))
        newIndex = parentIndex(newIndex)
    }
}


func getMaxIndex(_ nums: inout [Int] ,_ index:Int) -> Int {
    let leftIndex = leftChildIndex(index)
    let rightIndex = rightChildIndex(index)
    
    if leftIndex > nums.count - 1 {
        return index
    }else if rightIndex > nums.count - 1 {
        if nums[index] < nums[leftIndex]{
            return leftIndex
        }
        return index
    }else {
        if nums[leftIndex] > nums[rightIndex] {
            return leftIndex
        }
        return rightIndex
    }
    
}

func shiftDown(_ nums: inout [Int] ,_ index:Int) {
    let newIndex = index
    let maxIndex = getMaxIndex(&nums, index)
    if newIndex != maxIndex {
        nums.swapAt(newIndex, maxIndex)
        shiftDown(&nums, maxIndex)
    }
}


func addToHeap(_ nums:inout [Int]?,_ k:Int,_ value:Int) {
    if nums?.count ?? 0 < k {
        if nums == nil {
            nums = [Int]()
        }
        nums!.append(value)
        shiftUp(&nums!, nums!.count - 1)
    }
    
    if nums![0] > value {
        nums![0] = value
        shiftDown(&nums!, 0)
    }
}

func getLeastNumberWithHeap(_ nums:[Int],_ k:Int) -> [Int]? {
    if nums.count == 0 || k <= 0 || k > nums.count {
        return nil
    }
    
    var newNums:[Int]?
    
    for val in nums {
        addToHeap(&newNums, k, val)
    }
    return newNums
}

var nums2 = [5,3,2,-1,-2,-3,-6,3,4,5,6,-3,-4,5,24,56,-100,-23,-23,-21,-56]
let newNums2 = getLeastNumberWithHeap(nums2, 5)
print(newNums2!)
