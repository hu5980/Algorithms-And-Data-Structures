//: [Previous](@previous)

import Foundation

/*:
 
 [岛屿数量](https://leetcode-cn.com/problems/number-of-islands)
 
 给定一个由 '1'（陆地）和 '0'（水）组成的的二维网格，计算岛屿的数量。一个岛被水包围，并且它是通过水平方向或垂直方向上相邻的陆地连接而成的。你可以假设网格的四个边均被水包围。
 
 示例 1:
 
 输入:
 
 11110
 11010
 11000
 00000
 
 输出: 1
 示例 2:
 
 输入:
 
 11000
 11000
 00100
 00011
 
 输出: 3
 */




class Solution {
    
    /*
     深度优先遍历
     */
    private let directions:[[Int]] = [[-1,0],[0,-1],[1,0],[0,1]]//设置方向的数组  左、上、右、下
    private var marked = [[Int]]()//标记数组，标记了 grid 的坐标对应的格子是否被访问过
    private var rows = 0// grid 的行数
    private var cols = 0// grid 的列数
    private var grid:[[Character]] = [[Character]]()// 用来存储传进来的grid
    
    // 封装成 inArea 方法语义更清晰 是否在
    private func inArea(_ x:Int ,_ y:Int) ->Bool {
        return x >= 0 && x < rows && y >= 0 && y < cols
    }
    
    // 从坐标为 (i,j) 的点开始进行深度优先遍历
    private func dfs(_ i:Int,_ j:Int) {
        marked[i][j] = 1
        print("marked = \(marked)")
        for k in 0..<4 {
            let newX = i + directions[k][0]
            let newY = j + directions[k][1]
            if inArea(newX, newY) && grid[newX][newY] == "1" && marked[newX][newY] == 0 {
                dfs(newX, newY)
            }
        }
    }
    
    func numIslands(_ grid: [[Character]]) -> Int {
        rows = grid.count
        if rows == 0 {
            return 0
        }
        cols = grid[0].count
        self.grid = grid
        marked = [[Int]].init(repeating: [Int].init(repeating: 0, count: cols), count: rows)
        var count = 0
        
        for i in 0..<rows {
            for j in 0..<cols {
                // 如果是岛屿中的一个点，并且没有被访问过
                // 就进行深度优先遍历
                if grid[i][j] == "1" && marked[i][j] == 0 {
                    count += 1
                    dfs(i, j)
                }
            }
        }
        return count
    }
}


class Solution1 {
    
    /*
     广度优先遍历
     */
    private let directions:[[Int]] = [[-1,0],[0,-1],[1,0],[0,1]]//设置方向的数组  左、上、右、下
    private var rows = 0  // grid 的行数
    private var cols = 0  // grid 的列数
    private var marked = [[Int]]()//标记数组，标记了 grid 的坐标对应的格子是否被访问过
    private var grid:[[Character]] = [[Character]]()// 用来存储传进来的grid
    // 封装成 inArea 方法语义更清晰 是否在
    private func inArea(_ x:Int ,_ y:Int) ->Bool {
        return x >= 0 && x < rows && y >= 0 && y < cols
    }
    
    
    // 从坐标为 (i,j) 的点开始进行深度优先遍历
    private func bfs(_ i:Int,_ j:Int) {
        marked[i][j] = 1
        var queue = [[Int]]()
        queue.append([i,j])
        while queue.count > 0 {
            print("queue.count = \(queue.count)")
            let cur = queue.removeFirst()
            
            for k in 0..<4 {
                let newX = i + directions[k][0]
                let newY = j + directions[k][1]
                
                if inArea(newX, newY) && grid[newX][newY] == "1" && marked[newX][newY] == 0 {
                    print("x = \(newX) y = \(newY)")
                    queue.append([newX,newY])
                    marked[newX][newY] = 1
                  //  print(marked)
                }
            }
        }
    }
    
    func numIslands(_ grid: [[Character]]) -> Int {
        rows = grid.count
        if rows == 0 {
            return 0
        }
        self.grid = grid
        cols = grid[0].count
        marked = [[Int]].init(repeating: [Int].init(repeating: 0, count: cols), count: rows)
        var count = 0
        
        for i in 0..<rows {
            for j in 0..<cols {
                // 如果是岛屿中的一个点，并且没有被访问过
                // 从坐标为 (i,j) 的点开始进行广度优先遍历
                if grid[i][j] == "1" && marked[i][j] == 0 {
//                    print("i = \(i) ,j = \(j)")
                    print(marked)
                    count += 1
                    bfs(i, j)
                }
            }
        }
        return count
    }
}


let s = Solution1()

let res = s.numIslands([["1", "1", "0", "0", "0"],
                        ["1", "1", "0", "0", "0"],
                        ["0", "0", "1", "0", "0"],
                        ["0", "0", "0", "1", "1"]])

print(res)
