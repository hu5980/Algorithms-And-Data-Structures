//: [Previous](@previous)

import Foundation


class HashTable {
    
    var M:Int
    var size:Int
    
    init(_ M:Int) {
        self.M = M
        self.size = 0
        
    }
    
    private func hash(_ key:String) {
        return abs(key.hashValue)
    }
    
    public func getSize(){
        return size
    }
    
    public func add(_ key:String,_ value:Int) {
        
    }
    
}

class Student {
    var garde:Int
    var cls:Int
    var firstName:String
    var lastName:String

    init(_ garde:Int,_ cls:Int,_ firstName:String,_ lastName:String) {
        self.garde = garde
        self.cls = cls
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func hashCode() -> Int {
        let B = 40
        var hash = 0
        let M = 1000
        hash = ( hash * B + garde ) % M
        print(hash)
        hash = ( hash * B + cls ) % M
        print(hash)
        hash = ( hash * B + firstName.lowercased().hashValue ) % M
        print(hash)
        hash = ( hash * B + lastName.lowercased().hashValue ) % M
        print(hash)
        return abs(hash)
    }
}

let stu = Student.init(2, 6, "gavin", "hur")
stu.hashCode()

let stu1 = Student.init(5, 6, "gavin", "hu")
stu1.hashCode()
