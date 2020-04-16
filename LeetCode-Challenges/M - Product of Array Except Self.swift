//
//  M - Product of Array Except Self.swift
//  
//
//  Created by Audrey Welch on 4/15/20.
//

import Foundation

/*
 
 Given an array nums of n integers where n > 1, return an array `output` such that `output[i]` is equal to the product of all the elements of nums except nums[i]
 
 Example:
    > Input: [1, 2, 3, 4]
    > Output: [24, 12, 8, 6]
 
 Constraint:
    > It's guaranteed that the product of the elements of any prefix or suffix of the array (including the whole array) fits in a 32 bit integer.
 
 Note:
    > Please solve it without division and in O(n)
 
 Follow up:
    > Could you solve it with constant space complexity? (The output array does not count as extra space for the purpose of space complexity analysis)
 
 */

// BRUTE FORCE
func productExceptSelf(_ nums: [Int]) -> [Int] {
    
    var numsResults: [Int] = []

    // As I loop through, keep track of the former product
    for i in 0..<nums.count {
        
        var leftProduct: Int = 1
        
        for j in 0..<i {
            
            leftProduct *= nums[j]
            
        }
        
        var rightProduct: Int = 1
        for j in i+1..<nums.count {
            rightProduct *= nums[j]
        }
        
        numsResults.append(leftProduct * rightProduct)
        
    }
    
    return numsResults
    
}

productExceptSelf([1, 2, 3, 4]) // [24, 12, 8, 6]

// O(n)
func productExceptSelf2(_ nums: [Int]) -> [Int] {
   var left = [Int](repeating: 1, count: nums.count)
   var right = [Int](repeating: 1, count: nums.count)
    // Final answer array to be returned
    var answer: [Int] = []

    // left[i] contains the product of all the elements to the left
    for i in 1..<nums.count {

        // L[i - 1] already contains the product of elements to the left of 'i - 1'
        // Simply multiplying it with nums[i - 1] would give the product of all
        // elements to the left of index 'i'
        left[i] = nums[i - 1] * left[i - 1]
    }

    // R[i] contains the product of all the elements to the right
    for i in (0..<nums.count-1).reversed() {

        // R[i + 1] already contains the product of elements to the right of 'i + 1'
        // Simply multiplying it with nums[i + 1] would give the product of all
        // elements to the right of index 'i'
        right[i] = nums[i + 1] * right[i + 1]
    }

    // Constructing the answer array
    for i in 0..<nums.count {
        // For the first element, R[i] would be product except self
        // For the last element of the array, product except self would be L[i]
        // Else, multiple product of all elements to the left and to the right
        answer.append(left[i] * right[i])
    }

    return answer
}

productExceptSelf2([1, 2, 3, 4]) // [24, 12, 8, 6]
