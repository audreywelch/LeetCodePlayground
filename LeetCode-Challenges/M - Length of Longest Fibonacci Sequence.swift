//
//  M - Length of Longest Fibonacci Sequence.swift
//  
//
//  Created by Audrey Welch on 2/5/20.
//

import Foundation

"""
A sequence X_1, X_2, ..., X_n is "fibonacci-like" if:
    > n >= 3
    > x_i + X_{i + 1} = X_{i+2} for all i + 2 <= n

Given a strictly increasing array A of positive integers forming a sequence, find the length of the longest fibonacci-like subsequence of A. If one doesn't exist, return 0.

Recall that a subsequence is derived from another sequence A by deleting any number of elements (including none) from A, without changing the order of the remainig elements. For example, [3, 5, 8] is a subsequence of [3, 4, 5, 6, 7, 8].

EXAMPLE 1
Input: [1, 2, 3, 4, 5, 6, 7, 8]
Output: 5
Explanation: The longest subsequence that is fibonacci-like: [1, 2, 3, 5, 8]

EXAMPLE 2
Input: [1, 3, 7, 11, 12, 14, 18]
Output: 3
Explanation: The longest subsequence that is fibonacci-like: [1, 11, 12], [3, 11, 14], or [7, 11, 18]

"""

// Does the number we are looking at (i) + the number after (i + 1) equal any of the remaining numbers in the array?
// If YES: does (i + 1) + that newfound number equal any of the remaining numbers in the array? continued

// If NO: does i + the next number in the array (i + 2) equal any of the remaining numbers in the array?

func lenLongestFibSubseq(_ array: [Int]) -> Int {
    
    // Create sets from the input array
//    let sets = Set<Int>(array)
//    print(sets)
    
    var first = 0
    var second = 0
    var answer = 2
    var current = 2
    
    // Outer loop
    for i in 0..<array.count {
        
        // Inner loop
        for j in (i + 1)..<array.count {
            
            // Currently highest number in the sequence
            current = 2
            
            // First and second numbers we'll be looking at
            first = array[i]
            second = array[j]
            
            // Set the target for the number we want to check if in array
            var target = first + second
            
            // If YES: Keep checking
            while array.contains(target) {
                first = second
                second = target
                target = first + second
                
                // Increase the current sequence count
                current += 1
            }
            
            // Set the answer to the maximum between either the current sequence count our the previous sequence count
            answer = max(answer, current)
        }
    }

    // If the answer is greater than 2, return it - otherwise return 0, that there were not sequences
    return answer > 2 ? answer : 0
}

lenLongestFibSubseq([1, 3, 7, 11, 12, 14, 18]) // 3
lenLongestFibSubseq([1, 2, 3, 4, 5, 6, 7, 8]) // 5
