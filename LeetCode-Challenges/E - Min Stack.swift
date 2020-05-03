//
//  E - Min Stack.swift
//  
//
//  Created by Audrey Welch on 5/3/20.
//

import Foundation

/*

 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
 
    > push(x) -- Push element x onto the stack
    > pop(x) -- Removes the element on top of the stack
    > top() -- Get the top element
    > getMin() -- Retrieve the minimum element in the stack
 
 Example
    > Input:
    ["MinStack","push","push","push","getMin","pop","top","getMin"]
    [[],[-2],[0],[-3],[],[],[],[]]

    > Output:
    [null,null,null,null,-3,null,0,-2]

    > Explanation
    MinStack minStack = new MinStack();
    minStack.push(-2);
    minStack.push(0);
    minStack.push(-3);
    minStack.getMin(); // return -3
    minStack.pop();
    minStack.top();    // return 0
    minStack.getMin(); // return -2
 
 Constraints
    > Methods pop, top, and getMin operations will always be called on non-empty stacks.
 
 Stack
    > LIFO
 
 */

class MinStack {
    
    // initialize your data structure here
    struct MinInt {
        var val: Int
        var min: Int
    }
    
    var array: [MinInt]
    var isEmpty: Bool {
        return array.count == 0
    }
    var count = 0
    
    init() {
        array = [MinInt]()
    }
    
    // Pushes element onto the stack
    func push(_ x: Int) {
        var minInt: MinInt
        
        // If the array isn't empty
        if !isEmpty {
            
            // Find the minimum already in the array
            let min = getMin()
            
            // if the minimum is smaller than x, keep the min
            if min < x {
                minInt = MinInt(val: x, min: min)
                
            // if x is smaller, set a new min
            } else {
                minInt = MinInt(val: x, min: x)
            }
        // If the array IS empty
        } else {
            // Set the value as the current minimum
            minInt = MinInt(val: x, min: x)
        }
        array.append(minInt)
    }
    
    // Removes the element on top of the stack
    func pop() {
        
        // If the array isn't empty, remove the top element
        if !isEmpty {
            array.remove(at: array.count - 1)
        }
  
    }
    
    // Returns the element on top of the stack
    func top() -> Int {
        
        if !isEmpty {
            return array.last!.val
        }
        
        return 0
    }
    
    // Returns minimum element in stack
    func getMin() -> Int {
        
        if !isEmpty {
            
            // All intMins are keeping track of the current minimum in the array
            // so you can really return any of them.
            return array.last!.min
        }
        
        return Int.max
    }
}
