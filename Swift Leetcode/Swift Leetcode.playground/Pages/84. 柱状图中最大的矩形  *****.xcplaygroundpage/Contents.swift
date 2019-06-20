//: [Previous](@previous)

import Foundation

/*:
 [柱状图中最大的矩形](https://leetcode-cn.com/problems/largest-rectangle-in-histogram/)
 
 给定 n 个非负整数，用来表示柱状图中各个柱子的高度。每个柱子彼此相邻，且宽度为 1 。
 
 求在该柱状图中，能够勾勒出来的矩形的最大面积
 
 ![图片1](histogram.png)
 
 
 以上是柱状图的示例，其中每个柱子的宽度为 1，给定的高度为 [2,1,5,6,2,3]。
 
 
 ![图片2](histogram_area.png)
 图中阴影部分为所能勾勒出的最大矩形面积，其面积为 10 个单位。
 
 示例:
 
 输入: [2,1,5,6,2,3]
 输出: 10
 */


/*
 方法一 ：暴力法  我们可以想到，两个柱子间矩形的高由它们之间最矮的柱子决定  因此，我们可以考虑所有两两柱子之间形成的矩形面积，该矩形的高为它们之间最矮柱子的高度，宽为它们之间的距离，这样可以找到所要求的最大面积的矩形。
 */

func largestRectangleArea(_ heights: [Int]) -> Int {
    
}
