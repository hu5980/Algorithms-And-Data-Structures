//: [Previous](@previous)

import Foundation

/*
 在一个整型数组中有一个元素的出现次数超过了数组长度的一半，
 试设计一个 在时间上尽可能高效的算法，找出这个元素
 空间复杂度为O（1）
 */

/*
 思路1 可以排序 但是这样时间复杂度 空间复杂度就都有问题了
 思路2 因为超过了一半 所以让相邻的两两比较 如果相等就把currentNum + 1 不相等就把 currentNum - 1 ，当 currentNum == 0 的时候就重置currentNum = 1 跟记录的数 currentAxis
 */

func findNum(_ nums:[Int]) -> Int {
    var currentAxis = 0 //假设要求的元素的位置
    var currentNum = 0; //要求元素的个数变量
    
    for i in 0..<nums.count {
        if(currentNum == 0) {
            //如果要求的元素还没出现，设置要求的元素为现在要比较的元素
            currentAxis = nums[i];
            currentNum = 1;
            print("currentNum = \(currentNum)")
        } else {
            if(currentAxis == nums[i]) {
                currentNum += 1
                print("currentNum = \(currentNum)")
            }else {
                currentNum -= 1
                print("currentNum = \(currentNum)")
            }
        }
    }
    return currentAxis; //返回最终结果的位置
}

let a  = findNum([5,4,3,2,4,6])


