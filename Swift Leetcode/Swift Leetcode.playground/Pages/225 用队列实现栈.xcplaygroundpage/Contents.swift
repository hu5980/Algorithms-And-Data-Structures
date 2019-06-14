//: [Previous](@previous)

/*:
 ### 使用队列实现栈的下列操作：
 
 - push(x) -- 元素 x 入栈
 - pop() -- 移除栈顶元素
 - top() -- 获取栈顶元素
 - empty() -- 返回栈是否为空
 
 ### 注意:
 
 - 你只能使用队列的基本操作-- 也就是 push to back, peek/pop from front, size, 和 is empty 这些操作是合法的。
 - 你所使用的语言也许不支持队列。 你可以使用 list 或者 deque（双端队列）来模拟一个队列 , 只要是标准的队列操作即可。
 - 你可以假设所有操作都是有效的（例如, 对一个空的栈不会调用 pop 或者 top 操作）。
 */

import Foundation


class MyStack {
    
    class MyQueue {
        private var data:[Int]
        init() {
            data = [Int]()
        }
        
        func push(_ x: Int) {
            data.append(x)
        }
        
        func pop() -> Int {
            if empty() {
                fatalError("empty")
            }
            return data.removeFirst()
        }
        
        func empty() -> Bool {
            return data.count == 0
        }
        
        func size() -> Int {
            return data.count
        }
    
    }

    
    private var queue1:MyQueue
    private var queue2:MyQueue
    private var topElement:Int
    
    /** Initialize your data structure here. */
    init() {
        queue1 = MyQueue()
        queue2 = MyQueue()
        topElement = 0
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        topElement = x
        if queue1.empty() && queue2.empty() {
            queue1.push(x)
        }else if !queue1.empty(){
            queue1.push(x)
        }else {
            queue2.push(x)
        }
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
    
        if empty() {
            fatalError("为空 不能出栈")
        }
        if !queue1.empty() {
            
            for i in 0..<queue1.size() - 1 {
                
                
                
                if i == queue1.size() - 2  {
                    topElement = queue1.pop()
                }
                
                queue2.push(topElement)
                
            }
          
            return queue1.pop()
        }else {
            for i in 0..<queue2.size() - 1 {
                if i == queue2.size() - 2  {
                    topElement = queue2.pop()
                }
                
                queue1.push(topElement)
            }
        
            return queue2.pop()
        }
    }
    
    /** Get the top element. */
    func top() -> Int {
        return topElement
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        print(queue1.empty())
        print(queue2.empty())
        return queue1.empty() && queue2.empty()
    }
}


  let obj = MyStack()
  obj.push(1)
  obj.push(2)
  let ret_2: Int = obj.pop()
 obj.top()
  let ret_4: Bool = obj.empty()
 

