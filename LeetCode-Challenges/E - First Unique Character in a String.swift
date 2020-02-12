//
//  E - First Unique Character in a String.swift
//  
//
//  Created by Audrey Welch on 2/11/20.
//

import Foundation

/*
 
 Given a string, find the first non-repeating character in it and return its index.
 If it doesn't exist, return -1.
 
 Note: You may assume the string contains only lowercase letters
 
 Examples:
 > s = "leetcode"
 > return 0
 
 > s = "loveleetcode"
 > return 2
 
 */

// OPTIMIZED SOLUTION
func firstUniqChar(_ s: String) -> Int {

    var result: Int = -1

    // Loop through the string
    // Make a dictionary to hold string: count pairs

    let array = s.map { (String($0)) }
    var dict: [String: Int] = [:]

    for i in 0..<array.count {

        // Check if the string is in the dictionary
        // If it's not nil
        if let count = dict[array[i]] {

            // If it is in the dictionary, it is a repeating character
            // So add 1 to the count
            dict[array[i]] = count + 1

        // If the string is not in the dictionary
        } else {
            // Add it to the dictionary with a count of 1
            dict[array[i]] = 1
        }
    }
    
    // Loop through the array.enumerated to get (value, index)
    // If the dict[value] is 1
    // Return the index
    
    for (index, value) in array.enumerated() {
        
        if dict[value] == 1 {
            result = index
            return result
        }
    }

    return result
}

var input1 = "leetcode" // 0
var input2 = "loveleetcode" // 2
var input3 = "z" // 0
var input4 = "aadadaad" // -1

firstUniqChar(input1) // 0
firstUniqChar(input2) // 2
firstUniqChar(input3) // 0
firstUniqChar(input4) // -1

// BRUTE FORCE SOLUTION
// Problem: doesn't account for repeating of the same duplicate
func firstUniqCharFirstPass(_ s: String) -> Int {
    
    var array = s.map { (String($0)) }
    
    var result: Int = -1
    
    for i in 0..<array.count {

        result = i
        
        for j in (i + 1)..<array.count {
            
            if array[i] == array[j] {
                // array.remove(at: j)
                break
            }
            
            if j == array.count - 1 {
                return result
            }
        }
    }
    
    result = -1
    return result
}

firstUniqCharFirstPass(input1) // 0
firstUniqCharFirstPass(input2) // 2
firstUniqCharFirstPass(input3) // 0
firstUniqCharFirstPass(input4) // -1
