//
//  E - Intersection of Two Arrays II.swift
//  
//
//  Created by Audrey Welch on 2/5/20.
//

import Foundation

/*
 
 Given two arrays, write a function to compute their intersection.
 
 Examples:
 
    > Input: nums1 = [1, 2, 2, 1], nums2 = [2, 2]
    > Output: [2, 2]
 
    > Input: nums1 = [4, 9, 5], nums2 = [9, 4, 9, 8, 4]
    > Output: [4, 9]
 
 Note:
 
    - Each element in the result should appear as many times as it shows in both arrays.
    - The result can be in any order
 
 
 */


// BRUTE FORCE SOLUTION - O(n^2)
// Using .contains() is same runtime
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    
    var result: [Int] = []
    
    var nums2 = nums2
    
    for eachNum1 in nums1 {
        for eachNum2Index in 0..<nums2.count {
            if eachNum1 == nums2[eachNum2Index] {
                result.append(eachNum1)
                nums2.remove(at: eachNum2Index)
                break
            }
        }
    }
    
    return result
}

intersect([1, 2, 2, 1], [2, 2])
intersect([4, 9, 5], [9, 4, 9, 8, 4])
intersect([1, 2, 2, 1], [2])


// DICTIONARY SOLUTION - O(n)
func intersect2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    
    var result: [Int] = []
    var dict: [Int: Int] = [:]
    
    // Make a dictionary of numbers from first array along with their count
    for eachNum1 in nums1 {
        
        // If the number is in the dictionary
        if let num = dict[eachNum1] {
            dict[eachNum1]! += 1
            
        // Otherwise, add it to the dictionary with one occurrence
        } else {
            dict[eachNum1] = 1
        }
    }
    
    // Loop through the second array
    for eachNum2 in nums2 {
        
        // Make sure the dictionary has the number in it as a key,
        // and assign its value to the variable `count`
        // Make sure the value count is more than 0
        guard let count = dict[eachNum2], count > 0 else { continue }
        
        // Add the number to the array
        result.append(eachNum2)
        
        // Decrease the value/count
        dict[eachNum2] = count - 1
        
    }
    
    return result
}

intersect2([1, 2, 2, 1], [2, 2])
intersect2([4, 9, 5], [9, 4, 9, 8, 4])
intersect2([1, 2, 2, 1], [2])

// SORTED ARRAY POINTERS SOLUTION
func intersect3(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    
    var nums1 = nums1.sorted()
    var nums2 = nums2.sorted()
    
    var result: [Int] = []
    
    var pointer1 = 0
    var pointer2 = 0
    
    while pointer1 < nums1.count && pointer2 < nums2.count {
        
        // If the numbers are equal
        if nums1[pointer1] == nums2[pointer2] {
            
            // Append to the result array
            result.append(nums1[pointer1])
            
            // Increase the pointers
            pointer1 += 1
            pointer2 += 1
            
        // If the first array number is less
        } else if nums1[pointer1] < nums2[pointer2] {
            
            // Move the pointer forward because we know there will be no matches
            pointer1 += 1
            
        // If the first array number is greater
        } else {
            
            // Move the pointer forward because we know there will be no matches
            pointer2 += 1
        }
    }
    
    return result
}

intersect3([1, 2, 2, 1], [2, 2])
intersect3([4, 9, 5], [9, 4, 9, 8, 4])
intersect3([1, 2, 2, 1], [2])
