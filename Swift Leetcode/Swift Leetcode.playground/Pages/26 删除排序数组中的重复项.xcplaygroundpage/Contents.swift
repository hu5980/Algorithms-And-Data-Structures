//: [Previous](@previous)

import Foundation

/*:
 [26. 删除排序数组中的重复项](https://leetcode-cn.com/problems/remove-duplicates-from-sorted-array/)
 ### 解题思路：
 #### 方法一
 不要使用额外的数组空间 所以只能在当前的数组进行操作 ，想法就是把重复的下标记住 ，并且移除 ，因为移除数组会导致数组个数发生改变 ，所以我这里采用while 循环 ，当不重复的时候 index + 1 ，去除重复元素的时候 index 不变 ，这样一轮遍历之后 ，就可以移除掉相应的重复元素
 
 */

func removeDuplicates(_ nums: inout [Int]) -> Int {
    if nums.count == 0 || nums.count == 1{
        return nums.count
    }
    var curNum = nums[0]
    var index = 1
    while index < nums.count {
        if curNum == nums[index] {
            nums.remove(at: index)
        }else{
            curNum = nums[index]
            index += 1
        }
        
    }
    return nums.count
}


/*:
 ### 方法二： 用l快慢 指针来做 ，思路 同时有一个慢指针和一个快指针。慢指针指向新数组，快指针遍历旧数组 由于数组已排序，若nums[i] ！=nums[j] 将i 的下一位赋值为nums[j]
 
 */
func removeDuplicates_1(_ nums: inout [Int]) -> Int {
    if nums.count == 0 || nums.count == 1{
        return nums.count
    }
    
    var i = 0
    
    for j in 1..<nums.count {
        if nums[i] != nums[j] {
            i += 1;
            nums[i] = nums[j]
        }
    }
    
    return i + 1
}

var nums = [1,1,2]

let count = removeDuplicates_1(&nums)
print(nums)
print(count)

