//
//  E - Contains Duplicate.swift
//  
//
//  Created by Audrey Welch on 2/5/20.
//

import Foundation

/*
 
 CONTAINS DUPLICATE
 
 Given an array of integers, find if the array contains any duplicates.

 Your function should return true if any value appears at least twice in the array, and it should return false if every element is distinct.

 Example 1:

 Input: [1,2,3,1]
 Output: true
 Example 2:

 Input: [1,2,3,4]
 Output: false
 Example 3:

 Input: [1,1,1,3,3,4,3,2,4,2]
 Output: true

 */

func containsDuplicate(_ nums: [Int]) -> Bool {
        
    var numCountsDictionary: [Int: Int] = [:]
        
    // Create a dictionary of the arrays key: num, value: count
    for eachNum in nums {
            
        // If the dictionary already has the number
        if let count = numCountsDictionary[eachNum] {
                
            // Return true - there are duplicates
            return true
                
        // Otherwise add it to the dictionary
        } else {
            numCountsDictionary[eachNum] = 1
        }
    }
        
    return false
}
