//
//  E - Recursive Search through Binary Tree.swift
//  
//
//  Created by Audrey Welch on 2/23/20.
//

import Foundation

// 1.
//          10
//          / \
//         5   14
//        /    / \
//       1    11  20

// 2. Data Structure for a node
class Node {
    let value: Int
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: Int, leftChild: Node?, rightChild: Node?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

// Construct a tree

// Left Branch
let oneNode = Node(value: 1, leftChild: nil, rightChild: nil)
let fiveNode = Node(value: 5, leftChild: oneNode, rightChild: nil)

// Right Branch
let twentyNode = Node(value: 20, leftChild: nil, rightChild: nil)
let elevenNode = Node(value: 11, leftChild: nil, rightChild: nil)
let fourteenNode = Node(value: 14, leftChild: elevenNode, rightChild: twentyNode)

let tenRootNode = Node(value: 10, leftChild: fiveNode, rightChild: fourteenNode)


// 3.
// Interviewer's Question: Implement a search algorithm that searches
// through this tree for a particular search value
func search(node: Node?, searchValue: Int) -> Bool {
    
    // Base case for recursion
    if node == nil {
        return false
    }
    
    if node?.value == searchValue {
        return true
        
    // If balanced
    // Search left side if search value is less than current value
    } else if searchValue < node!.value {
        
        return search(node: node?.leftChild, searchValue: searchValue)
        
    // And search right side if serach value is greater than current value
    } else {
        return search(node: node?.rightChild, searchValue: searchValue)
    }
    
    // If not balanced, do the following
    // else {
        // recursion
        // return search(node: node?.leftChild, searchValue: searchValue) || search(node: node?.rightChild, searchValue: searchValue)
    // }
    
}

search(node: tenRootNode, searchValue: 10)

// 4.
// What is the point of all this?

// Efficiency

/*
 
 LEETCODE QUESTION: Search in a Binary Search Tree
 
 Given the root node of a binary search tree and a value, you need to find
 the node in the BST that the node's value equals the given value.
 Return the subtree rooted with that node. If such a node doesn't exist,
 return nil.
 
 Example
 Given the tree:
         4
        / \
       2   7
      / \
     1   3

 And the value to search: 2
 
 You should return this subtree:

   2
  / \
 1   3
 
 
 */


func searchBST(_ root: Node?, _ val: Int) -> Node? {
    
    // Check that node is not nil
    if root == nil {
        return nil
    }
    
    if root?.value == val {
        return root
    } else if root!.value > val {
        return searchBST(root?.leftChild, val)
    } else {
        return searchBST(root?.rightChild, val)
    }

}

print(searchBST(tenRootNode, 14)?.value)
