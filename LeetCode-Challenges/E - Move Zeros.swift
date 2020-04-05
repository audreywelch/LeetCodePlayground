//
//  E - Move Zeros.swift
//  
//
//  Created by Audrey Welch on 2/5/20.
//

import Foundation

/*

Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

Example:
Input: [0,1,0,3,12]
Output: [1,3,12,0,0]

Note:
You must do this in-place without making a copy of the array.
Minimize the total number of operations.

*/

func moveZeroes(_ nums: inout [Int]) {
    
    // Keep a count of the number of zeros being removed
    var count: Int = 0
    
    // Loop through the array
    for (eachIndex, eachNum) in nums.enumerated() {
        
        print("\(eachNum) is at the index of \(eachIndex)")
        
        // If the number is a zero,
        if eachNum == 0 {
            
            print("\(eachNum) is equal to 0")

            // remove it and add it to the end of the array
            // at the index subtracting the amount of zeros that have
            // been removed, in order to make sure the index is correct
            nums.remove(at: eachIndex - count)
            
            print("REMOVED the zero: \(nums)")
            
            // Increase the count of zeros
            count += 1
        }
    }
    
    // Add the number of zeros removed to the end of the array
    for _ in 1...count {
        nums.append(0)
    }
    
    print(nums)

}

var inputArray = [0, 1, 0, 3, 12]
moveZeroes(&inputArray) // [[1, 3, 12, 0, 0]]

func moveZeroesSwap(_ nums: inout [Int]) {
    
    // Keeps track of where the last zero is in the array
    var lastZero = 0;
    
    // Loop through each index in the array
    for index in 0..<nums.count {
        
        // If the number at the index is not zero
        if (nums[index] != 0) {
            
            // Swap that number with wherever the last zero is
            (nums[index], nums[lastZero]) = (nums[lastZero], nums[index])
            
            // Increase index of last zero
            lastZero += 1
        }
    }
}

moveZeroesSwap(&inputArray) // [[1, 3, 12, 0, 0]]


// THIS DOESN'T WORK
func moveZeroes2(_ nums: inout [Int]) {

    for i in 0..<nums.count {
        
        if nums[i] == 0 {
            nums.remove(at: i)
            nums.append(0)
        }
    }
}

var input = [0,1,0,3,12]
var input2 = [0, 0, 1]
moveZeroes(&input)
moveZeroes2(&input2)

