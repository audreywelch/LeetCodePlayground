//
//  E - Single Number.swift
//  
//
//  Created by Audrey Welch on 4/1/20.
//

import Foundation

/*
 
 Given a non-empty array of integers, every element appears twice except for one.
 Find that single one.

 Note:
 Your algorithm should have a linear runtime complexity.
 Could you implement it without using extra memory?

 Example 1:
 > Input: [2,2,1]
 > Output: 1
 
 Example 2:
 > Input: [4,1,2,1,2]
 > Output: 4
 
 */

// O(n) - two loops
func singleNumber(_ nums: [Int]) -> Int {

    var result: Int = 0
    
    var dict: [Int: Int] = [:]
    
    // Create a dictionary as you loop through the array of nums
    for i in 0..<nums.count {
        
        // If it is in the dictionary, increase the count
        if let count = dict[nums[i]] {
            
            dict[nums[i]] = count + 1
            
        } else {
            
            // Put the number in the dictionary if not already in the dictionary
            dict[nums[i]] = 1
        }
    }

    // Return the key that has the value 1
    for (key, value) in dict {
        if value == 1 {
            result = key
            return result
        }
    }
    
    return result

}

singleNumber([2, 2, 1]) // 1
singleNumber([4, 1, 2, 1, 2]) // 4

// ----------------------------------------------------------

// O(n) - one loop
func singleNumber2(_ nums: [Int]) -> Int {
    
    var numberDictionary: [Int: Int] = [:]
    
    // Loop through the array and make a dictionary
    // Holds key: num, value: # of occurrences
    for num in nums {
        
        // If the key already exists in the dictionary,
        // remove it
        if let numValue = numberDictionary[num] {
            numberDictionary.removeValue(forKey: num)
        } else {
            numberDictionary[num] = 1
        }
    }
    
    // At the end of the loop, there should only be one
    // element left in the dictionary
    guard let singleNumber = numberDictionary.keys.first else {
        return 0
    }
    
    // Return the key
    return singleNumber
    
}

singleNumber2([2, 2, 1]) // 1
singleNumber2([4, 1, 2, 1, 2]) // 4

// ----------------------------------------------------------

// NO EXTRA MEMORY
// Nested loop - search for duplicate
// When found, remove both elements
// O(n log n)
func singleNumberNoMem(_ nums: [Int]) -> Int {

    var nums = nums
    var result: Int = 0

    // Sort the array O(n log n)
    nums.sort()

    while nums.count > 1 {
        // If not equal, return nums[0]
        if nums[0] != nums[1] {
            result = nums[0]
            return result

        // if nums[0] == nums[1]
        } else {
            // remove them both
            nums.remove(at: 0)
            nums.remove(at: 0)
        }
    }


    result = nums[0]
    return result
}

singleNumberNoMem([2, 2, 1]) // 1
singleNumberNoMem([4, 1, 2, 1, 2]) // 4
