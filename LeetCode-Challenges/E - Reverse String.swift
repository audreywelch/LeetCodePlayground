//
//  E - Reverse String.swift
//  
//
//  Created by Audrey Welch on 2/10/20.
//

import Foundation

/*
 
 Write a function that reverses a string. The input string is given as an array of characters - char[]
 
 Do not allocate extra space for another array, you must do this by modifying the input array in-place with 0(1) extra memory.
 
 You may assume all the characters consist of printable ascii characters
 
 Example #1
    > Input: ["h", "e", "l", "l", "o"]
    > Output: ["o", "l", "l", "e", "h"]
 
 Example #2:
    > Input: ["H","a","n","n","a","h"]
    > Output: ["h","a","n","n","a","H"]
 
 */

// OPTIMIZED SOLUTION

// Time Complexity: O(n) to swap N/2 elements
// Space Complexity: O(1)
func reverseWithPointers(_ s: inout [Character]) {
    
    // Create two pointers
    var left = 0
    var right = s.count - 1
    
    // While the left pointer is less than the right
    // AKA they haven't crossed
    while left < right {
        
        // Swap the left with the right
        (s[left], s[right]) = (s[right], s[left])
        
        // Move pointers
        left += 1
        right -= 1
    }
    
}

var CharacterInput1: [Character] = ["h", "e", "l", "l", "o"]
var CharacterInput2: [Character] = ["H", "a", "n", "n", "a" ,"h"]

reverseWithPointers(&CharacterInput1)
reverseWithPointers(&CharacterInput2)


// BRUTE FORCE SOLUTION
func reverseString(_ s: inout [String]) {
    
    var temp: String = ""
    
    // Loop through the array from 0 to the count - 1
    for i in 0..<s.count {
        
        // Set the variable at that index to a temp
        temp = s[i]
        
        // Remove the element at that index
        s.remove(at: i)
        
        // Insert at index 0
        s.insert(temp, at: 0)
        
    }
    
    print(s)
    
}

var input1 = ["h", "e", "l", "l", "o"]
var input2 = ["H", "a", "n", "n", "a" ,"h"]

reverseString(&input1)
reverseString(&input2)

func reverseCharacters(_ s: inout [Character]) {

    var temp: Character = "_"
    
    for i in 0..<s.count {
        temp = s[i]
        s.remove(at: i)
        s.insert(temp, at: 0)
    }
    
    print(s)
    
}

reverseCharacters(&CharacterInput1)
reverseCharacters(&CharacterInput2)
