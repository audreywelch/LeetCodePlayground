//
//  Implementing a Stack.swift
//  
//
//  Created by Audrey Welch on 2/22/20.
//

import Foundation

// Functions: PUSH and POP

// A linked list data structure supports this functionality

class Node<T> {
    let value: T
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
}

class Stack<T> {
    
    var top: Node<T>?
    
    func push(_ value: T) {
        
        // Save the top value into oldTop
        let oldTop = top
        
        // Move the current top to be the new value we are pushing
        top = Node(value: value)
        
        // Set the top's next property to the previous top
        top?.next = oldTop
    }
    
    func pop() -> T? {
        
        // Save the current top value
        let currentTop = top
        
        // Change top to now be the one that was under it
        top = top?.next
        
        // Return the value of the former top one that we are removing
        return currentTop?.value
    }
    
    // Peak at the top item on the stack and see what the value is
    func peek() -> T? {
        return top?.value
    }
}

struct User {
    let name: String
    let username: String
}

let me = User(name: "Audrey", username: "@audwell")
let you = User(name: "You", username: "@you")

let usersStack = Stack<User>()
usersStack.push(me)
usersStack.push(you)

let firstUserPop = usersStack.pop()
print(firstUserPop?.name ?? "")

let stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)

stack.peek()

let firstPop = stack.pop() // should return 3
stack.peek()
let secondPop = stack.pop()
let thirdPop = stack.pop()
let finalPop = stack.pop()
