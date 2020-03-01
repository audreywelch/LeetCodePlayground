//
//  Implementing a Binary Search Tree.swift
//  
//
//  Created by Audrey Welch on 3/1/20.
//

import Foundation

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
