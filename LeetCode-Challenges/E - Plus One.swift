//
//  E - Plus One.swift
//  
//
//  Created by Audrey Welch on 2/5/20.
//

import Foundation

/*
 
 Given a non-empty array of digits representing a non-negative integer, plus one to the integer.

 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.

 You may assume the integer does not contain any leading zero, except the number 0 itself.

 Example 1:

 Input: [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 Example 2:

 Input: [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 
 */

func plusOne(_ digits: [Int]) -> [Int] {
    
    var result: [Int] = []
    var finalDigit: Int = 0
    
    // If the last element in the array is not equal to 9
    if digits.last != 9 {
        
        // Unwrap the optional last digit
        if let last = digits.last {
            
            // Assign it to finalDigit and add one
            finalDigit = last + 1
            
            // result = digits
            result = digits
            
            // Remove the last element
            result.removeLast()
            
            // final element in the array changes to finalDigit
            result.append(finalDigit)
        }
        
    // Else if the last element IS equal to 9
    } else if digits.last == 9 {
        
        // Convert the array to a string, and then the string to an integer
        var digitsString = digits.map(String.init).joined()
        
        guard var digitsInt = Int(digitsString) else { return [0] }
        // var digitsInt = UInt64(digitsString)!
        
        // Add one to the integer
        digitsInt += 1
        
        digitsString = String(digitsInt)
        
        // Map the integer to put it back into an array
        result = digitsString.compactMap{ $0.wholeNumberValue }

    }
    
    return result
    
}

plusOne([1,2,3]) // [1, 2, 4]
plusOne([4,3,2,1]) // [4, 3, 2, 2]
plusOne([1,2,9]) // [1, 3, 0]
//plusOne([5,2,2,6,5,7,1,9,0,3,8,6,8,6,5,2,1,8,7,9,8,3,8,4,7,2,5,8,9])

// The above solution does not work for massively long numbers
// so I should instead have a solution that changes each number rather than converts
// the whole number to an integer

func plusOne2(_ digits: [Int]) -> [Int] {
    
    var result = digits
    
    // Set the index to be the index of the last number in the array
    var index = result.count - 1
    
    // Start from the back of the array - (count - 1)
    while index >= 0 {
        
        // Keep looping backwards, if it's not a 9, just add one and stop
        if result[index] != 9 {
            
            result[index] += 1
            
            break
            
        // If it's a 9, change it to a zero
        } else if result[index] == 9 {
            
            // But if it is a 9, change it to a zero and keep looping backwards
            result[index] = 0

        }

        // decrease the index
        index -= 1
    }
    
    // Check if there is a 0 at beginning of array
    // If there is, it means it's in the form of 999, so insert a 1
    // This is only needed for the LeetCode solution
    if result.first == 0 {
        result.insert(1, at: 0)
    }
    
    return result
    
}

// Start from the back of the array - (count - 1)
// If it's a 9, change it to a zero
// Keep looping backwards, if it's not a 9, just add one and stop
// But if it is a 9, change it to a zero and keep looping backwards


plusOne2([1,2,3]) // [1, 2, 4]
plusOne2([4,3,2,1]) // [4, 3, 2, 2]
plusOne2([1,2,9]) // [1, 3, 0]
plusOne([9,9,9,9]) // [1, 0, 0, 0]
plusOne([9])
plusOne2([5,2,2,6,5,7,1,9,0,3,8,6,8,6,5,2,1,8,7,9,8,3,8,4,7,2,5,8,9])


// Random person answer
func plusOne3(_ digits: [Int]) -> [Int] {
    var output = digits
    var i = output.count - 1
    
    // get all 9s replaced by 0 when you add 1. [7,9,9] -> [7,0,0]. [9,9,9] -> [0,0,0]
    while i >= 0 && output[i] == 9 {
        output[i] = 0
        i -= 1
    }

    // [7,0,0] -> [8,0,0]
    if i >= 0{
        output[i] += 1
    }

    // in case of array with all 9s [9,9,9], value of i will be -1 after
    // while loop. In that case answer is 1000. So, make an array with four 0s
    // and then first digit will be 1.
    else{
        output = Array(repeating: 0, count: output.count + 1) // [0,0,0,0] for [9,9,9] input
        output[0] = 1 // [1,0,0,0]
    }

    return output
}
