//
//  M - Sparse Matrix Multiplication.swift
//  
//
//  Created by Audrey Welch on 6/8/20.
//

import Foundation

/*
 
 Given two sparse matrices A and B, return the result of AB.
 
 You may assume that A's column number is equal to B's row number.
 
 Input:

 A = [
   [ 1, 0, 0],
   [-1, 0, 3]
 ]

 B = [
   [ 7, 0, 0 ],
   [ 0, 0, 0 ],
   [ 0, 0, 1 ]
 ]

 Output:

      |  1 0 0 |   | 7 0 0 |   |  7 0 0 |
 AB = | -1 0 3 | x | 0 0 0 | = | -7 0 3 |
                   | 0 0 1 |
 
 
 */

// I CAN NOT FOR THE LIFE OF MY FIGURE OUT WHAT THE HECK THIS PROBLEM IS SUPPOSED TO DO
// CLEARLY NOT MULTIPLY THE EXISTING NUMBERS BECAUSE WHATTTT ?*!!?

func multiply(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
    
    if A[0].count != B[0].count {
        return [[]]
    }
    
    // Find array with the least number of arrays inside
    // This will be used to stop looping
    var smallerArray = A.count <= B.count ? A : B
    
    var array: [Int] = Array(repeating: 0, count: smallerArray[0].count) // length of arrays
    var resultArray: [[Int]] = Array(repeating: array, count: smallerArray.count) // array of zeros multipled by the number of arrays
    
    print(resultArray)
    
    for row in 0..<smallerArray.count { // number of arrays
        for column in 0..<smallerArray[0].count { // length of arrays
        
            // If we have a zero, resultArray will not change
            if A[row][column] == 0 || B[row][column] == 0 {
                print("\(A[row][column]) OR \(B[row][column]) is equal to zero")
                continue
            } else {
                print("A x B is: \(A[row][column] * B[row][column])")
                resultArray[row][column] = A[row][column] * B[row][column]
            }
        }
    }
    
    
    return resultArray
}

var A = [
  [ 1, 0, 0],
  [-1, 0, 3]
]

var B = [
  [ 7, 0, 0 ],
  [ 0, 0, 0 ],
  [ 0, 0, 1 ]
]

print(multiply(A, B))

// LEETCODE SOLUTION AND I STILL HAVE NO IDEA WHAAAAT WE'RE ACTUALLY DOING HERE


func multiplySolution(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
    // B.rows.count must equal A.cols.count
        
    // preallocate a 2D array of size [A rows][B cols]
    var AB: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count:B[0].count), count: A.count)
        
    // iterate through A in row / col order
    for arow in 0..<A.count {
        for acol in 0..<A[0].count {
            // if we have a zero, AB preset will not change
            if A[arow][acol] != 0 {
                // B.rows == A.cols, so just iterate B.cols
                for bcol in 0..<B[0].count {
                    // invert B' using acol for B.row
                    AB[arow][bcol] += A[arow][acol] * B[acol][bcol]
                }
            }
        }
    }
        
    return AB
}

print(multiplySolution(A, B))
