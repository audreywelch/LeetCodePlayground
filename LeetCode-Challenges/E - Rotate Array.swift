//
//  E - Rotate Array.swift
//  
//
//  Created by Audrey Welch on 2/5/20.
//

import Foundation

/*
 
 ROTATE ARRAY
 
 > Given an array, rotate the array to the right by k steps, where k is non-negative.
 
 EXAMPLE 1
 Input: [1, 2, 3, 4, 5, 6, 7] and k = 3
 Output: [5, 6, 7, 1, 2, 3, 4]
 
 EXAMPLE 2
 Input: [-1, -100, 3, 99] and k = 2
 Ouput: [3, 99, -1, -100]
 
 */


// BRUTE FORCE
func rotate(_ nums: inout [Int], _ k: Int) {
    
    var rotatedArray = [Int](repeating: 0, count: nums.count)
    
    for currentIndex in 0..<nums.count {
        
        var newIndex = currentIndex + k
        
        // If current index + k is less than the count of the array
        if newIndex < nums.count {
             // insert num to new array with an index of oldIndex + k
            rotatedArray[newIndex] = nums[currentIndex]
            
        // If current index + k is greater than the count of the array
        // AND if the array is ODD
        } else if newIndex >= nums.count && nums.count % 2 != 0 {
            
            // current index - (k + 1) is the new index
            newIndex = currentIndex - (k + 1)
            
            rotatedArray[newIndex] = nums[currentIndex]
        
        // If current index + k is greater than the count of the array
        // And if the array is EVEN
        } else if newIndex >= nums.count && nums.count % 2 == 0 {
            
            newIndex = currentIndex - k
            
            rotatedArray[newIndex] = nums[currentIndex]
            
        // If current index + k is equal to the count of the array
        }
//        else if newIndex == nums.count {
//
//            // Place it as the first number
//            rotatedArray[0] = nums[currentIndex]
//        }
  
    }
    
    nums = rotatedArray
    print(nums)
    print(rotatedArray)

}

var array1 = [1, 2, 3, 4, 5, 6, 7]
var array2 = [-1, -100, 3, 99]

rotate(&array1, 3)
rotate(&array2, 2)


// BETTER SOLUTION
func rotate2(_ nums: inout [Int], _ k: Int) {

    if k > 0 {
        
        // For each number up to and including k
        for _ in 1...k {
            
            // Assign current last item to variable
            let lastItem = nums.last
            
            // Remove the last item
            nums.removeLast()
            
            // Unwrap
            if let lastItem = lastItem {
                
                // Insert the previously last item into the beginning of the array
                nums.insert(lastItem, at: 0)
            }
        }
    }

}
