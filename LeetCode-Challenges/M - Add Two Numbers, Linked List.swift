//
//  M - Add Two Numbers, Linked List.swift
//  
//
//  Created by Audrey Welch on 2/16/20.
//

import Foundation

/*
 
 You are given two non-empty linked lists representing two non-negative integers.
 The digits are stored in reverse order and each of their nodes contain a single digit.
 Add the two numbers and return it as a linked list
 
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 
 Example:
 > Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 > Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807
 
 */


/*
 
 Iterate through the linked lists l1 and l2 until both cannot be iterated. As each pointer is traversed,
 add the sum of the value, or 0 if nil, AND a carry from the previous loop. If any carry is left over,
 create an extra node for the carry. Then create the carry for the next step.
 
 Time: O(n) to iterate through every node in th elist
 Space: O(n) for th new List Node added as each sum is created
 
 */


// Definition for singly-linked list
public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    var l1 = l1
    var l2 = l2
    
    var result: ListNode? = ListNode(0)
    let head = result
    
    var carry = 0
    
    while l1 != nil || l2 != nil || carry > 0 {
        let firstValue = l1?.val ?? 0
        let secondValue = l2?.val ?? 0
        
        // Find sum of values
        let sum = firstValue + secondValue + carry
        
        // The carry will be the sum divided by 10 (either 0 or 1)
        carry = sum / 10
        
        // Find the value of the next node (the remainder of the sum divided by 10)
        let value = sum % 10
        
        // Assign the value to the next node
        result?.next = ListNode(value)
        
        // Reset result node to be the next node
        result = result?.next
        
        // Move pointers to nodes up one
        l1 = l1?.next
        l2 = l2?.next
        
    }
    
//    if carry > 0 {
//        result?.next = ListNode(carry)
//    }
    
    print(head?.next?.val)
    print(head?.next?.next?.val)
    print(head?.next?.next?.next?.val)
    
    return head?.next
}

//> Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
var firstList1 = ListNode(2)
var firstList2 = ListNode(4)
var firstList3 = ListNode(3)

firstList1.next = firstList2
firstList2.next = firstList3


var secondList1 = ListNode(5)
var secondList2 = ListNode(6)
var secondList3 = ListNode(4)

secondList1.next = secondList2
secondList2.next = secondList3

addTwoNumbers2(firstList1, secondList1)

/*
 
PLAN
 [totally did not work first run-through]

// Variable to hold l1's number/ var l1String: String = "" // add onto it then eventually reverse string
                           // and make it an int

// Variable to hold l2's number
 var l2String: String = ""

// Traverse both linked lists
 l1String += l1.val
 while l1.next != nil {
    l1String += l1.val
 }

 guard let l1Num = Int(l1String) else { return

// Add the l1Num and the l2Num together for
 var l3Num

// Convert to a string

// Reverse the string

// Put it into an array

// Create an instance of a ListNode

 var newNode = ListNode(val: array[0])
 var previousNode = newNode

 For i in 1..<NumString.count {
   
   // Create a new node
    newNode = ListNode(val: array[i])

   // Assign the previous node as this node's next value
    previousNode.next = newNode

   // Make the previous node now be this node
    previousNode = newNode
 */

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
     
    // Variable to hold l1's number
    var l1String: String = ""
     
    // Variable to hold l2's number
    var l2String: String = ""
     
    // Traverse both linked lists
    
    // Add first value in each linked list to the array
    l1String + String(l1!.val)
    l2String + String(l2!.val)
    
    var currentl1Node = l1
    var currentl2Node = l2
    
    // While each node has a next value, append it to the array
    while currentl1Node?.next != nil {
        l1String + String(currentl1Node!.val)
        currentl1Node = currentl1Node?.next
    }
    
    while currentl2Node?.next != nil {
        l2String + String(currentl2Node!.val)
        currentl2Node = currentl2Node?.next
    }
    
    // Add the l1Num and the l2Num together for
    let l3Num = ( Int(l1String) ?? 0 ) + ( Int(l2String) ?? 0 )
     
    // Convert to a string
    let l3String = String(l3Num)
     
    // Put it into an array and reverse
    var l3Array = l3String.map { Int(String($0)) }
    l3Array.reverse()
     
    // Create an instance of a ListNode
     
    var newNode = ListNode(l3Array[0]!)
    var previousNode = newNode
     
    for i in 1..<l3Array.count {
        
        // Create a new node
        newNode = ListNode(l3Array[i]!)
     
        // Assign the previous node as this node's next value
        previousNode.next = newNode
     
        // Make the previous node now be this node
        previousNode = newNode
    }

    return newNode

}

addTwoNumbers(firstList1, secondList1)
