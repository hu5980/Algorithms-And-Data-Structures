//: [Previous](@previous)

/*:
 ## 把数组排成最小的数
 输入一个正整数数组，把数组里所有数字拼接起来排成一个数，打印能拼接出的所有数字中最小的一个。例如输入数组{3，32，321}，则打印出这三个数字能排成的最小数字为321323
 */

import Foundation

//var set:Set<String> = Set()
//
//var minNums:String? = nil
//
//func numsToString(_ nums:[Int]) -> String? {
//    if nums.count > 0{
//        var str = String()
//        for num in nums {
//            str.append("\(num)")
//        }
//        return str
//    }
//    return nil
//}
//
//let a = numsToString([1,2,3,4])
//
//func exchange(_ nums:[Int],_ index1:Int ,_ index2:Int) ->[Int] {
//    if index1 >= nums.count || index2 >= nums.count {
//        return nums
//    }
//    if index1 == index2 {
//        return nums
//    }
//    var newNums = nums
//    newNums.swapAt(index1, index2)
//    return newNums;
//}
//
//func minNumber(_ nums:inout [Int] , start:Int ,end:Int) {
//    if start == end {
//        guard let str =  numsToString(nums) else { return }
//        if minNums == nil {
//            minNums = str
//        }else {
//            if minNums! > str {
//                minNums = str
//            }
//        }
//        return
//    }
//    for index in start..<end {
//        var newNums =  exchange(nums, start , index)
//        minNumber(&newNums, start: start + 1, end: end)
//    }
//}
//
//func minNumber(_ nums:[Int]?) -> Int? {
//    if nums?.count ?? 0 == 0 {
//        return nil
//    }
//    var newNums = nums!
//    minNumber(&newNums, start: 0, end: nums!.count)
//    return nil
//}
//
//minNumber([3,32,321,45,32,-1,34])
//print(minNums ?? "")



func printMinNumber(_ data:[Int]) {
    var arr:[String] = []
    
    for i in 0..<data.count {
        arr.append("\(data[i])")
    }
    
    arr = arr.sorted { (a, b) -> Bool in
        let tempA:String = a + b
        let tempB:String = b + a
        return tempA < tempB
    }
    
    print("arr = \(arr)")
    
    let result:String = arr.joined(separator: "")
    print("FlyElephant--最小的数--\(result)")
}

printMinNumber([3,32,321,45,32,-1,34,3,23,42,12])
