//
//  E - Remove Duplicates from Sorted Array.swift
//  
//
//  Created by Audrey Welch on 2/5/20.
//

import Foundation

"""
Given a sorted array `nums`, remove the duplicates in-place such that each element appear only once and return the new length.

Do not allocate extra space for another array, you must do this by modifying the input array in-place with 0(1) extra memory

Example 1:
    > Given nums = [1,1,2],

    > Your function should return length = 2, with the first two elements of nums being 1 and 2 respectively.

    > It doesn't matter what you leave beyond the returned length.

Example 2:
    > Given nums = [0,0,1,1,1,2,2,3,3,4],

    > Your function should return length = 5, with the first five elements of nums being modified to 0, 1, 2, 3, and 4 respectively.

    > It doesn't matter what values are set beyond the returned length.

"""


func removeDuplicates(nums: inout [Int]) -> Int {
    
    // Make sure that nums has more than one element in it
    guard nums.count > 1 else {
        return nums.count
    }
    
    // Set initial index values as first and second elements in the array
    var index1 = 0
    var index2 = 1
    
    // While there is still another element in the array
    while index2 < nums.count {
        
        // If the first element is equal to the following element
        if nums[index1] == nums[index2] {
            
            // Remove the second one
            nums.remove(at: index2)
            
        // Otherwise, move forward one index
        } else {
            index1 += 1
            index2 += 1
        }
    }
 
    // Return the new array count
    return nums.count
}

//removeDuplicates(nums: &[1, 1, 2])

/*
 
 Dec 11
 Find the Duplicates - Pramp
 
 > Given two sorted arrays arr1 and arr2 of passport numbers, implement a function findDuplicates that returns an array of all passport numbers that are both in arr1 and arr2. Note that the output array should be sorted in ascending order.
 
 > Let N and M be the lengths of arr1 and arr2, respectively. Solve for two cases and analyze the time & space complexities of your solutions: M = N so the array lengths are approximately the same, and M >> N so the arr2 is much bigger than arr1.
 
 INPUT
 arr1 = [1, 2, 3, 5, 6, 7]
 arr2 = [3, 6, 7, 8, 20]
 
 OUPUT
 [3, 6, 7]
 
 
 */

func findDuplicates(arr1: [Int], arr2: [Int]) -> [Int] {
    
    var duplicates: [Int] = []
    var dupDict: [Int: Int] = [:]
    
    // Create a dictionary of the first array's value: # of times
    for eachNumber in arr1 {
        // If the dictionary already has the number
        if let count = dupDict[eachNumber] {
            // Add one to the count
            dupDict[eachNumber] = count + 1
        } else {
            dupDict[eachNumber] = 1
        }
        
    }
    
    // for each value in the second array
    for eachNumber in arr2 {
        
        // if the dictionary has the number
        if dupDict[eachNumber] != nil {
            
            // append it to the duplicates array
            duplicates.append(eachNumber)
        }
        
    }

    return duplicates
}

findDuplicates(arr1: [1, 2, 3, 5, 6, 7], arr2: [3, 6, 7, 8, 20])

// This has a runtime of O(n)
// Space complexity also involves both a new array and a dictionary
// Another solution for less space complexity

func findDuplicates2(arr1: [Int], arr2: [Int]) -> [Int] {

    var duplicates: [Int] = []
    
    var index1: Int = 0
    var index2: Int = 0
    
    while index1 < arr1.count && index2 < arr2.count {
        
        // if the numbers are the same, add them to the duplicate array
        if arr1[index1] == arr2[index2] {
            duplicates.append(arr1[index1])
            
            // increase the indices
            index1 += 1
            index2 += 1
            
        // if the first index is less, the rest of the array does not need to be checked
        // because it's sorted - so move the index forward
        } else if arr1[index1] < arr2[index2] {
            index1 += 1
            
        // if the second index is less, move the index forward
        } else {
            index2 += 1
        }
    }
    
    return duplicates
}

findDuplicates2(arr1: [1, 2, 3, 5, 6, 7], arr2: [3, 6, 7, 8, 20])
