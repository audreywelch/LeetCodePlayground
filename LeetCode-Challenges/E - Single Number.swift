//
//  E - Single Number.swift
//  
//
//  Created by Audrey Welch on 2/5/20.
//

import Foundation

/*
 
 Given a non-empty array of integers, every element appears twice except for one. Find that single one.
 
 Note: your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 Example:

    > Input: [2, 2, 1]
    > Output: 1
 
    > [4, 1, 2, 1, 2]
    > 4

 */

func singleNumber(_ nums: [Int]) -> Int {
    
    var numberDictionary: [Int: Int] = [:]
    
    // Loop through the array and make a dictionary
    // Holds key: num, value: # of occurences
    for num in nums {
        
        // If the key already exists in the dictionary, remove it
        if let numValue = numberDictionary[num] {
            numberDictionary.removeValue(forKey: num)
        } else {
            numberDictionary[num] = 1
        }
    }
    
    // At the end of the loop there should only be one element left in the dictionary
    guard let singleNumber = numberDictionary.keys.first else {
        return 0
    }
    
    // Return the key
    return singleNumber
    
}


print(singleNumber([6, 7, 3, 3, 6, 4, 1, 2, 7, 1, 2]))
