//: [Previous](@previous)

import Foundation

/*:
 ### 合并两个有序数组
 给定两个有序整数数组 nums1 和 nums2，将 nums2 合并到 nums1 中，使得 num1 成为一个有序数组。
 
 说明:
 
 初始化 nums1 和 nums2 的元素数量分别为 m 和 n。
 你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
 示例:
 
 输入:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3
 
 输出: [1,2,2,3,5,6]
 */


/*:
 方法二
 先把nums2 加到nums1 里面 ，然后再使用快排 时间复杂度O(nlog(n)) 空间复杂度O(1)
 */
func merge_1(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var index = m
    for i in 0..<n {
        nums1[index] = nums2[i]
        index += 1
    }
    nums1.sort()
}

/*:
 方法三:从后面往前面合并 空间复杂度O(1) 时间复杂度O(n)
 分析：因为 nums1 nums2是有序的所有合并后也是有序的，并且因为nums1 很大，所以可以从nums1 和  nums2的后面开始比较 ，将大的放到 m+ n - 1的位置 ，依此类推
 
 */
func merge_2(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    
    var i = m - 1
    var j = n - 1

    var k = m + n - 1
    
    while i >= 0 && j >= 0 {
        if nums1[i] > nums2[j] {
            nums1[k] = nums1[i]
            i -= 1
            k -= 1
        }else {
            nums1[k] = nums2[j]
            k -= 1
            j -= 1
        }
    }
    
    while j >= 0 {
        nums1[k] = nums2[j]
        k -= 1
        j -= 1
    }
}

/*:### 方法四
  新创建一个数组 空间复杂度O(n) 时间复杂度O(n)
 */
func merge_3(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var array = [Int]()
    
    if n == 0 {
        return
    }
    
    var p = 0 ,q = 0
    
    while p < m && q < n {
        if nums1[p] < nums2[q] {
            array.append(nums1[p])
            p += 1
        } else {
            array.append(nums2[q])
            q += 1
        }
    }
    
    if m > p {
        for i in p..<m{
            array.append(nums1[i])
        }
    }
    
    if n > q {
        for i in q..<n{
            array.append(nums2[i])
        }
    }
    nums1 = array
}

var nums1 = [0,0,0,0]
let nums2 = [1]
merge_3(&nums1, 0, nums2, 1)

print(nums1)

