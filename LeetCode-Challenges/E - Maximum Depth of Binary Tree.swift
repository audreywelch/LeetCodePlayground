//
//  E - Maximum Depth of Binary Tree.swift
//  
//
//  Created by Audrey Welch on 2/18/20.
//

import Foundation

/*
 
 Given a binary tree, find its maximum depth.
 
 The maximum depth is the number of nodes along the longest path
 from the root node down to the farthest leaf node
 
 Note: A leaf is a node with no children
 
 Example:
 Given binary tree [3, 9, 20, null, null, 15, 7]
 Return its depth = 3
 
    3
   / \
  9  20
    /  \
   15   7
 
 */

// Definition for a binary tree node
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

// RECURSIVE DEPTH-FIRST

func maxDepthRecursive(_ root: TreeNode?) -> Int {
    
    // Return 0 if no tree node was supplied
    guard let root = root else { return 0 }
    
    // Add one each time the function is called on the left
    // meaning that a left child does exist
    let left = maxDepthRecursive(root.left) + 1
    
    // Add one each time the function is called on the right
    let right = maxDepthRecursive(root.right) + 1
    
    // Maximum depth will be whichever side of the binary tree is larger
    let depth = max(left, right)
    
    return depth
    
}

// [3, 9, 20, null, null, 15, 7]
var binaryTree = TreeNode(3)
var nodeLeft1 = TreeNode(9)
var nodeRight1 = TreeNode(20)
binaryTree.left = nodeLeft1
binaryTree.right = nodeRight1

var nodeChild1 = TreeNode(15)
var nodeChild2 = TreeNode(7)
nodeRight1.left = nodeChild1
nodeRight1.right = nodeChild2

maxDepthRecursive(binaryTree)

// FIRST ATTEMPT
// [ This does not work - only moves through the left side ]

// In this case, I want to traverse, depth first, and keeping
// a count of how many nodes I have visited.
// Update the count if the next traversal leads to more nodes
// Check if node has left
// If yes, check if that node has a left
// While node.left != nil -> count += 1
// If no, check if the node has right
// If yes, check if it has a left

// DF: keep track of visited, and then recursively check and add
// Create a set that holds nodes that have been visited
// If node has left && if !visitedSet.contains(left.val)
// insert left.val into visitedSet
// count += 1
// If node does not have left, if currentCount > count:
// count = currentCount

func maxDepth(_ root: TreeNode?) -> Int {
    
    var depth: Int = 0
    
    // Count starts at 1 b/c accounts for the root
    var count: Int = 1
    
    // Create a set that holds nodes that have been visited
    var visitedSet: Set<Int> = []
    
    guard let root = root else { return 0 }
    
    var currentNode: TreeNode = root
    
    while !visitedSet.contains(root.left!.val) || !visitedSet.contains(root.left!.val) {
        
        // While there is a left node or a right node
        while currentNode.left != nil || currentNode.right != nil {
            
            // If the left node hasn't been visited
            if !visitedSet.contains(currentNode.left!.val) {
                
                // Add the node's value to the visited set
                visitedSet.insert(currentNode.left!.val)
            
                // Increase the count
                count += 1
            
                // Set the currentNode to the left node
                currentNode = currentNode.left!
            
            // Otherwise, if the right node hasn't been visited
            } else if !visitedSet.contains(currentNode.right!.val) {
                
                visitedSet.insert(currentNode.right!.val)
                
                // Increase the count
                count += 1
                
                currentNode = currentNode.right!
            }
            
            if count > depth {
                depth = count
            }
        }
    }

    return depth
}

//maxDepth(binaryTree)
