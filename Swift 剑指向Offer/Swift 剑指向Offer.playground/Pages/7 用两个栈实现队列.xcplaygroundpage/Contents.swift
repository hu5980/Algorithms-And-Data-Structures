//: [Previous](@previous)

import Foundation

/*
 用两个栈来实现一个队列，完成队列的Push和Pop操作。 队列中的元素为int类型
 */

class MyStack {
    private var data:[Int]
    init() {
        data = [Int]()
    }
    
    func push(_ x: Int) {
        data.append(x)
    }

    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        return data.removeLast()
    }

    /** Get the top element. */
    func top() -> Int {
        if empty() {
            fatalError("栈为空")
        }
        return data.last!
    }

    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return data.isEmpty
    }
}

class MyQueue {
    private var stack1:MyStack
    private var stack2:MyStack
    
    init() {
        self.stack1 = MyStack()
        self.stack2 = MyStack()
    }
    
    func push(_ x:Int)  {
        self.stack1.push(x)
    }
    
    func pop() -> Int {
        if stack2.empty() {
            while !stack1.empty() {
                stack2.push(stack1.pop())
            }
        }
        return stack2.pop()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        if stack2.empty(){
            while !stack1.empty() {
                stack2.push(stack1.pop())
            }
        }
        return stack2.top()
    }
    
    func empty() -> Bool {
        return stack1.empty() && stack2.empty()
    }
}

let queue = MyQueue()

queue.push(1)
queue.push(2)
queue.push(3)
queue.push(4)

queue.peek()
queue.pop()
queue.pop()

