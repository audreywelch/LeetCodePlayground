//
//  E - Diameter of Binary Tree.swift
//  
//
//  Created by Audrey Welch on 4/13/20.
//

import Foundation

/*
 
 Given a binary tree, you need to compute the length of the diameter of the tree.
 The diameter of a binary tree is the length of the longest path between any two nodes ina tree.
 This path may or may not pass through the root.
 
 Example:
 Given a binary tree
 
     1
    / \
   2   3
  / \
 4   5
 
 Return 3, which is the length of the path [4, 2, 1, 3] or [5, 2, 1, 3].
 
 Note: The length of path between two nodes is represented by the number of edges between them.
 
 THOUGHTS:
 If I'm understanding correctly, we are measuring from the child of the last node that has two children (left and right) to the last node that has no children
 
 */


// Definition for a binary tree node.
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
 
class Solution {

    var resultLength = 0
    
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
    
        guard let currentNode = root else { return 0 }
    
        depth(currentNode)
    
        return resultLength
    }

    func depth(_ root: TreeNode?) -> Int {
    
        guard let currentNode = root else { return 0 }
        
        var left = depth(currentNode.left)
    
        var right = depth(currentNode.right)
        
        let sum = left + right
        
        if resultLength < sum {
            resultLength = sum
        }
        
        return max(left, right) + 1
    
    
    }
}

//    1
//   / \
//  2   3
// / \
//4   5

var solution = Solution()

var left1 = TreeNode(2)
var right1 = TreeNode(3)
var rootNode = TreeNode(1)
rootNode.left = left1
rootNode.right = right1

var left2 = TreeNode(4)
var right2 = TreeNode(5)

left1.left = left2
left1.right = right2

solution.diameterOfBinaryTree(rootNode)
