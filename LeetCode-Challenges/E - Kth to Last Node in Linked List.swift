//
//  E - Kth to Last Node in Linked List.swift
//  
//
//  Created by Audrey Welch on 2/25/20.
//

import Foundation

/*
 
 You have a linked list and want to find the kth to last node.
 
 Write a function kthToLastNode() that takes an integer k and the headNode of a singly-linked list, and returns the kth to last node in the list
 
 */


// Time: O(n)
// Space: O(1)
// It takes n steps to get the length of the list, an another n - k steps to reach the target node. In the worst case k = 1, so we have to walk all the way from head to tail again to reach the target node. This is a total of 2n steps, which is O(n).
class LinkedListNode<Value: Equatable> {

    var value: Value
    var next: LinkedListNode?

    init(_ value: Value) {
        self.value = value
    }
 }

enum KthToLastNodeError: Error, CustomStringConvertible {
    
    case lessThanFirst(Int)
    case largerThanLength(Int)
    
    var description: String {
        switch self {
        case .lessThanFirst(let k):
            return "Impossible to find less than first to last node: \(k)"
        case .largerThanLength(let k):
            return "k is larger than the length of the linked list: \(k)"
        }
    }
    
}

func kthToLastNode(at k: Int, forHead head: LinkedListNode<Int>?) throws -> LinkedListNode<Int>? {
    
    guard k >= 1 else {
        throw KthToLastNodeError.lessThanFirst(k)
    }
    
    // STEP 1: get the lenghth of the list
    // start at 1, not 0
    // else we'd fail to count the head node
    
    var listLength = 1
    var currentNode = head
    
    // traverse the whole list, counting all the nodes
    while currentNode != nil {
        
        currentNode = currentNode?.next
        
        listLength += 1
        
    }
    
    // if k is greater than the length of the list, there can't be
    // a kth-to-last node, so we'll return an error
    guard k <= listLength else {
        throw KthToLastNodeError.largerThanLength(k)
    }
    
    // STEP 2: walk to the target node
    // calculate how far to go, from the head,
    // to get to the kth to last node
    let howFarToGo = listLength - k
    
    // Reset the current node back to the beginning
    currentNode = head

    var prev: LinkedListNode<Int>?
    
    for _ in 0..<howFarToGo {

        prev = currentNode

        currentNode = currentNode?.next
  
    }
    
   return prev
    
}

let a = LinkedListNode(1)
let b = LinkedListNode(2)
let c = LinkedListNode(3)
let d = LinkedListNode(4)
let e = LinkedListNode(5)

a.next = b
b.next = c
c.next = d
d.next = e

// returns the node with value 4 (the 2nd to last node)
var node = try kthToLastNode(at: 2, forHead: a)
print(node?.value)

func kthToLastNodeMySolution(at k: Int, forHead head: LinkedListNode<Int>) throws -> LinkedListNode<Int> {
    
    guard k >= 1 else {
        throw KthToLastNodeError.lessThanFirst(k)
    }
    
    var leftNode = head
    var rightNode = head
    
    // Move rightNode to the kth node
    for _ in 0..<(k - 1) {
        
        // But along the way, if a rightNode doesn't have a next,
        // then k is greater than the length of the list and there
        // can't be a kth-to-last node, so raise an error
        guard let rightNextNode = rightNode.next else {
            throw KthToLastNodeError.largerThanLength(k)
        }
        
        rightNode = rightNextNode
    }
    
    // Starting with leftNode on the head,
    // move leftNode and rightNode down the list,
    // maintaining a distance of k between them,
    // until rightNOde hits the end of the list
    while let rightNextNode = rightNode.next,
        let leftNextNode = leftNode.next {
            leftNode = leftNextNode
            rightNode = rightNextNode
    }
    
    // Since leftNode is k nodes behind rightNode,
    // leftNode is now the kth to last node
    return leftNode
    
}

var node2 = try kthToLastNodeMySolution(at: 2, forHead: a)
print(node2.value)
