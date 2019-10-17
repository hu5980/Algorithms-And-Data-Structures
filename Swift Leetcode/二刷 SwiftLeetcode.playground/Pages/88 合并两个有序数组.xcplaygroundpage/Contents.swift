//: [Previous](@previous)

import Foundation

/**
 给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。

 说明:

 初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
 示例:

 输入:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3

 输出: [1,2,2,3,5,6]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/merge-sorted-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

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
