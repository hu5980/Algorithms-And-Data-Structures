//: [Previous](@previous)

import Foundation

/*:
 
 [搜索二维矩阵 II](https://leetcode-cn.com/problems/search-a-2d-matrix-ii)
 
 编写一个高效的算法来搜索 m x n 矩阵 matrix 中的一个目标值 target。该矩阵具有以下特性：
 
 每行的元素从左到右升序排列。
 每列的元素从上到下升序排列。
 示例:
 
 现有矩阵 matrix 如下：
 
 [
 [1,   4,  7, 11, 15],
 [2,   5,  8, 12, 19],
 [3,   6,  9, 16, 22],
 [10, 13, 14, 17, 24],
 [18, 21, 23, 26, 30]
 ]
 给定 target = 5，返回 true。
 
 给定 target = 20，返回 false
 */

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 {
            return false
        }
        for var i in 0..<matrix.count {
            for var j in (0..<matrix[0].count).reversed() {
                if matrix[i][j] == target {
                    return true
                }else if matrix[i][j] > target && j - 1 >= 0  {
                    j = j - 1
                }else if matrix[i][j] < target && i + 1 < matrix.count{
                    i = i + 1
                }
            }
        }
        return false
    }
}


let s = Solution()
s.searchMatrix([[1,1],[1,1]], 2)


