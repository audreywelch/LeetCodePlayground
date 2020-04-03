//
//  E - Happy Number.swift
//  
//
//  Created by Audrey Welch on 4/2/20.
//

import Foundation

/*
 
 Write an algorithm to determine if a number is "happy".

 A happy number is a number defined by the following process:
    > Starting with any positive integer, replace the number by the sum of the squares of its digits, and repeat the process until the number equals 1 (where it will stay), or it loops endlessly in a cycle which does not include 1.
    > Those numbers for which this process ends in 1 are happy numbers.

 EXAMPLE
 Input:
    > 19
 
 Output:
    > true
 
 Explanation:
    1^2 + 9^2 = 82
    8^2 + 2^2 = 68
    6^2 + 8^2 = 100
    1^2 + 0^2 + 0^2 = 1
 
 */

func isHappy(_ n: Int) -> Bool {
    
    guard n >= 0 else { return false }
    
    if n == 1 { return true }
    
    var n = n
    var newN = 0
    
    var visited: [Int: Bool] = [:]
    
    // while n is not 1, continue looping
    while n != 1 {
        
        // Check if this number has been visited
        if visited[n] != nil { return false }
        
        // If not, put it in the dictionary
        visited[n] = true
        
        let nString = String(n)
        
        // Split into an array of individual digits
        var nArray = nString.map { $0.wholeNumberValue }
        
        // for each number in the array
        for num in nArray {
            
            // multiply it by itself // Add to newN
            newN += num! * num!
            
        }
        
        // If newN is equal to 1, return true
        if newN == 1 {
            return true
        } else {
            // If not,
            // n = newN
            n = newN
            
            // newN is reset to 0
            newN = 0
        }
 
    }
    
    return false
}

isHappy(19) // true
isHappy(1) // true
isHappy(2) // false
isHappy(22) // false
