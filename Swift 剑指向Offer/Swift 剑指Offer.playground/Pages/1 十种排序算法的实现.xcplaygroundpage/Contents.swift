/*:
 ### 快速排序
 在数组中随机选择一个数作为参考，比该数大的放在它的右边，比它小的放在它的左边。之后把它的左右两边看成另外两个新数组（不包括该数）进行递归。在实际进行快速排序的算法编写时我们一般选数组的第一个数作为参考元素来比较进行快排
 
 实现思想：前提数组第一个元素为比较的值key，然后数组 A 首元素和尾元素调换，在对调换后数组的前n-1（n为传进来数组的长度）个元素进行遍历；并用count进行计数（count的作用是作为两个子数组的分割），count初值为left；遍历时若元素大于等于key（等于放哪都无所谓），进行下一次循环；若小于key则调换A[i]和A[count]，并且count + 1；遍历完成之后调换A[right]和A[count]，并把 (A, left, count - 1)和(A, count + 1, right)两个子数组调用递归
 
 基本过程  4 1 5 8 3 ->3 1 5 8 4 -> {3}1 5 8 4 ->{3 1} 5 8 4 ->{3 1} 4 8 5->{3 1} 4 {8 5}
  ![图1](1.png)
 
 上述变化完之后count处的值就是key的值，count左右的值分别为小于和大于key的值。
 */



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
    
    func quickSort_A(_ nums:inout [Int] ,_ left:Int , _ right:Int ) {
        if left >= right {
            return
        }
        var i = left
        var j = right
        let key = nums[i]
        
        while i != j {
            while nums[j] >= key && j > i {
                j -= 1
            }
            while nums[i] <= key && j > i {
                i += 1
            }
            if j > i {
                nums.swapAt(i, j)
            }
        }
        nums.swapAt(left, i)
        quickSort(&nums, 0, i-1)
        quickSort(&nums, i+1, right)
    }
}

let sort = Sort()

var nums =  [6,2,7,3,8,9]

sort.quickSort_A(&nums, 0, nums.count - 1)

print(nums)

