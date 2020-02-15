//
//  M - 3Sum.swift
//  
//
//  Created by Audrey Welch on 2/14/20.
//

import Foundation

/*
 
 Given an array `nums` of n integers, are there elements , b, c in `nums` such that a + b + c = 0?
 
 Find all unique triplets in the array which gives the sum of zero
 
 Note: the solution set must not contain duplicate triplets
 
 Example:
 > Input: [-1, 0, 1, 2, -1, -4]
 > Output:
    [
        [-1, 0, 1],
        [-1, -1, 2]
    ]
 
 
 */

// O(n^2)
func threeSum(_ nums: [Int]) -> [[Int]] {
    
    var result = [[Int]]()
    
    /*
     
     PLAN
     
     Sort the array
     
     pointer 1 - array[0]
     pointer 2 - array[1]
     pointer 3 - array[arr.count - 1]
     ^ if all three add up to 0, I would know I can stop b/c need unique triplets and it's sorted
     
     Same as 2Sum with pointers moving up and down the array until they cross
     Except also adding in the pointer1, or the index
     
     First while loop is while index is less than the length of the array
     > (but minus 2 to account for needing two additional numbers after it to make a triplet)
     
     Second while  loop is while startPointer is less than endPointer
     Looking for the two pointers PLUS the index adding up to the target
     Once those pointers cross (become the same index), move up the index one
     and in turn move up the startPointer
     
     */
    
    // Sort the array
    // Sorting is assumed to be O(n log n)
    let nums = nums.sorted()
    
    // Index of base number we are trying to find a triplet for
    var index = 0
    
    // Continue until index still has 2 spaces to the right for possible triplets
    // O(n)
    while index < (nums.count - 2) {
        
        // Set pointers
        var startPointer = index + 1 // Starts one to the right of the index always
        var endPointer = nums.count - 1 // Starts at the end of array always
        
        // Continue until right before pointers cross
        // O(n)
        while startPointer < endPointer {
            
            // Find the sum of current numbers we are looking at
            let sum = nums[index] + nums[startPointer] + nums[endPointer]
            
            // If the sum is equal to zero, append it to our results array
            // because it is a unique triplet
            if sum == 0 {
                let uniqueTriplet = [nums[index], nums[startPointer], nums[endPointer]]
                result.append(uniqueTriplet)
            }
            
            // If the sum is less than zero
            if sum < 0 {
                
                // Move the start pointer up, skipping over duplicates
                // to avoid duplicates in the array causing triplets that aren't unique
                let currentStart = startPointer
                while startPointer < endPointer && nums[startPointer] == nums[currentStart] {
                    startPointer += 1
                }
                
            // If the sum is greater than zero
            } else {
                let currentEnd = endPointer
                while startPointer < endPointer && nums[endPointer] == nums[currentEnd] {
                    endPointer -= 1
                }
            }
        }
        
        // Once the startPointer and endPointer are equal
        // (all numbers between index + 1 and end of the array have been considered)
        // Move the current index up one (skipping over duplicates)
        let currentIndex = index
        while index < (nums.count - 2) && nums[index] == nums[currentIndex] {
            index += 1
        }

    }
    return result

}

threeSum([-1, 0, 1, 2, -1, -4])

/*
 
 Explanation of Time Complexity:
 
 Sorting = O(n log n)
 Then nexted O(n) operations - so for the first N operation, it performs N subsequent operations.
 This is O(n^2).
 O(n log n) + O(n^2) makes it O(n^2) because only the highest order term matters
 
 > The outer loop iterates at most n times (technically n - 2, but doesn't matter). The inner loop depends on the values of left and right. Left is at least 1 and at most the length of array (length minus 1, but doesn't matter). The inner loop only executes if left < right, so the worst case scenario, the inner loop iterates at MOST n times. The outer loop iterates at most n times. For every iteration of the outer loop, the inner loop iterates at most n times, making it O(n^2).
 
 */
