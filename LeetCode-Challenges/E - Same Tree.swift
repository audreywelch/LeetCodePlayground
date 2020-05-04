//
//  E - Same Tree.swift
//  
//
//  Created by Audrey Welch on 5/4/20.
//

import Foundation

/*
 
 Given two binary trees, write a function to check if they are the same or not.
 
 Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
 
 Example 1
    > Input:     1         1
                / \       / \
               2   3     2   3

              [1,2,3],   [1,2,3]
 
    > Output: true
 
 Example 2
    > Input:     1         1
                /           \
               2             2

            [1, 2],     [1, null, 2]
 
    > Output: false
 
 Example 3
    > Input:      1         1
                 / \       / \
                2   1     1   2

               [1,2,1],   [1,1,2]
 
    > Output: false
 
 */

// Definition for a binary tree node
public class TreeNode {
    
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    
    /*
     
     PLAN
     
     while loop - while p != nil && q != nil
        // Do another recursive search if:
        p's root.left == q's root.left && p's root.right == q's root.right
     
     DFS through recursion

     */
    
    // If they are both nil, they are the same
    if p == nil && q == nil {
        return true
        
    // But if only one is nil, they are not the same
    } else if p == nil || q == nil {
        return false
    }

    // BASE CASE
    // If the values don't match, return false
    if p!.val != q!.val {
        return false
    }
    
    // Otherwise, move the p and q values and call the function again
    if isSameTree(p?.left, q?.left) == true && isSameTree(p?.right, q?.right) == true {
        return true
    } else {
        return false
    }

}

/*
 Example 1
    > Input:     1         1
                / \       / \
               2   3     2   3

              [1,2,3],   [1,2,3]
 
    > Output: true
 
 Example 2
    > Input:     1         1
                /           \
               2             2

            [1, 2],     [1, null, 2]
 
    > Output: false
 
 Example 3
    > Input:      1         1
                 / \       / \
                2   1     1   2

               [1,2,1],   [1,1,2]
 
    > Output: false
 
 */

var left1 = TreeNode(2)
var right1 = TreeNode(3)
var example1 = TreeNode(1, left1, right1)

var left11 = TreeNode(2)
var right11 = TreeNode(3)
var example11 = TreeNode(1, left11, right11)

isSameTree(example1, example11) // true

var left2 = TreeNode(2)
var example2 = TreeNode(1, left2, nil)

var right2 = TreeNode(2)
var example22 = TreeNode(1, nil, right2)

isSameTree(example2, example22) // false

var left3 = TreeNode(2)
var right3 = TreeNode(1)
var example3 = TreeNode(1, left3, right3)

var left33 = TreeNode(1)
var right33 = TreeNode(2)
var example33 = TreeNode(1, left33, right33)

isSameTree(example3, example33) // false

var nilTree = TreeNode()
var anotherNilTree = TreeNode()

isSameTree(nilTree, anotherNilTree) // true
