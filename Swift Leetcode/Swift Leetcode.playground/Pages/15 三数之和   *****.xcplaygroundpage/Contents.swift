//: [Previous](@previous)

import Foundation

/*:
 [三数之和](https://leetcode-cn.com/problems/3sum)
 
 给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
 注意：答案中不可以包含重复的三元组。
 
 例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
 
 满足要求的三元组集合为：
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
 */


class Solution {
    /*
     方法一 暴力法
     */
    
    func threeSum_0(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        
        for i in 0..<nums.count-2 {
            for j in i+1..<nums.count-1 {
                for m in j+1..<nums.count {
                    if nums[i] + nums[j] + nums[m] == 0 {
                        let num = [nums[i],nums[j],nums[m]].sorted()
                        if !result.contains(num){
                            result.append(num)
                        }
                    }
                }
            }
        }
        return result
    }
    
    
    /*
     方法二
     使用两数之和来做 ，三数之和为0。那么遍历这个数组 看存不存在两数之和为这个数的相反数 时间复杂度0(n^2)*o(3*log(3)) 空间复杂度0(n)
     */
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return [[Int]]()
        }
        
        var map:[Int:Int] =  [Int:Int]()
        
        for i in 0..<nums.count {
            if map[nums[i]] == nil {
                map[nums[i]] = 1
            }else {
                let num = map[nums[i]]! + 1
                map[nums[i]] = num
            }
        }
        
        var result:[[Int]] = [[Int]]()
        
        for i in 0..<nums.count-2 {
            for j in i+1..<nums.count-1 {
                if map[-(nums[i] + nums[j])] != nil {
                    var count = map[-(nums[i] + nums[j])]! // 这个数出现的次数
                    
                    if nums[i] == -(nums[i] + nums[j]) {
                        count -= 1
                    }
                    if nums[j] == -(nums[i] + nums[j]) {
                        count -= 1
                    }
                    if count > 0 {
                        let num = [nums[i],nums[j],-(nums[i] + nums[j])].sorted()
                        if !result.contains(num) {
                            result.append(num)
                        }
                    }
                }
            }
        }
        return result
    }
    
   /*
     方法三： 先排序
     
    */
    func threeSum_1(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 {
            return [[Int]]()
        }
        var newNums =   nums.sorted()

        var result:[[Int]] = [[Int]]()
        
        for i in 0..<newNums.count - 2 {
            if i > 0 && newNums[i] == newNums[i-1] {
                continue
            }
            
            var left = i + 1
            var right = newNums.count - 1
            let need = 0 - newNums[i]
            
            while left < right {
                if newNums[left] + newNums[right] == need {
                 
                    let num = [newNums[i],newNums[left],newNums[right]]
    
                    result.append(num)
           
                    
                    while left < right && newNums[left] == newNums[left + 1] {
                        left += 1
                    }
                    while left < right && newNums[right] == newNums[right - 1] {
                        right -= 1
                    }
                    
                    left += 1
                    right -= 1
                    
                }else if newNums[left] + newNums[right] >= need {
                    right -= 1
                }else {
                    left += 1
                }
            }
        }
        return result
    }
    
}


let solution = Solution()
//let result = solution.threeSum_0(
//    [13,14,1,2,-11,-11,-1,5,-1,-11,-9,-12,5,-3,-7,-4,-12,-9,8,-13,-8,2,-6,8,11,7,7,-6,8,-9,0,6,13,-14,-15,9,12,-9,-9,-4,-4,-3,-9,-14,9,-8,-11,13,-10,13,-15,-11,0,-14,5,-4,0,-3,-3,-7,-4,12,14,-14,5,7,10,-5,13,-14,-2,-6,-9,5,-12,7,4,-8,5,1,-10,-3,5,6,-9,-5,9,6,0,14,-15,11,11,6,4,-6,-10,-1,4,-11,-8,-13,-10,-2,-1,-7,-9,10,-7,3,-4,-2,8,-13])
//print(result)

let result1 = solution.threeSum([-4,-2,1,-5,-4,-4,4,-2,0,4,0,-2,3,1,-5,0])
print(result1)
