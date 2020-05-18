//
//  M - 3Sum Closest.swift
//  
//
//  Created by Audrey Welch on 5/18/20.
//

import Foundation

/*
 
 Given an array nums of n integers and an integer target, find three integers in nums such that the sum is closest to target.
 Return the sum of the three integers. You may assume that each input would have exactly one solution.
 
 Example:
    > Given array nums = [-1, 2, 1, -4], and target = 1
    > The sum that is closest to the target is 2: (-1 + 2 + 1 = 2)
 
 */

/*
 
 THOUGHTS/PLAN
 
 // Find the answer to 3Sum
 // Then find the next closest sum to the target
 
 // I think I'll need to keep track of the sums this time
 // in order to find the "next closest"
 
 // Or I could follow the 3Sum method with a rooted number, then 2 pointers
 // dict: [sum: [index1, index2, index3]]
 // And at each 3sum, check if the sum is less than the dict sum (key.first)
 // target - 3sum is less than target - key.first (old 3sum)
 // If so, replace the dictionary with the new sum and indices
 // but it must be greater than zero
 // because zero would indicate it's the target number
 
 // var smallestDifference
 // if 3sum is > 0 && < smallestDifference
 // smallestDifference = 3sum
 
 // 3SUM
 // num1
 // pointer1
 // pointer2
 
 // sort the array
 
 // while pointer1 < pointer2
 // 3sum = num1 + nums[pointer1] + nums[pointer2]
 // var difference = target - 3sum
 // if difference is > 0 && < smallestDifference
 // smallestDifference = 3sum
 
 */

// O(n^2)
func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
    
    // Initialize minimum difference with a large value
    var smallestDiff = Int.max
    var closest = nums[0] + nums[1] + nums[nums.count - 1]

    var num1 = 0
    
    // Sort the array from smallest to largest
    var nums = nums
    nums.sort()
    
    // While there are still 2 numbers left in the array
    while num1 < nums.count - 2 {
        
        // Pointer1 always starts one after num1
        var pointer1 = num1 + 1
        
        // Pointer2 always starts at the end
        var pointer2 = nums.count - 1
        
        // While the pointers haven't crossed each other
        while pointer1 < pointer2 {
            
            // Find sum
            let threeSum = nums[num1] + nums[pointer1] + nums[pointer2]
            
            // Find difference between sum and target
            let difference = abs(target - threeSum)
            
            // If the current difference is smaller than the smallest so far
            if difference < smallestDiff {
                
                // Set the smallest diff and the closest so far to the sum
                smallestDiff = difference
                closest = threeSum
            }
            
            // Move pointers
            
            // Move down b/c a smaller sum is needed to get closer to the target #
            if threeSum > target {
                pointer2 -= 1
                
            // Target sum exists
            } else if threeSum == target {
                return threeSum
                
            // Move up b/c a larger sum is needed to get closer to the target #
            } else {
                pointer1 += 1
            }
        }
        
        // Move the locked number up one and search again
        num1 += 1
    }
    
    
    return closest
}

threeSumClosest([-1, 2, 1, -4], 1) // 2
threeSumClosest([1, 1, 1, 0], -100) // 2
threeSumClosest([0, 2, 1, -3], 1) // 0

// Leetcode Solution - basically the same as my solution
func threeSumClosestSolution(_ nums: [Int], _ target: Int) -> Int {
    
    if nums.count < 3 {
        return 0
    }
    
    let count = nums.count
    var result = nums[0] + nums[1] + nums[count - 1]
    let nums = nums.sorted()
    
    var left = 0
    var right = 0
    var sum = 0
    
    for i in 0..<(count - 2) {
        left = i + 1
        right = count - 1
        
        while left < right {
            sum = nums[i] + nums[left] + nums[right]
            
            if sum > target {
                right -= 1
            } else {
                left += 1
            }
            
            if abs(target - sum) < abs(target - result) {
                result = sum
            }
        }
    }
    return result
}

threeSumClosestSolution([-1, 2, 1, -4], 1) // 2
threeSumClosestSolution([1, 1, 1, 0], -100) // 2
threeSumClosestSolution([0, 2, 1, -3], 1) // 0
