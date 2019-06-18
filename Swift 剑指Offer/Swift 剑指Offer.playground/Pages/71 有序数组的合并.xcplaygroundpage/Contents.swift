//: [Previous](@previous)

import Foundation

/*
 两个有序数组合并 保证合并后的数组也是有序的
 */

class ArrayMerge {
    func sortedArrayMerge(_ nums1:[Int] ,_ nums2:[Int]) -> [Int] {
        var nums:[Int] = [Int]()
        
        var p = 0  // 遍历nums1
        var q = 0  // 遍历nums2
        
        
        while p < nums1.count && q < nums2.count {
            if nums1[p] < nums2[q] {
                nums.append(nums1[p])
                p += 1
            }else {
                nums.append(nums2[q])
                q += 1
            }
        }
        
        if p < nums1.count {
            for i in p..<nums1.count {
                nums.append(nums1[i])
            }
        }
        
        if q < nums2.count {
            for i in q..<nums2.count {
                nums.append(nums2[i])
            }
        }
        return nums
    }
}


let merge = ArrayMerge()

let arr = merge.sortedArrayMerge([1,4,7,9,11], [3,4,5,6,7])

print(arr)


