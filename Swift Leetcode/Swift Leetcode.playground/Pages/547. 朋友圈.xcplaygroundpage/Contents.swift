import Foundation

/*:
 [朋友圈](https://leetcode-cn.com/problems/friend-circles)
 
 班上有 N 名学生。其中有些人是朋友，有些则不是。他们的友谊具有是传递性。如果已知 A 是 B 的朋友，B 是 C 的朋友，那么我们可以认为 A 也是 C 的朋友。所谓的朋友圈，是指所有朋友的集合。
 
 给定一个 N * N 的矩阵 M，表示班级中学生之间的朋友关系。如果M[i][j] = 1，表示已知第 i 个和 j 个学生互为朋友关系，否则为不知道。你必须输出所有学生中的已知的朋友圈总数。
 
 示例 1:
 
 输入:
 [[1,1,0],
 [1,1,0],
 [0,0,1]]
 输出: 2
 说明：已知学生0和学生1互为朋友，他们在一个朋友圈。
 第2个学生自己在一个朋友圈。所以返回2。
 示例 2:
 
 输入:
 [[1,1,0],
 [1,1,1],
 [0,1,1]]
 输出: 1
 说明：已知学生0和学生1互为朋友，学生1和学生2互为朋友，所以学生0和学生2也是朋友，所以他们三个在一个朋友圈，返回1。
 
 */
class Solution {
    private var studentCount:Int = 0  // 学生数量
    private var isVisited:[Bool] = [Bool]()  // 有没有访问过
    private var M:[[Int]] = [[Int]]()
    
    func dfs(_ i:Int) {
        isVisited[i] = true
        print(isVisited)
        for j in 0..<studentCount {
            if !isVisited[j] && M[i][j] == 1{
                dfs(j)
            }
        }
    }
    
    func findCircleNum(_ M: [[Int]]) -> Int {
        var count = 0
        studentCount = M.count
        self.M = M
        isVisited = [Bool].init(repeating: false, count: studentCount)
        if studentCount == 0 {
            return count
        }
        
        for i in 0..<studentCount {
            if !isVisited[i] {
                count += 1
                dfs(i)
            }
        }
        return count
    }
}


class Solution1 {
    
    class UnionFind {
        
        var count:Int
        var parent:[Int]
        var rank:[Int]
        
        init(_ n:Int) {
            self.count = n
            parent = [Int].init(repeating: 0, count: n)
            rank = [Int].init(repeating: 1, count: n)
            for i in 0..<n {
                parent[i] = i
            }
        }
        
        func getSize() ->Int{
            return self.count
        }
        
        //找到p所对应的集合的rootId
        func find(_ p: Int) -> Int {
            var cp = p
            while cp != self.parent[cp] { //路径压缩
                cp = self.parent[cp]
            }
            return cp
        }
        
        // 判断这两个元素是否在一个集合
        func connected(_ p:Int ,_ q:Int) -> Bool {
            return find(p) == find(q)
        }
        
        //将两个元素合并在一起
        func union(_ p:Int,_ q:Int) {
            let p_root = find(p)
            let q_root = find(q)
            if p_root == q_root {
                return
            }
            
            if self.rank[p_root] > self.rank[q_root] {
                self.parent[q_root] = self.parent[p_root]
            }else if self.rank[p_root] < self.rank[q_root] {
                self.parent[p_root] = self.parent[q_root]
            }else{
                self.parent[q_root] = self.parent[p_root]
                self.rank[p_root] += 1
            }
            self.count -= 1
        }
    }
    var studentCount = 0

    func findCircleNum(_ M: [[Int]]) -> Int {
        var count = 0
        studentCount = M.count
        if studentCount == 0 {
            return count
        }
        let uf = UnionFind.init(studentCount)
        for i in 0..<studentCount {
            for j in 0..<studentCount {
                if M[i][j] == 1 && uf.connected(i, j) {
                    uf.union(i, j)
                }
            }
        }
        
        return uf.count
    }
}

let s = Solution1()
let res = s.findCircleNum([[1,1,0],[1,1,0],[0,0,1]])
print(res)

