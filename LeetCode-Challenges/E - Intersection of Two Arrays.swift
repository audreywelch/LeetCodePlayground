//
//  E - Intersection of Two Arrays.swift
//  
//
//  Created by Audrey Welch on 2/15/20.
//

import Foundation

/*
 
 Given two arrays, write a function to compute their intersection
 
 Example 1
 
 > Input: nums1 = [1, 2, 2, 1], nums2 = [2, 2]
 > Output: [2]
 
 Example 2
 
 > Input: nums1 = [4, 9, 5], nums2 = [9, 4, 9, 8, 4]
 Output: [9, 4]
 
 Note:
 > Each element in the result must be unique
 > The result can be in any order
 
 */

// Hash Set solution
// Time: O(n)
// Space: O(n)
func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    
    var result: [Int] = []
    
    var set = Set<Int>()
    
    // Create a set
    for num in nums1 {
        set.insert(num)
    }
    
    // Loop through the second array
    for num in nums2 {
        // Check if the set contains the number
        if set.contains(num) {
            // If it does, add it to the result, then remove it from the set
            result.append(num)
            set.remove(num)
        }
    }

    return result
}

var nums1 = [4, 9, 5]
var nums2 = [9, 4, 9, 8, 4]

intersection(nums1, nums2) // [9, 4]
intersection([1, 2, 2, 1], [2, 2]) // [2]

// Sorted and 2-pointers method
// Time: O(n log n)
// Space: O(1)
func intersection2Pointers(_ nums1: [Int], _ nums2: [Int]) -> [Int] {

    var result: [Int] = []
    
    // Sort the arrays
    let arr1 = nums1.sorted()
    let arr2 = nums2.sorted()
    
    var p1 = 0
    var p2 = 0
    
    // Continue until pointers are at the end of the array
    while p1 < arr1.count && p2 < arr2.count {
        
        // Ignore duplicates
        while p1 + 1 < arr1.count && arr1[p1] == arr1[p1 + 1] {
            p1 += 1
        }
        
        while p2 + 1 < arr2.count && arr2[p2] == arr2[p2 + 1] {
            p2 += 1
        }
        
        // If they are equal, add to the result array
        // Increment the pointers the same
        if arr1[p1] == arr2[p2] {
            result.append(arr1[p1])
            p1 += 1
            p2 += 1
            
        // If the first pointer is less than the second
        // move it up one
        } else if arr1[p1] < arr2[p2] {
            p1 += 1
            
        // If the second pointer is less than the second
        // move the second pointer up one
        } else {
            p2 += 1
        }
    }
    
    return result

}

intersection2Pointers(nums1, nums2) // [9, 4]
intersection2Pointers([1, 2, 2, 1], [2, 2]) // [2]



/*
 
 Given two arrays, write a function to compute their intersection.
 
 Example 1:
 > nums1 = [1, 2, 2, 1], nums2 = [2, 2]
 > [2]
 
 Example 2:
 > nums1 = [4, 9, 5], nums2 = [9, 4, 9, 8, 4]
 > [9,4]
 
 Note:
 > Each element in the result must be unique.
 > The result can be in any order.
 
 */

// DICTIONARY SOLUTION
func intersectionOfTwoArrays(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    
    var result: [Int] = []
    
    /*
     
     PLAN
     
     Create a dictionary that stores each of the numbers in the first array (smaller array)
     number: count
     
     Iterate through the second array
     If the dictionary contains the element
     Add the element to the result array
     Remove the element from the array, in order to not add duplicates
     
     */
    
    var dict: [Int: Int] = [:]
    
    for i in 0..<nums1.count {
        
        // If the element is already in the array, add to the count
        if let count = dict[nums1[i]] {
            dict[nums1[i]] = count + 1
            
        // If not, set the count to 1
        } else {
            dict[nums1[i]] = 1
        }
    }
    
    print(dict)
    
    for i in 0..<nums2.count {
        
        // If the dictionary contains the element
        if dict[nums2[i]] != nil {
            // Add it to the result array
            result.append(nums2[i])
            
            // Remove it from the dictionary to avoid repeats
            dict.removeValue(forKey: nums2[i])
            print("removing value for key: \(nums2[i])")
            print(dict)
        }
    }
    
    
    return result
}

intersectionOfTwoArrays([1, 2, 2, 1], [2, 2])
intersectionOfTwoArrays([4, 9, 5], [9, 4, 9, 8, 4])
