//: [Previous](@previous)

import Foundation


/**
 方法一 直接将num2 添加到num1后面 然后排序 时间复杂度 n(logn)
 */

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        for i in 0..<nums2.count {
            nums1[m+i] = nums2[i]
        }
        nums1.sort()
    }
}

/**
 方法二 直接将num1 num2 合并到一个新的数组 时间复杂度o(n) 空间复杂度o(n)
 */
class Solution1 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        let nums = nums1
        var i = 0
        var j = 0
        nums1.removeAll()
        while i < m && j < n {
            if nums[i] < nums2[j] {
                nums1.append(nums[i])
                i+=1
            }else{
                nums1.append(nums2[j])
                j+=1
            }
        }
        

        if i < m {
            nums1.append(contentsOf: nums[i..<m])
        }else{
            nums1.append(contentsOf: nums2[j..<n])
        }
        
    }
}

let s = Solution1()
var num1 = [1,2,3,0,0,0]
var num2 = [2,5,6]
s.merge(&num1, 3, num2, 3)
print(num1)
