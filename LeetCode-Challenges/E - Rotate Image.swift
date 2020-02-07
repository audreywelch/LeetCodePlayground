//
//  E - Rotate Image.swift
//  
//
//  Created by Audrey Welch on 2/6/20.
//

import Foundation

/*
 
 You are given an n x n 2D matrix representing an image.

 Rotate the image by 90 degrees (clockwise).

 Note:

 You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.

 Example 1:

 Given input matrix =
 [
   [1,2,3],
   [4,5,6],
   [7,8,9]
 ],

 rotate the input matrix in-place such that it becomes:
 [
   [7,4,1],
   [8,5,2],
   [9,6,3]
 ]
 Example 2:

 Given input matrix =
 [
   [ 5, 1, 9,11],
   [ 2, 4, 8,10],
   [13, 3, 6, 7],
   [15,14,12,16]
 ],

 rotate the input matrix in-place such that it becomes:
 [
   [15,13, 2, 5],
   [14, 3, 4, 1],
   [12, 6, 8, 9],
   [16, 7,10,11]
 ]
 
 ** REMEMBER to comment out previous method calls so that
    you are not rotating a formerly rotated array and get confused :)
 
 */

// SOLUTION #1

func rotate(_ matrix: inout [[Int]]) {
    
    // For it to move 90 degrees, assign bottom left to top left
    // top left to top right
    // top right to bottom right
    // bottom right to top left
    
    // Count of the number of arrays
    let count = matrix.count
    
    // For each number from 0 to the half the number of arrays
    for i in 0..<count / 2 {
        
        for j in i..<count - 1 - i {
            
            let temp = matrix[i][j]
            
            matrix[i][j] = matrix[count - 1 - j][i]
            matrix[count - 1 - j][i] = matrix[count - 1 - i][count - 1 - j]
            matrix[count - 1 - i][count - 1 - j] = matrix[j][count - 1 - i]
            matrix[j][count - 1 - i] = temp
        }
    }
    
    
}

var inputMatrix1 = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

var inputMatrix2 = [
    [5, 1, 9, 11],
    [2, 4, 8, 10],
    [13, 3, 6, 7],
    [15, 14, 12, 16]
]

rotate(&inputMatrix1)
// [
//  [7,4,1],
//  [8,5,2],
//  [9,6,3]
// ]


rotate(&inputMatrix2)
// [
//  [15,13, 2, 5],
//  [14, 3, 4, 1],
//  [12, 6, 8, 9],
//  [16, 7,10,11]
//]

// *****************************


// SOLUTION #2
// Common method to solve image rotation problems
// For clockwise rotation:
// First reverse up to down
// Then swap the symmetry (x, y) = (y, x)

/*
 1 2 3      7 8 9      7 4 1
 4 5 6  =>  4 5 6  =>  8 5 2
 7 8 9      1 2 3      9 6 3
 */

func rotateReverseSwapMethod(_ matrix: inout [[Int]]) {
    
    // Check that the matrix has more than one array in it
    guard matrix.count > 1 else { return }
    
    // Make sure the matrix is a square
    guard matrix[0].count == matrix.count else { return }
    
    // Save the count of the number of arrays
    let count = matrix.count
    
    // Reverse the arrays in the matrix
    matrix.reverse()
    
    // Loop through each array in the matrix
    for i in 0..<count {
        
        // Loop through the elements in the array,
        // not including 0,0
        for j in i + 1..<count {
            
            // Swap the symmetry
            (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
        }
    }
}

rotateReverseSwapMethod(&inputMatrix1)

// *****************************

// SOLUTION #3
// Swap then reverse

func rotateSwapThenReverseMethod(_ matrix: inout [[Int]]) {
    
    // Loop through each array in the matrix
    for i in 0..<matrix.count {
        
        // Loop through each element from the second to the end of the array
        for j in i+1..<matrix[i].count {
            
            // Keep track of the element getting replaced
            let t = matrix[i][j]
            
            // Swap the symmetry
            matrix[i][j] = matrix[j][i]
            matrix[j][i] = t
        }
        
        // Reverse the arrays
        matrix[i].reverse()
    }
}

rotateSwapThenReverseMethod(&inputMatrix1)
