//
//  E - Longest Common Prefix.swift
//  
//
//  Created by Audrey Welch on 2/5/20.
//

import Foundation

"""
Write a function to find the longest common prefix string amongst an array of strings. If there is no common prefix, return an empty string "".

Examples:
> ["flower", "flow", "flight"]
> "fl"

> ["dog", "racecar", "car"]
> ""

"""


func longestCommonPrefix(_ strs: [String]) -> String {

    var matchingPrefix = [Character]()
    
    // Create an array of individual arrays per word, split into characters
    let strs = strs.map { Array($0) }
    
    if strs.count > 0 {
        var firstWord = strs[0]
        
        // Loop through the characters in the first word
        for i in 0..<firstWord.count {
            
            // Store whether or not there is a matching prefix
            var prefix: Bool = true
            
            // Loop through each array
            for eachStringArray in strs {
                
                // If the length of the array is less than or equal to ...
                if eachStringArray.count <= i {
                    print("eachStringArray.count: \(eachStringArray.count) is less than or equal to i: \(i). Setting prefix to false")
                    prefix = false
                    break
                }
                
                // If the character in the string array is not equal to the same character in the first word, then set prefix to false and break
                if eachStringArray[i] != firstWord[i] {
                    
                    print("eachStringArray[i]: \(eachStringArray[i]) is not equal to firstWord[i]: \(firstWord[i]). Setting prefix to false.")
                    prefix = false
                    break
                }
            }
            
            // If the prefix has not been set to false, it means the letters are matching
            if prefix == true {
                matchingPrefix.append(firstWord[i])
                
                print("Matching letters. Append firstWord[i]: \(firstWord[i]) to matchingPrefix, so now it is: \(matchingPrefix)")
            } else {
                break
            }
        }
    }
    
    return String(matchingPrefix)

}

longestCommonPrefix(["flower", "flow", "flight", "flow"])
