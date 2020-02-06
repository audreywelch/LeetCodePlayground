//
//  E - Sum of Multiples.swift
//  
//
//  Created by Audrey Welch on 2/5/20.
//

import Foundation

/*
 
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

 */

// Brute Force Solution: O(n)
func findSumOfMultiples(number: Int) -> Int {
    
    var result: Int = 0
    
    // Loop through each number
    for eachNumber in 1..<number {
        
        // Check if number is divisible by 3 or by 5
        if eachNumber % 3 == 0 || eachNumber % 5 == 0 {
            
            // If so, add it to the result
            result += eachNumber
            
        }
    }

    return result
    
}

findSumOfMultiples(number: 10) // 23
findSumOfMultiples(number: 16) // 60
findSumOfMultiples(number: 60) // 810
findSumOfMultiples(number: 100) // 2318
