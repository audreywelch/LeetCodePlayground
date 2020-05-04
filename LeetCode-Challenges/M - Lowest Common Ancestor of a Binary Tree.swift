//
//  M - Lowest Common Ancestor of a Binary Tree.swift
//  
//
//  Created by Audrey Welch on 5/4/20.
//

import Foundation

/*
 
 Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.
 
 According to the definition of LCA on Wikipedia: "The lowest common ancestor is defined between two nodes pa nd q as the lowest node in T that has both p and q as descendents (where we allow a node to be a descendant of itself."
 
 Given the following binary tree: root = [3, 5, 1, 6, 2, 0, 8, nil, nil, 7, 4]
 
                    3
                  /   \
                5       1
              /   \   /   \
            6      2  0    8
                  / \
                 7   4
 
 
 Example 1:
    > Input:
        root = [3, 5, 1, 6, 2, 0, 8, null, null, 7, 4],
        p = 5
        q = 1
 
    > Output: 3
    > Explanation: The LCA of nodes 5 and 1 is 3.
 
 Example 2:
    > Input:
        root = [3, 5, 1, 6, 2, 0, 8, null, null, 7, 4]
        p = 5
        q = 4
    > Output: 5
    > Explanation: The LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.
 
 Note:
    > All of the nodes' values will be unique.
    > p and q are different and both values will exist in the binary tree.
 
 
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

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    
    /*
     
     PLAN
     
     Walk through the tree from the root to each of the nodes, keeping track of the path - tree traversal DFS
     Backtrack to look for their most recent ancestor.
     When encounter either nodes p or q, return a boolean flag - flag determines if we found the required nodes in any of the paths.
     The LCA will be the node for which both the subtree recursions return a True falg.
     
     Algorithm:
        1. Start traversing the tree from the root node.
        2. If the current node itself is one of p or q, mark a variable mid as True and continue the search for the other node in the left and right branches.
        3. If either of the left or the right branch returns True, this means one of the two nodes was found below.
        4. If at any point in the traversal, any two of the three flags left, right, or mid become True, this means we've found the lowest common ancestor for the nodes p and q
     
     */
    
    // We break if we hit a leaf node
    // or a root that is p or q
    if root == nil || root === p || root === q { return root }
    
    // DFS recursion left and right
    let left = lowestCommonAncestor(root?.left, p, q)
    let right = lowestCommonAncestor(root?.right, p, q)
    
    // if left is at a leaf, try to go right
    // note: right might be nil, but the base condition will handle that
    if left == nil {
        return right
    }
    
    // if right is at a leaf, try to go left
    // note: left might be nil, but the base condition will handle that
    if right == nil {
        return left
    }
    
    // Both left and right are NOT nil,
    // we have some common node that is not p or q
    return root
}
