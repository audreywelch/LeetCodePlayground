//
//  E - Reverse a Linked List.swift
//  
//
//  Created by Audrey Welch on 2/22/20.
//

import Foundation

// What is a linked list?
// 1 -> 2 -> 3 -> nil

// Define a data structure that supports this list
class Node {
    let value: Int
    var next: Node?
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
}

let threeNode = Node(value: 3, next: nil)
let twoNode = Node(value: 2, next: threeNode)
let oneNode = Node(value: 1, next: twoNode)

func printList(head: Node?) {
    var currentNode = head
    while currentNode != nil {
        print(currentNode?.value ?? -1)
        currentNode = currentNode?.next
    }
}

printList(head: oneNode)

// 1 -> 2 -> 3 -> nil
// nil <- 1 -> 2 -> 3 -> nil
// nil <- 1 <- 2 -> 3 -> nil
// nil <- 1 <- 2 <- 3

// Rather than reconstruct this list, we just need to flip the direction of the arrays

// 1 <- 2 <- 3 <- nil

func reverseList(head: Node?) -> Node? {
    
    var currentNode = head
    
    var prev: Node?
    var next: Node?
    
    while currentNode != nil {
        
        // Save the current node's next in the next variable
        next = currentNode?.next // 2
        
        // Change the current node's next to the previous variable
        currentNode?.next = prev // nil
        
        print("Prev: \(prev?.value ?? -1), Curr: \(currentNode?.value ?? -1), Next: \(next?.value ?? -1)")
        
        // Set previous to the current node
        prev = currentNode // 1
        
        // Set the current node to what was the next
        currentNode = next // 2
    }
    
    // Return the last element
    // Because now the orientation is flipped
    return prev
}

let myReversedList = reverseList(head: oneNode)
printList(head: myReversedList) // needs to print out 3, 2, 1
