//
//  Implementing a Binary Search Tree.swift
//  
//
//  Created by Audrey Welch on 3/1/20.
//

import Foundation

/*

Insert
    if insertion point is found
        create new vertex
    if value to be inserted < this key
        go left
    else go right

Contains
    if this == null
        return null
    else if this key == search value
        return this
    else if this key < search value
        search right
    else search left

Get Max
    if this is null return empty
    if right != null
        go right
    else return this key


*/

class BinarySearchTree {
    
    var value: Int
    var left: BinarySearchTree?
    var right: BinarySearchTree?
    
    init(value: Int) {
        self.value = value
        
    }
    
    // Takes in the starting node and the value to be inserted
    func insert(node: BinarySearchTree, value: Int) {
        
        // If new value is less than current value (root)
        if value < node.value {
            
            // If there is no node on the left
            if node.left == nil {
                
                // Create a new binary search tree with the value
                self.left = BinarySearchTree(value: value)
                
            // Otherwise, if there is already a node in that place
            } else {
                
                // Recursively call itself (insert) until it finds an empty leaf space
                // to instantiate a new binary search tree
                insert(node: node.left!, value: value)
            }
            
        // If new value is greater than the current/root
        } else if value >= node.value {
            
            if node.right == nil {
                node.right = BinarySearchTree(value: value)
            } else {
                insert(node: node.right!, value: value)
            }
        }
        
    }
}

/*
 
 BINARY SEARCH TREES
 O(log n)

     Objective:
         -> Understand how binary search trees work and what some of their pros and cons are.

     What are Trees?
         - Intuitively, trees can be thought of as linked lists, but without the constraint that each node only points to one other node. A tree node can point to multiple other nodes in the tree.
         - Linked lists themselves count as trees.

     A Binary Tree:
         - We talk about trees in relation to how many different nodes a single node can point to
         - With a binary tree, one node can point to 2 other nodes at most
               o
             /   \
            o     o
           / \   / \
          o   o o   o

     Ternary Tree / 4-ary Tree / Etc.

     Terminology:
         - Root: the topmost node in the tree
         - Child: a node directly connected to another node when moving AWAY from the root node
         - Parent: a node directly connected to another node when moving TOWARDS the root node
         - Siblings: nodes that share the same parent are considered siblings
         - Leaf: a node that does not have any children of its own

     Binary Search Trees:
         - Binary search trees are binary trees that maintain the follwoing invariant/rule:
             .. For any given node, all values in the left subtree are less than the value at the given node.
             .. Conversely, all values in the right subtree are greater than or equal to the value at the given node.

                           (14)
                         /      \
                       9         22
                     /   \     /    \
                   8      11  16     27
             [ all the values to the left, are less than 14, the root ]

             * You can pick any node, and any node on the left side will be smaller, any node on the right side will be bigger

     Example of Binary Search Tree Class

         class BinarySearchTree:
             self.value = value
             self.left = left_subtree
             self.right = right_subtree
         
     In Swift:
         
         class Node {
             var value: Int
             var left: Node?
             var right = Node?
         }

     Checking for a Value in a BinarySearchTree
         bst.contains(11) -> does the value 11 exist in our tree?

         First compare initial value (11) to the root's value: 14
             .. less than? greater than or equal?
                 .. 11 is less than 14, so if 1 exists in our tree, it will exist in the left subtree
                 .. traverse down the left side.

             .. Compare to next node: 9
                 .. greater than 9, so go to the right side of the tree

             .. Compare to next node: 11
                 .. We arrive at the value, they match. So our function returns True to say it does exist.

     Questions to ask yourself:
         - How would inserting into a binary search tree work? How would it differ from the contains example?
         - In the contains example, out of all the elements in the binary search tree, how many did we actually check? How does this compare to the number of elements we would have to check if we were checking for a value in an array or a linked list?
         - Is inserting into a binary search tree more or less work than inserting into an array or linked list? Why?

     Pros & cons
         - Binary Search Trees are optimized for searches
         - Pro:
             .. Searching for an element in a binary search tree is significantly more efficient than searching through an array or linked list.
             * This ends up being more efficient due to a 'divide and conquer' approach.
                 > O(log n) -> for all 'divide and conquer', because if you're splitting in half, it's usually this
                 > always preferred over straight traversing over a data structure
         - Con:
             .. As a tradeoff, it is not as efficient to insert into a binary search tree. This is because you must maintain the order. When we insert it in, we can't just append to the end
             .. The performance of a binary search tree depends quite a lot on whether the tree is 'balanced' or not. Is this generally a good assumption to make - typically balanced trees? When might this assumption be incorrect?
                 > Weighted would be everything is on one side, because our numbers we are inserting are ordered. Giving us a runtime of O(n), and it becomes the same as a linked list, so we should consider why we are using a binary tree in the first place.
 */
