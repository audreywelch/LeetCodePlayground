//
//  E - Merge Two Sorted Lists.swift
//  
//
//  Created by Audrey Welch on 2/5/20.
//

import Foundation

"""
Merge two sorted linked lists and return it as a new list. The new list should splice together the nodes of the first two lists

Example:
Input: 1 -> 2 -> 4, 1 -> 3 -> 4
Output: 1 -> 1 -> 2 -> 3 -> 4 -> 4

"""


// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
 }
 


func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
    var currentNode1 = l1
    var currentNode2 = l2
        
    var mergedNode = ListNode(currentNode1!.val)
    print(mergedNode.val)
    mergedNode.next = ListNode(currentNode2!.val)
    mergedNode = mergedNode.next!
    print(mergedNode.val)
        
    // while the currentNode1.next is not nil
    while currentNode1?.next != nil {
        while currentNode2?.next != nil {

                
            currentNode1 = currentNode1?.next!
            currentNode2 = currentNode2?.next!
            mergedNode.next = ListNode(currentNode1!.val)
            mergedNode = mergedNode.next!
            print(mergedNode.val)
            mergedNode.next = ListNode(currentNode2!.val)
            mergedNode = mergedNode.next!
            print(mergedNode.val)
                    
        }
    }
    
    return mergedNode
}


var l1 = ListNode(1)
l1.next = ListNode(2)
var secondNode = l1.next
secondNode?.next = ListNode(4)

var l2 = ListNode(1)
l2.next = ListNode(3)
var lastNode = l2.next
lastNode?.next = ListNode(4)

let answer = mergeTwoLists(l1, l2)
print(answer?.val)



func mergeTwoListsRecursive(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    if l1 == nil { return l2 }
    if l2 == nil { return l1 }
    
    var result: ListNode? = nil
    
    // Because the list is already sorted, this helps determine
    // whether we insert a node from l1 or l2
    
    // If we need to add a node from l1
    if l1!.val <= l2!.val {
        
        // Result is equal to the l1 node
        result = l1
        
        // The node's next property is the result of the function again
        // except using l1's next node
        result!.next = mergeTwoListsRecursive(l1!.next, l2)
        
    // If we need to add a node from l2
    } else {
        
        result = l2
        
        result!.next = mergeTwoListsRecursive(l1, l2!.next)
    }
    
    return result
  
}

let recursiveAnswer = mergeTwoListsRecursive(l1, l2)


print(recursiveAnswer?.val)
