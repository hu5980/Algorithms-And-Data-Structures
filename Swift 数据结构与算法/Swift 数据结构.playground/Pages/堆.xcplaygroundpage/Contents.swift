import Foundation

class MaxHeap  {
    private var size:Int
    private var data:[Int]
    private var length:Int
    
    init() {
        size = 0
        length = 3
        data = [Int]()
    }
    
    func getSize() -> Int {
        return size
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    private func parent(index:Int) ->Int? {
        if index == 0 {
            return nil
        }
        return (index - 1) / 2
    }
    
    private func leftChild(index:Int) ->Int {
        return index * 2 + 1
    }
    
    private func rightChild(index:Int) ->Int {
        return index * 2 + 2
    }
    
    func addLength(_ value:Int) {
        if self.getSize() < length {
            add(value)
        }else{
            let minIndex = findMinIndex()!
            data[minIndex] = value
            siftUp(minIndex)
        }
    }
    
    private func add(_ value:Int) {
        if !data.contains(value) {
            data.append(value)
            size += 1
            siftUp(self.getSize() - 1)
        }
    }
    
    private func siftUp(_ k:Int){
        var p = k
        while p > 0 && data[parent(index: p)!] < data[p] {
            let temp = data[p]
            data[p] = data[parent(index: p)!]
            data[parent(index: p)!] = temp
            p = parent(index: p)!
        }
    }
    
    private func findMax() -> Int? {
        if self.getSize() == 0 {
            return nil
        }
        return data[0]
    }
    
    private func findMinIndex() -> Int? {
        if self.getSize() == 0 {
            return nil
        }
        let parentIndex = parent(index: self.size - 1)!
        
        if parentIndex % 2 == 1 || parentIndex == 0 {
            return findMinIndex(parentIndex)
        } else {
            
            let leftIndex = findMinIndex(parentIndex - 1)
            let rightIndex = findMinIndex( parentIndex )
        
            if  data[leftIndex] > data[rightIndex] {
                return rightIndex
            }
            
            return leftIndex
        }
    }
    
    
    
    private func findMinIndex(_ parentIndex:Int) -> Int {
        let leftIndex = leftChild(index: parentIndex)
        let rightIndex = rightChild(index: parentIndex)
        if rightIndex < size {
            return  data[leftIndex] <  data[rightIndex] ? leftIndex : rightIndex
        }
        return leftIndex
    }
    
    func printHeap() {
        for i in data{
            print("\(i)")
        }
    }
}


let heap = MaxHeap.init()

heap.addLength(1)
heap.addLength(2)
heap.addLength(3)
heap.addLength(4)
heap.addLength(5)
heap.addLength(6)
heap.addLength(7)
heap.addLength(8)
heap.addLength(9)
heap.addLength(10)


heap.printHeap()




