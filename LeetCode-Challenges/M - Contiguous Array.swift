//
//  M - Contiguous Array.swift
//  
//
//  Created by Audrey Welch on 4/13/20.
//

import Foundation

/*
 
 Given a binary array, find the maximum length of a contiguous subarray with equal number of 0 and 1.

 Example 1:
    > Input: [0,1]
    > Output: 2
    > Explanation: [0, 1] is the longest contiguous subarray with equal number of 0 and 1.
 
 Example 2:
    > Input: [0,1,0]
    > Output: 2
    > Explanation: [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
 
 Note: The length of the given binary array will not exceed 50,000.
 
 [0, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 0]
 
------------------
 
 THOUGHTS:
 
    > We have to find the longest contigous subarray with equal number of ones and zeroes

    > Thinking Process:

        1. Starting from left of array and keep adding elements to a variable sum
        
        2. Add -1 for 0 and 1 for 1
 
        3. Now, everytime sum becomes zero, we know all the elements from begining of array have been neutralized , meaning we have got equal number of ones and zeroes, let this occurs at index i, so longestContArray = i+1 ('coz w're dealing with indices)
 
        4. But we are not done yet!, consider the case : [1,1,0,1,1]
 
            - In this case sum will never become zero,
            - but there exists a subarray of length 2, having equal 0 & 1
            - let's see the value of sum at index : 1 and 3
            - Ohh!! sum = 2 for both indices
            - what does this mean???
            - This means that if we get the same sum value for two indices i and j, then all the elements within the range [i,j) or (i,j] have been neutralized
            - What datastructure can remember the sum and index
            - Of course ! Map, so we use a map to store the sum and index values,
            - if sum == 0 then we have already solved the cases
            - but if sum!=0 and this sum doesn't already exist in the map, then store it with it's corresponding index
            - but if sum !=0 and sum already exists in the map then, dependig on whether i - m[sum] > LongestContArray, update LongestContArray
            - Note we need to store a unique sum value only once, after that whenever we encounter the same sum again our interval length is going to increase only and that is what we want
                    > ex- [1,0,1,0,1] we get sum = 1 three times
                    > we store sum = 1 for index = 0 only
                    > and never update it as we want longest length
 
 */

func findMaxLength(_ nums: [Int]) -> Int {
    
    var sum = 0
    
    // Key: sum of nums in range [0, index];
    // Value: index
    var sumsDict: [Int: Int] = [:]
    
    var maxLength = 0
    
    for i in 0..<nums.count {
        
        let num = nums[i]
        
        // Minus 1 for `0`
        // Plus 1 for `1`
        if num == 0 {
            sum -= 1
        } else if num == 1 {
            sum += 1
        } else {
            fatalError("Invalid number: \(num).")
        }
        
        // Equal number of 0s and 1s
        if sum == 0 {
            let length = i + 1
            maxLength = max(maxLength, length)
            
        // Unequal number of 0s and 1s
        } else {
            
            // Equal sum found (of range [0, index]). index < i.
            if let index = sumsDict[sum] {
                let length = i - index
                maxLength = max(maxLength, length)
                
            // Equal sum not found
            } else {
                sumsDict.updateValue(i, forKey: sum)
        
            }
        }
    }

    return maxLength
    
}

findMaxLength([0,1]) // 2
findMaxLength([0, 1, 0]) // 2
