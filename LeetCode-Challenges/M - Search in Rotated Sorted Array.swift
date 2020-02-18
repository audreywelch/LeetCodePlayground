//
//  M - Search in Rotated Sorted Array.swift
//  
//
//  Created by Audrey Welch on 2/18/20.
//

import Foundation

/*
 
Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e., [0, 1, 2, 4, 5, 6, 7] might become [4, 5, 6, 7, 0, 1, 2])
 
 You are given a target value to search. If found in the array, return its index.
 Otherwise, return -1
 
 You may assume no duplicate exists in the array.
 
 Your algorithm's runtime complexity must be in the order of o(log n).
 
 Example 1:
 > Input: nums = [4,5,6,7,0,1,2], target = 0
 > Output: 4
 
 Example 2:
 > Input: nums = [4,5,6,7,0,1,2], target = 3
 > Output: -1
 
 */

/*
 
 THOUGHTS
 
 [1, 2, 4, 5, 6, 7, 0]
 
 Right away, seeing that it needs to run in O(log n), I know I need to use an algorithm that is dividing n to reduce it for each iteration - which makes me think of binary search.
 
 I can take the midpoint
 If the midpoint is greater than the target, since the array is sorted,
 ... wait...
 
 */

func search(_ nums: [Int], _ target: Int) -> Int {
    
    // 1 - find the minimum value to calculate rotation
    
    var low = 0
    var high = nums.count - 1
    
    while low < high {
        let middle = low + (high - low) / 2
        if nums[middle] > nums[high] { // smaller numbers are to the right side
            low = middle + 1
        } else { // smaller numbers are to the left side including middle
            high = middle
        }
    }
    
    let rotation = low // number of elements that were rotated
    
    // 2 - do a binary search, correcting for rotation
    
    low = 0
    high = nums.count - 1
    
    while low <= high {
        let middle = low + (high - low) / 2
        let index = (middle + rotation) % nums.count // correcting for rotation
        if nums[index] == target {
            return index
        }
        if target < nums[index] {
            high = middle - 1
        } else {
            low = middle + 1
        }
    }
    return -1
}

search([4, 5, 6, 7, 0, 1, 2], 0) // 4
search([4,5,6,7,0,1,2], 3) // -1
search([1, 2, 4, 5, 6, 7, 0], 0) // 6
