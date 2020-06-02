//
//  M - Subarray Sum Equals K.swift
//  
//
//  Created by Audrey Welch on 6/1/20.
//

import Foundation

/*
 
 Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.
 
 Example:
    > Input: nums = [1, 1, 1], k = 2
    > Output: 2
 
 */

func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    
    var result: Int = 0
    
    // Loop through array
    // Loop through array again, but i + 1
    
    // When you hit a
    
    var count = 0
    
    for i in 0..<nums.count {
        
        // Set current count to be the first num in array
        count = nums[i]
        
        // If the count is equal to k,
        // Add one to the result
        if count == k {
            result += 1
        }
        
        // Loop through starting at i + 1
        // only if there is still room in the array
        if i + 1 <= nums.count {
            for j in i + 1..<nums.count {
            
                // Add the number to the temporary count
                count += nums[j]
            
                // If it is equal to k,
                // Add one to the result
                if count == k {
                    result += 1
                }

            }
        }
    }
    
    return result
    
}

subarraySum([1, 1, 1], 2) // 2
subarraySum([1, 1, 1, 2, 1], 3) // 3
