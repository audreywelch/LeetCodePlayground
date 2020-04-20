//
//  M - Construct Binary Search Tree from Preorder Traversal.swift
//  
//
//  Created by Audrey Welch on 4/20/20.
//

import Foundation

/*
 
 Return the root node of a binary search tree that matches the given preorder traversal.
 
 > (Recall that a binary search tree is a binary tree where for every node, any descendant of node.left has a value < node.val, and any descendent of node.right has a value > node.val. Also recall that a preorder traversal displays the value of the node first, then traverses node.left, then traverses node.right.)
 
 Example 1:
    > Input: [8, 5, 1, 7, 10, 12]
    > Output: [8, 5, 10, 1, 7, null, 12]
 
 Note:
    1. 1 <= preorder.length <= 100
    2. The values of preorder are distinct
 
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

func bstFromPreorder2(_ preorder: [Int]) -> TreeNode? {
    
    // Root node is the first value in the preorder
    let rootNode: TreeNode = TreeNode(preorder[0])
    
    // Loop through after the first value
    for value in preorder[1...] {
        
        // and insert in the appropriate place
        insert(rootNode, TreeNode(value))
    }
    
    return rootNode
    
}

func insert(_ node: TreeNode, _ newNode: TreeNode) {
    
    // If the newNode is bigger = right
    if node.val < newNode.val {
        
        // if the node.right is already there,
        if let right = node.right {
            
            // recursively call again going down this branch
            insert(right, newNode)
            
        // if it's nil, insert the right node
        } else {
            node.right = newNode
        }
        
    // If the newNode is smaller = left
    } else {
        if let left = node.left {
            insert(left, newNode)
        } else {
            node.left = newNode
        }
    }
    
}

func bstFromPreorder1(_ preorder: [Int]) -> TreeNode? {
    
    var rootNode: TreeNode = TreeNode(preorder[0])
    var node = rootNode
    
    for i in 1..<preorder.count {
        
        // while array[i] is less than array[0]
        while preorder[i] < preorder[0] {
            // treeNode.left = min(array[i], array[i + 1]
            node.left = TreeNode(min(preorder[i], preorder[i + 1]))
            
            // treeNode.right = max(array[i], array[i + 1]
            node.right = TreeNode(max(preorder[i], preorder[i + 1]))
            
            node = node.left ?? node.right ?? node
        }
        
        // while node[i] is greater than array[0]
        while preorder[i] > preorder[0] {
            
            // treeNode.left = min(array[i], array[i + 1]
            node.left = TreeNode(min(preorder[i], preorder[i + 1]))
            
            // treeNode.right = max(array[i], array[i + 1]
            node.right = TreeNode(max(preorder[i], preorder[i + 1]))
            
            node = node.left ?? node.right ?? node
        }
        
    }
    
    
    
    return rootNode
}
