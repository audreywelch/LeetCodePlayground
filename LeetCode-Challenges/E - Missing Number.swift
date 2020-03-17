//
//  E - Missing Number.swift
//  
//
//  Created by Audrey Welch on 3/16/20.
//

import Foundation

/*
 
 Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.

 Example 1:
 Input: [3, 0, 1]
 Output: 2
 
 Example 2:
 Input: [9, 6, 4, 2, 3, 5, 7, 0, 1]
 Output: 8
 
 Note:
 Your algorithm should run in linear runtime complexity. Could you implement it using only constant extra space complexity?
 
 */

// Time: O(n log n)
// Space: O(n)
func missingNumber(_ nums: [Int]) -> Int {
    
    var result: Int = 0

    // If I sort the array: O(n log n)
    let sortedNums = nums.sorted()

    // Make sure there is valid input
    // Check that 0 is at the beginning
    if sortedNums[nums.count - 1] != sortedNums.count {
        return sortedNums.count
    } else if sortedNums[0] != 0 {
        return 0
    }
    
    for i in 0..<sortedNums.count {

        if sortedNums[i + 1] != sortedNums[i] + 1 {
            result = sortedNums[i] + 1
            return result
        }
    }

    
    return result
}

missingNumber([3, 0, 1]) // 2
missingNumber([9, 6, 4, 2, 3, 5, 7, 0, 1]) // 8

// Time: O(n)
// Querying: O(1)
// Space: O(n)
func missingNumberWithHash(_ nums: [Int]) -> Int {
    
    var result = 0
    
    var numSet = Set(nums)

    for number in 0..<nums.count {
        if !numSet.contains(number) {
            return number
        }
    }
    
    return result
}

missingNumberWithHash([3, 0, 1]) // 2
missingNumberWithHash([9, 6, 4, 2, 3, 5, 7, 0, 1]) // 8
