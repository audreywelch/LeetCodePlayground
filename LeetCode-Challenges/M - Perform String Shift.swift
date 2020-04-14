//
//  M - Perform String Shift.swift
//  
//
//  Created by Audrey Welch on 4/14/20.
//

import Foundation

/*
 
 You are given a string s containing lowercase English letters, and a matrix shift, where shift[i] = [direction, amount]:

    > Direction can be 0 (for left shift) or 1 (for right shift).
    > Amount is the amount by which string s is to be shifted.
    > A left shift by 1 means remove the first character of s and append it to the end.
    > Similarly, a right shift by 1 means remove the last character of s and add it to the beginning.
    > Return the final string after all operations.

  

 Example 1:
    > Input: s = "abc", shift = [[0,1],[1,2]]
    > Output: "cab"
    > Explanation:
        [0,1] means shift to left by 1. "abc" -> "bca"
        [1,2] means shift to right by 2. "bca" -> "cab"
 
 Example 2:
    > Input: s = "abcdefg", shift = [[1,1],[1,1],[0,2],[1,3]]
    > Output: "efgabcd"
    > Explanation:
        [1,1] means shift to right by 1. "abcdefg" -> "gabcdef"
        [1,1] means shift to right by 1. "gabcdef" -> "fgabcde"
        [0,2] means shift to left by 2. "fgabcde" -> "abcdefg"
        [1,3] means shift to right by 3. "abcdefg" -> "efgabcd"
  

 Constraints:
    > 1 <= s.length <= 100
    > s only contains lower case English letters.
    > 1 <= shift.length <= 100
    > shift[i].length == 2
    > 0 <= shift[i][0] <= 1
    > 0 <= shift[i][1] <= 100
 
 */

func performShift(string: String, shiftBy: Int, inDirection: String) -> String {
    
    // Make mutable
    var string = string
    
    if inDirection == "right" {
        
        for _ in 0..<shiftBy {
            
            var finalLetter = string.removeLast()
            string.insert(finalLetter, at: string.startIndex)
        }
        
    } else if inDirection == "left" {
        
        for _ in 0..<shiftBy {
            
            var firstLetter = string.removeFirst()
            string.insert(firstLetter, at: string.endIndex)
        }
    }
    
    
    return string
}

func stringShift(_ s: String, _ shift: [[Int]]) -> String {
    
    var s = s
    
    for array in shift {
        
        // left shift
        if array[0] == 0 {
            s = performShift(string: s, shiftBy: array[1], inDirection: "left")
        
        // right shift
        } else if array[0] == 1 {
            s = performShift(string: s, shiftBy: array[1], inDirection: "right")
        }
    }
    
    return s
}

stringShift("abc", [[0,1],[1,2]]) // "cab"
stringShift("abcdefg", [[1,1],[1,1],[0,2],[1,3]]) // "efgabcd"
