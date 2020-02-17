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
 
// FIRST ATTEMPT
func mergeTwoLists2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    /*
    
     PLAN
     
     Check if l1.value <= l2.value
        if yes, newListNode = l1
        then move up: l1 = l1.next
     
     Traverse each list while l1.next != nil || l2.next != nil
     if l1.value <= l2.value:
        newNode.next = l1
        l1 = l1.next
        newNode = newNode.next
     else:
        newNode.next = l2
        l2 = l2.next
        newNode = newNode.next
    */
    
    // If either list is nil, return just the list that was provided
    if l1 == nil { return l2 }
    if l2 == nil { return l1 }
    
    // Assign to variables for mutability
    var l1 = l1
    var l2 = l2
    
    // Result list that will traverse and create new nodes
    // Instantiate with value 0
    var result: ListNode? = ListNode(0)
    
    // Node variable holds the first node in order to return at end
    let node = result

    // Loop through while at least on of the lists has more nodes
    while l1 != nil || l2 != nil {
        
        // If l1 is nil, but l2 still has more nodes
        if l1 == nil {
            // Add the l2 node
            result?.next = ListNode(l2!.val)
            result = result?.next!
            l2 = l2!.next
            
        // If l2 is nil, but l1 still has more nodes
        } else if l2 == nil {
            // Add the l1 node
            result?.next = ListNode(l1!.val)
            result = result?.next!
            l1 = l1!.next
            
        // If l1's value is less than l2
        } else if l1!.val < l2!.val {
            // Create a new node that comes next and assign it the value in l1
            result?.next = ListNode(l1!.val)
            
            // Move l1 forward
            l1 = l1?.next
            
            // Move the result forward
            result = result?.next
            
        // If l2's value is less than l1
        } else if l2!.val < l1!.val {
            // Create a new node that comes next and assign it the value in l2
            result?.next = ListNode(l2!.val)
            
            // Move l2 forward
            l2 = l2?.next
            
            // Move the result forward
            result = result?.next
            
        // If the values are equal
        } else if l1!.val == l2!.val {
            
            // Create two new nodes to hold the equal values
            result?.next = ListNode(l1!.val)
            result?.next!.next = ListNode(l2!.val)
            
            // Move up the result
            result = result?.next!.next!
            
            // Move up both list 1 and 2's nodes
            l1 = l1?.next
            l2 = l2?.next
        }
    }

    // Return the head of the new, merged linked list
    return node?.next
}

var l1 = ListNode(1)
l1.next = ListNode(2)
var secondNode = l1.next
secondNode?.next = ListNode(4)

var l2 = ListNode(1)
l2.next = ListNode(3)
var lastNode = l2.next
lastNode?.next = ListNode(4)

let answer2 = mergeTwoLists2(l1, l2)
print(answer2?.val)



// RECURSIVE SOLUTION
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





// FORMER FIRST ATTEMPT
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




let answer = mergeTwoLists(l1, l2)
print(answer?.val)
