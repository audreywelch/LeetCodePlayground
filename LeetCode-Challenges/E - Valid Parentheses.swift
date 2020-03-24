//
//  E - Valid Parentheses.swift
//  
//
//  Created by Audrey Welch on 3/23/20.
//

import Foundation

/*
 
 Given a string containing just the characters '(', ')', '{', '}', '[', ']',
 determine if the input string is valid.
 
 An input string is valid if:
    1. Open brackets must be closed by the same type of brackets.
    2. Open brackets must be closed in the correct order.
 
 Note that an empty string is also considered valid.
 
 Example 1:
    Input: "()"
    Output: true
 
 Example 2:
    Input: "()[]{}"
    Output: true
 
 Example 3:
    Input: "(]"
    Output: false
 
 Example 4:
    Input: "([)]"
    Output: false
 
 Example 5:
    Input: "{[]}"
    Output: true
 
 
 
 */


func isValid(_ s: String) -> Bool {
    
    // If an open bracket is followed by a closed bracket of a different type,
    // Return false
    
    // Look for pairs and remove them
    
    var charArray = [Character]()
    
    for ch in s {
        
        // ( { [
        if ch == "(" || ch == "{" || ch == "[" {
            charArray.insert(ch, at: 0)
            
        } else {
            if charArray.isEmpty {
                return false
            }
            
            if ch == ")" && charArray.first != "(" || ch == "}" && charArray.first != "{" || ch == "]" && charArray.first != "[" {
                return false
            }
            
            charArray.removeFirst()
        }
    }
    
    return charArray.isEmpty
    
}

var testCase1 = "[{()()[()]}]" // true

isValid(testCase1)

func isValid2(_ s: String) -> Bool {
    
    // Create a stack
    var stack = [Character]()
    
    // Dictionary that holds what the closing bracket pair should be
    var closingPairs: [Character: Character] = ["{": "}", "[": "]", "(": ")"]
    
    // Create a set of opening brackets of each type
    let openBrackets = Set<Character>(closingPairs.keys)
    
    // Loop through the entered string
    for char in s {
        
        // If it's an open bracket, append it to the stack
        if openBrackets.contains(char) {
            stack.append(char)
            
        // If it's a closing bracket
        } else {
            
            // Grab the last opening bracket
            guard let last = stack.popLast() else {
                return false
            }
            
            // If it's closing bracket is not equal to the character, return false
            if closingPairs[last] != char {
                return false
            }
        }
    }
    
    // If the stack is empty, everything had a match
    return stack.isEmpty
}

isValid2(testCase1)
