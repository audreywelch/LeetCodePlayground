//
//  E - Binary Search.swift
//  
//
//  Created by Audrey Welch on 2/23/20.
//

import Foundation

/*
 
 Given a sorted (in ascending order) integer array nums of n elements and a target value,
 write a function to search target in nums. If target exists, then return its index,
 otherwise return -1.
 
 Example 1:

 Input: nums = [-1,0,3,5,9,12], target = 9
 Output: 4
 Explanation: 9 exists in nums and its index is 4

 Example 2:

 Input: nums = [-1,0,3,5,9,12], target = 2
 Output: -1
 Explanation: 2 does not exist in nums so return -1
 
 Note:

 You may assume that all elements in nums are unique.
 n will be in the range [1, 10000].
 The value of each element in nums will be in the range [-9999, 9999].
 
 */

func binarySearch(_ nums: [Int], _ target: Int) -> Int {
    
    // Left index will be the beginning of the subarray
    var leftIndex = 0
    
    // Right index will be the end of the subarray
    var rightIndex = nums.count - 1
    
    // While the left index is less right index
    while leftIndex <= rightIndex {
        
        // Find index of the middle of the array
        let middleIndex = (leftIndex + rightIndex) / 2
        
        // Find the value at that middle index
        let middleValue = nums[middleIndex]
        
        // If the middle value is equal to the target, return the index of that number
        if middleValue == target {
            return middleIndex
        }
        
        // If the target is less than the middle value, search the left side
        if target < middleValue {
            
            // Move the end of the array to be searched to one less than the middle index
            rightIndex = middleIndex - 1
            
        // If the target is greater than the middle value, search the right side
        } else if target > middleValue {
            
            // Move the beginning of the array to be searched to one greater than the middle index
            leftIndex = middleIndex + 1
        }
        
    }
    
    
    return -1
}

binarySearch([-1,0,3,5,9,12], 9) // 4
binarySearch([-1,0,3,5,9,12], 2) // -1
