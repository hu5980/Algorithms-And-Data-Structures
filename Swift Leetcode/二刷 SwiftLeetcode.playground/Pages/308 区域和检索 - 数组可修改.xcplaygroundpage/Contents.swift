//: [Previous](@previous)

import Foundation

/**
 给定一个整数数组  nums，求出数组从索引 i 到 j  (i ≤ j) 范围内元素的总和，包含 i,  j 两点。
 
 update(i, val) 函数可以通过将下标为 i 的数值更新为 val，从而对数列进行修改。
 
 示例:
 
 Given nums = [1, 3, 5]
 
 sumRange(0, 2) -> 9
 update(1, 2)
 sumRange(0, 2) -> 8
 说明:
 
 数组仅可以在 update 函数下进行修改。
 你可以假设 update 函数与 sumRange 函数的调用次数是均匀分布的。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/range-sum-query-mutable
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

/**
 采用 线段树来实现
 
 */

class NumArray {

    private var tree:[Int?]
    private var data:[Int]
    init(_ nums: [Any]) {

        if let newNums = nums  as? [Int] {
            tree = [Int?].init(repeating: nil, count: 4*nums.count)
            data = newNums
            buildSegmentTree(0, 0, data.count-1)
        }else {
            data = [Int]()
            tree = [Int?]()
        }
    }

    func update(_ i: Int, _ val: Int) {
        guard data.count > 0 else {
            return
        }
        set(0, 0, data.count-1, i, val)
    }

    private func set(_ treeIndex:Int , _ l:Int , _ r:Int ,_ i:Int, _ val:Int)  {
        guard data.count > 0 else {
            return
        }
        /// 设置递归终止条件 只有当 l == i && r == i 的时候才可以替换
        if l == i && r == i {
            tree[treeIndex] = val
            return
        }

        let leftIndex = leftTreeIndex(treeIndex)
        let rightIndex = rightTreeIndex(treeIndex)
        let mid = l + (r-l)/2

        if i <= mid {
            set(leftIndex, l, mid, i, val)
        }else{
            set(rightIndex, mid+1, r, i, val)
        }

        if let leftResult  = tree[leftIndex] , let rightResult  =  tree[rightIndex] {
             tree[treeIndex] = leftResult + rightResult
        }

    }

    func sumRange(_ i: Int, _ j: Int) -> Int {
        return sumRange(0, 0, data.count-1, i, j)
    }

    /// 通过根节点拿到左边子树的index
    private func leftTreeIndex(_ treeIndex:Int) -> Int {
        return treeIndex * 2 + 1
    }
    /// 通过根节点拿到右边子树的index
    private func rightTreeIndex(_ treeIndex:Int) -> Int {
        return treeIndex * 2 + 2
    }

    /// 创建线段树
    /// - Parameter treeIndex: 线段树的根节点
    /// - Parameter l: 左边区间
    /// - Parameter r: 右边区间
    private func buildSegmentTree(_ treeIndex:Int , _ l:Int , _ r:Int)  {
        // 设置递归终止条件
        if l == r {
            tree[treeIndex] = data[l]
            return
        }
        let leftIndex = leftTreeIndex(treeIndex)
        let rightIndex = rightTreeIndex(treeIndex)
        let mid = l + (r-l)/2
        // 递归创建左边线段树
        buildSegmentTree(leftIndex, l, mid)
        buildSegmentTree(rightIndex, mid+1, r)
        // 将创建的线段树 求和
        if let leftSegmentTreeSum = tree[leftIndex] , let rightSegmentTreeSum = tree[rightIndex] {
            tree[treeIndex] = leftSegmentTreeSum + rightSegmentTreeSum
        }
    }

    /// 区间求和
    /// - Parameter treeIndex: 线段树的根节点
    /// - Parameter l: 左边区间
    /// - Parameter r: 右边区间
    /// - Parameter i: 要求和的左边区间
    /// - Parameter j: 要求和的右边区间
    private func sumRange(_ treeIndex:Int,_ l:Int, _ r:Int , _ i:Int , _ j:Int) -> Int {
        guard data.count > 0 else {
            return 0
        }
        // 1.设置递归终止条件
        if l == i && r == j {
            print(i,j,treeIndex)
            return tree[treeIndex]!
        }

        let leftIndex = leftTreeIndex(treeIndex)
        let rightIndex = rightTreeIndex(treeIndex)
        let mid = l + (r-l)/2

        if r <= mid {
            return sumRange(leftIndex, l, mid, i, j)
        }else if l > mid {
            return sumRange(rightIndex, mid+1, r, i, j)
        }else {
            let leftResult = sumRange(leftIndex, l, mid, i, mid)
            let rightResult = sumRange(rightIndex, mid+1, r, mid+1, j)
            return leftResult + rightResult
        }

    }
}



//class NumArray {
//
//    var nums:[Int]!
//    var tree:[Int]!
//
//
//    init(_ anums: [Int]) {
//        nums = anums
//        tree = Array<Int>(repeating: 0, count: (anums.count<<1)<<1)
//        var numIndex = 0
//        build(0, nums.count-1, 0, &numIndex)
//    }
//
//    func build(_ l:Int, _ r:Int, _ tIndex:Int,_ nIndex:inout Int) {
//        if l > r {
//            return
//        }
//        if l == r {
//            tree[tIndex] = nums[nIndex]
//            nIndex = nIndex+1
//            return
//        }
//        let lChild = tIndex << 1 + 1
//        let rChild = tIndex << 1 + 2
//        let middle = (l+r) >> 1
//        build(l, middle, lChild, &nIndex)
//        build(middle+1, r, rChild, &nIndex)
//        pushUp(lChild,rChild,tIndex)
//    }
//
//    func pushUp(_ lChild:Int, _ rChild:Int, _ pIndex:Int) {
//        tree[pIndex] = tree[lChild]+tree[rChild]
//    }
//
//    func update(_ i: Int, _ val: Int) {
//        nums[i] = val
//        u(i, val, 0, nums.count-1, 0)
//    }
//    func u(_ nIndex:Int, _ nValue:Int, _ tL:Int, _ tR:Int, _ tIndex:Int) {
//        if tL == tR {
//            tree[tIndex] = nValue
//            return
//        }
//        let middle = (tL + tR) >> 1
//        if nIndex >= tL && nIndex <= middle {
//            u(nIndex, nValue, tL, middle, (tIndex<<1)+1)
//        } else if nIndex > middle && nIndex <= tR {
//            u(nIndex, nValue, middle+1, tR, (tIndex<<1)+2)
//        }
//        pushUp((tIndex<<1)+1, (tIndex<<1)+2, tIndex)
//    }
//
//    func sumRange(_ i: Int, _ j: Int) -> Int {
//        return query(i, j, 0, nums.count-1, 0)
//    }
//    func query(_ l:Int, _ r:Int, _ queryL:Int, _ queryR:Int, _ treeIndex:Int) -> Int {
//        if l == queryL && r == queryR {
//            return tree[treeIndex]
//        }
//        let middle = (queryL+queryR)>>1
//        if r <= middle {
//            return query(l, r, queryL, middle, (treeIndex << 1)+1)
//        } else if l > middle {
//            return query(l, r, middle+1, queryR, (treeIndex<<1)+2)
//        } else {
//            return query(l, middle, queryL, middle, (treeIndex<<1)+1) + query(middle+1, r, middle+1, queryR, (treeIndex<<1)+2)
//        }
//    }
//
//}


let nums = [1, 3, 5]
let s = NumArray(nums)

s.sumRange(0, 2)
s.update(1, 2)
s.sumRange(0, 2)

