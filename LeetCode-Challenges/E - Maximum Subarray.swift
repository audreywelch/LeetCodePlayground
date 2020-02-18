//
//  E - Maximum Subarray.swift
//  
//
//  Created by Audrey Welch on 2/17/20.
//

import Foundation

/*
 
 MAXIMUM SUBARRAY
 
 Given an integer array nums, find the contiguous subarray (containing at least one number)
 which has the largest sum and return its sum
 
 Example:
 > Input: [-2, 1, -3, 4, -1, 2, 1, -5, 4]
 > Output: 6
 > Explanation: [4, -1, 2, 1] has the largest sum = 6
 
 Follow up:
 > If you have figured out the O(n) solution, try coding another solution using the
    divide and conquer approach, which is more subtle
 
 */

func maxSubarray(_ nums: [Int]) -> Int {
    
    if nums.isEmpty {
        return 0
    }
    
    // Set the current sum to be the first element in the array
    var sum = nums[0]
    
    // Set the result to be the first element in the array
    var result = nums[0]

    //PLAN
    
    // Each loop will:
    // Find sum: add the element at index i
    
    // Check if the current number is greater than the previous sum
    // if it is, we will start over
    // Set the sum to that number
    
    // Check if it is greater than the result
    // If yes, replace result with currentResult
    
    for i in 1..<nums.count {
        
        // Add the number to the sum
        sum += nums[i]
        
        // If the current number on its own is greater than the sum
        // Set the sum to the current number (starting over)
        if nums[i] > sum {
            sum = nums[i]
        }
        
        // If the sum is greater than current max sum
        // Set result to this sum
        if sum > result {
            result = sum
        }
        
    }
    
    return result
}

maxSubarray([-2, 1, -3, 4, -1, 2, 1, -5, 4])
