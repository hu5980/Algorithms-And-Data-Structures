//: [Previous](@previous)

import Foundation

/*:
 
 [309最佳买卖股票时机含冷冻期](https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-with-cooldown)
 
 给定一个整数数组，其中第 i 个元素代表了第 i 天的股票价格 。
 
 设计一个算法计算出最大利润。在满足以下约束条件下，你可以尽可能地完成更多的交易（多次买卖一支股票）:
 
 你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
 卖出股票后，你无法在第二天买入股票 (即冷冻期为 1 天)。
 示例:
 
 输入: [1,2,3,0,2]
 输出: 3
 解释: 对应的交易状态为: [买入, 卖出, 冷冻期, 买入, 卖出]
 
 */


class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp_i_0 = 0
        var dp_i_1 = Int.min
        var dp_pre_0 = 0 // 代表 dp[i-2][0]
        for i in 0..<n {
            let temp = dp_i_0
            dp_i_0 = max(dp_i_0, dp_i_1 + prices[i])
            dp_i_1 = max(dp_i_1, dp_pre_0 - prices[i])
            dp_pre_0 = temp
        }
        return dp_i_0
    }
}

class Solution1{
    func maxProfit(_ prices: [Int]) -> Int {
        let n = prices.count
        var dp_i10 = 0, dp_i11 = Int.min
        var dp_i20 = 0, dp_i21 = Int.min
        for i in 0..<n {
            dp_i20 = max(dp_i20, dp_i21 + prices[i]);
            dp_i21 = max(dp_i21, dp_i10 - prices[i]);
            dp_i10 = max(dp_i10, dp_i11 + prices[i]);
            dp_i11 = max(dp_i11, -prices[i]);
        }
        return dp_i20;
    }
}


let s = Solution1()
s.maxProfit([1,2,4,5,2,7])
