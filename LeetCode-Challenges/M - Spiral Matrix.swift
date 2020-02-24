//
//  M - Spiral Matrix.swift
//  
//
//  Created by Audrey Welch on 2/24/20.
//

import Foundation

/*
 Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
 
 Example 1:
 > Input:
 [
  [ 1, 2, 3 ],
  [ 4, 5, 6 ],
  [ 7, 8, 9 ]
 ]
 > Output: [1,2,3,6,9,8,7,4,5]
 
 Example 2:
 > Input:
 [
   [1, 2, 3, 4],
   [5, 6, 7, 8],
   [9,10,11,12]
 ]
 > Output: [1,2,3,4,8,12,11,10,9,5,6,7]
 
 */

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    
    var result: [Int] = []
    
    guard matrix.count > 0 else { return result }
    
    // Set variables of which index each side will be starting from
    var left = 0
    var right = matrix[0].count - 1
    
    var top = 0
    var bottom = matrix.count - 1

    var direction = "right"
    
    while top <= bottom && left <= right {
        if direction == "right" {
            
            // Add top elements left to right
            for i in left...right {
                result.append(matrix[top][i])
            }
            
            direction = "down"
            
            // Top increases by one, because the right corner is already accounted for
            // so the top starts one element lower
            top += 1
            
        } else if direction == "down" {
            
            // Add right side elements moving down
            for i in top...bottom {
                result.append(matrix[i][right])
            }
            
            direction = "left"
            
            // Next time the right will be at the second to last column
            right -= 1
            
        } else if direction == "left" {
            
            // Add bottom elements moving from right to left
            for i in (left...right).reversed() {
                result.append(matrix[bottom][i])
            }
            
            direction = "up"
            
            // Bottom decreases by one, because the bottom will start
            // one element higher next time
            bottom -= 1
            
        } else if direction == "up" {
            
            // Add left side elements moving from the bottom to the top
            for i in (top...bottom).reversed() {
                result.append(matrix[i][left])
            }
            
            direction = "right"
            
            // Left increases by one, because now the left will start
            // one element inwards
            left += 1
        }
        
    }
    
    return result
}

var input1 =
[
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
]

var input2 =
[
  [1, 2, 3, 4],
  [5, 6, 7, 8],
  [9,10,11,12]
]

spiralOrder(input1) // [1, 2, 3, 6, 9, 8, 7, 4, 5]
spiralOrder(input2) // [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7]

//  for subarray in matrix {
//      // (index, value)
//      for (x, y) in subarray.enumerated() {
//        print("\(x), \(y)")
//      }
//    }

/*
 
 // 4 for-loops:
 // Think about the stop condition - when to stop appending the number
 // When the count of columns and rows become the same number
 // https://leetcode.com/problems/spiral-matrix/
 
                              col 0  col1 col2 col3 col4
input:  inputMatrix  = [ row 0 [1,    2,   3,  4,    5],
                         row 1 [6,    7,   8,  9,   10],
                        row 2  [11,  12,  13,  14,  15],
                        row 3  [16,  17,  18,  19,  20] ]
  
             the number of rows = 4  the number of col = 5
   leftCol = 0 rightCol = 5 -1 = 4 topRow = 0 btmRow = 4 - 1 =3
  
  left to right   row 0 col0  -> row 0 col 4     leftCol 0 rightCol 4
  top to btm      row 1 col4   -> row 3 col 4    topRow 1 btmRow 3
  right to left   row 3 col3   -> row 3 col0     rightCol 3 leftCol 0
  btm to top      row 2 col0  -> row 1 col 0     btmRow 2 topRow 1
*/


