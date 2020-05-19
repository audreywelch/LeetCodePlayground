//
//  M - 4Sum.swift
//  
//
//  Created by Audrey Welch on 5/18/20.
//

import Foundation


/*
 
 Given an array nums of n integers and an integer target, are there elements a, b, c, and d in nums
 such that a + b + c + d = target?
 
 Find all unique quadruplets in the array which gives the sum of target.
 
 Note:
    > The solution set must not contain duplicate quadruplets.
 
 Example:
    > Input: [1, 0, -1, 0, -2, 2], target = 0
    > Solution:
        [
            [-1, 0, 0, 1],
            [-2, -1, 1, 2],
            [-2, 0, 0, 2]
        ]
 
 */

/*
 
 PLAN
 
 First thought is to do 2 sets of 2-sum
 Or 2 layers of "locked" indices to compare to using the 3-sum method
 
 */

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    
    var result = [[Int]]()
    
    if nums.count < 4 {
        return result
    }
    
    // Sort the array
    var nums = nums
    nums.sort()
    
    // Loop keeping the first number locked
    for i in 0..<nums.count - 3 {
        
        // Avoid repeats by moving on if it is the same as the one before it
        if i > 0 && nums[i] == nums[i - 1] {
            continue
        }
        
        // Loop keeping second number locked
        for j in i + 1..<nums.count - 2 {
            
            // Avoid repeats
            if j > i + 1 && nums[j] == nums[j - 1] {
                continue
            }
            
            // Create pointers that will move
            var pointer1 = j + 1
            var pointer2 = nums.count - 1
            
            while pointer1 < pointer2 {
                
                // Find sum
                let sum = nums[i] + nums[j] + nums[pointer1] + nums[pointer2]

                // If equal to target, add to results array
                if sum == target {
                    var complement = [nums[i], nums[j], nums[pointer1], nums[pointer2]]
                    result.append(complement)
                    
                    // Move pointers
                    pointer2 -= 1
                    pointer1 += 1
                    
                    // Avoid repeats
                    while nums[pointer2] == nums[pointer2 + 1] && pointer1 < pointer2 {
                        pointer2 -= 1
                    }
                    while nums[pointer1] == nums[pointer1 - 1] && pointer1 < pointer2 {
                        pointer1 += 1
                    }
                 
                // If greater than the target, move the top pointer down
                } else if sum > target {
                    pointer2 -= 1
                    
                // If less than the target, move the lower pointer up
                } else {
                    pointer1 += 1
                }
            }
        }
    }
 
    return result
}

fourSum([1, 0, -1, 0, -2, 2], 0)
/*
 [
     [-1, 0, 0, 1],
     [-2, -1, 1, 2],
     [-2, 0, 0, 2]
 ]
 */


