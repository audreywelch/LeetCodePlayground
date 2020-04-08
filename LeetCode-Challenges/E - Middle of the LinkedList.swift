//
//  E - Middle of the LinkedList.swift
//  
//
//  Created by Audrey Welch on 4/8/20.
//

import Foundation

/*
 
 Given a non-empty, singly linked list with head node `head`, return a middle node of linked list.
 If there are two middle nodes, return the second middle node.
 
 Example 1:
    > Input: [1,2,3,4,5]
    > Output: Node 3 from this list (Serialization: [3,4,5])
 
    > Explanation: The returned node has value 3.  (The judge's serialization of this node is [3,4,5]).
        - Note that we returned a ListNode object ans, such that:
        - ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, and ans.next.next.next = NULL.
 
 Example 2:
    > Input: [1,2,3,4,5,6]
    > Output: Node 4 from this list (Serialization: [4,5,6])
 
    > Explanation: Since the list has two middle nodes with values 3 and 4, we return the second one.
  
 Note:
    > The number of nodes in the given list will be between 1 and 100.
 
 
 */


// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
 
func middleNode(_ head: ListNode?) -> ListNode? {
    
    var count = 0
    var currentNode: ListNode? = head
    
    // Loop through the linked list until nil
    while currentNode != nil {
        
        // Counting how many items are in the list
        count += 1
        
        // Move the node forward
        currentNode = currentNode?.next
    }
    print(count)
    
    currentNode = head
    
    // Loop through up to the middle
    for _ in 0..<count/2 {
        currentNode = currentNode?.next
    }
    
    return currentNode
    
//    // If odd
//    if count % 2 != 0 {
//
//        // Then return val
//        return currentNode //.val
//
//    // If even
//    } else {
//
//        // Then return val.next
//        return currentNode?.next //.val
//    }
    
    
}

// [1,2,3,4,5]
var listNode: ListNode? = ListNode(1)
var node2: ListNode? = ListNode(2)
listNode?.next = node2

var node3: ListNode? = ListNode(3)
node2?.next = node3

var node4: ListNode? = ListNode(4)
node3?.next = node4

var node5: ListNode? = ListNode(5)
node4?.next = node5

//var node6: ListNode? = ListNode(6)
//node5?.next = node6

print(middleNode(listNode)?.val)
