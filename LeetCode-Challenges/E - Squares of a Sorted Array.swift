//
//  E - Squares of a Sorted Array.swift
//  
//
//  Created by Audrey Welch on 5/29/20.
//

import Foundation

/*
 
 Given an array of integers A sorted in non-decreasing order, return an array of the squares of each number, also in sorted, non-decreasing order.
 
 Example 1:
    > Input: [-4, -1, 0, 3, 10]
    > Output: [0, 1, 9, 16, 100]
 
 Example 2:
    > Input: [-7, -3, 2, 3, 11]
    > Output: [4, 9, 9, 49, 121]
 
 Note:
    1 <= A.length <= 10000
    -10000 <= A[i] <= 10000
    A is sorted in non-decreasing order.
 
 */

// OPTIONS
// Loop through, squaring each number and putting it in a new array
// Sort

// Use map
// then sort

func sortedSquares(_ A: [Int]) -> [Int] {

//    var unsortedSquares = A.map { $0 * $0 }
//
//    unsortedSquares.sort()
//
//    return unsortedSquares
    
    // OR in one line
    return A.map { $0 * $0 }.sorted()
}

sortedSquares([-4, -1, 0, 3, 10]) // [0, 1, 9, 16, 100]
sortedSquares([-7, -3, 2, 3, 11]) // [4, 9, 9, 49, 121]

