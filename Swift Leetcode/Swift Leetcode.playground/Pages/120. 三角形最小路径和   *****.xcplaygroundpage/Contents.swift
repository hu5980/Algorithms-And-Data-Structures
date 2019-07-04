//: [Previous](@previous)

import Foundation

/*:
 
 [三角形最小路径和](https://leetcode-cn.com/problems/triangle)
 
 给定一个三角形，找出自顶向下的最小路径和。每一步只能移动到下一行中相邻的结点上。
 
 例如，给定三角形：
 
 [
         [2],
        [5,4],
       [6,5,7],
      [4,1,8,3]
 ]
 自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
 
 说明：
 
 如果你可以只使用 O(n) 的额外空间（n 为三角形的总行数）来解决这个问题，那么你的算法会很加分。
 
 
 */


/*这个题目非常明显的动态规划问题， 当前节点的最小值由前面一层的一个（当为第一个或最后一个点）或两个节点决定， 所以维护一个二维数组，保存到达每个节点的最小路径值，通过递推式求出所有的点的最小路径值，然后返回最后一层的最小值就是目标值了
 
 //递推式可以很容易看出
 //中间点
 minPath[i][j] = min(minPath[i-1][j-1] + triangle[i][j], minPath[i-1][j] + triangle[i][j]);
 */



class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        let rows = triangle.count
        if rows == 0 {
            return 0
        }else if rows == 1 {
            return triangle[0][0]
        }
        var dp:[Int] = Array.init(triangle.last!)
        for i in (0...rows-2).reversed() {
            for j in 0..<triangle[i].count {
                dp[j] = min(dp[j], dp[j+1]) + triangle[i][j]
            }
        }
        return dp[0]
    }
}


/*递归的去做 会超出时间限制*/
class Solution1 {
    func miniLadderPathSum(_ ladder: [[Int]],_ preIndex:Int) -> Int {
        guard ladder.count > 0 else {return 0}
        let row = ladder[0]
        let subLadder:[[Int]] = Array.init(ladder[1...])
        let sum1 = row[preIndex] + miniLadderPathSum(subLadder, preIndex)
        let sum2 = row[preIndex+1] + miniLadderPathSum(subLadder, preIndex + 1)
        return min(sum1, sum2)
    }

    func minimumTotal(_ triangle: [[Int]]) -> Int {
        return triangle[0][0] + miniLadderPathSum(Array.init(triangle[1...]), 0)
    }
}


let s = Solution()

let res = s.minimumTotal([[3]])

print(res)

