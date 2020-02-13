//
//  E - Palindrome Checker.swift
//  
//
//  Created by Audrey Welch on 2/12/20.
//

import Foundation

/*
 
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
 
 Note: For the purpose of this problem, we define empty string as valid palindrome
 
 Example 1:
 > "A man, a plan, a canal: Panama"
 > true
 
 Example 2:
 > Input: "race a car"
 > false
 
 */

func isPalindrome(_ s: String) -> Bool {
    
    var result: Bool = false
    
    // Put the string into an array, separating by whitespace, and stripping punctuation
    var input = s
    let unsafeChars = CharacterSet.alphanumerics.inverted
    input = input.components(separatedBy: unsafeChars).joined(separator: "").lowercased()
    let inputArray = Array(input)
    
//    let string = s.lowercased().components(separatedBy: .punctuationCharacters).joined(separator: "").components(separatedBy: .symbols).joined(separator: "").components(separatedBy: .whitespacesAndNewlines).joined(separator: "").map { String($0) }
//    print(string)
    
    var count = inputArray.count
    
    // Return true if the array is empty or only has one character in it
    if inputArray.count == 0 || inputArray.count == 1 { return true }
    
    // Loop through the array up to half
    for i in 0..<inputArray.count / 2 {
        // If not equal, return result
        if inputArray[i] != inputArray[count - 1 - i] {
        //if inputArray[i] != comparisonArray[i] {
            result = false
            return result
        } else {
            // If equal, result = true
            result = true
        }
        
    }
        
    
    return result
}

isPalindrome("A man, a plan, a canal: Panama") // true
isPalindrome("race a car") // false
isPalindrome("") // true
isPalindrome(" ") // true
isPalindrome(".") // true
