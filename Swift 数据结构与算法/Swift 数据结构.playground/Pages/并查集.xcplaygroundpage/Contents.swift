//: [Previous](@previous)

import Foundation


class UnionFind {
    private var count:Int    // 总个数
    private var parent:[Int] // 根
    private var rank:[Int] // 深度
    
    init(_ n:Int) {
        self.count = n
        parent = [Int].init(repeating: 0, count: n)
        rank = [Int].init(repeating: 1, count: n)
        for i in 0..<n {
            parent[i] = i
        }
    }
    
    func getSize() ->Int {
        return self.count
    }
    
    func find(_ p:Int) -> Int {
        var cp = p
        while cp != self.parent[cp] {
            cp = self.parent[cp]
        }
        return cp
    }
    
    func connected(_ p:Int,_ q:Int) ->  Bool{
        return find(p) == find(q)
    }
    
    func union(_ p:Int ,_ q:Int) {
        let pID = find(p)
        let qID = find(q)
        if pID == qID {
            return
        }
        
        if self.rank[pID] > self.rank[qID] {
            self.parent[qID] = self.parent[pID]
        }else if self.rank[pID] < self.rank[qID] {
            self.parent[pID] = self.parent[qID]
        }else {
            self.parent[pID] = self.parent[qID]
            self.rank[qID] += 1
        }
        self.count -= 1
    }
}


let un = UnionFind.init(10)

un.getSize()

un.find(5)
un.find(4)
un.union(5, 4)
un.find(5)
un.find(4)
