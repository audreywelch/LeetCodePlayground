//
//  M - Valid Parenthesis String.swift
//  
//
//  Created by Audrey Welch on 4/16/20.
//

import Foundation

/*
 
 Given a string containing only three types of characters: '(', ')', and '*', write a funciton to check whether this string is valid.
 
 We define the validity of a string by these rules:
 
    1. Any left parenthesis '(' must have a corresponding right parenthesis ')'
    2. Any right parenthesis ')' must have a corresponding left parenthesis '('
    3. Left parenthesis '(' must go before the corresponding right parenthesis ')'
    4. '*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string.
    5. An empty string is also valid
 
 Example 1:
    > Input: "()"
    > Output: True
 
 Example 2:
    > Input: "(*)"
    > Output: True
 
 Example 3:
    > Input: "(*))"
    > Output: True
 
 Example 4:
    > Input: "(((**)()(**)"
    > Open: 5
    > Closed: 3
    > *: 4
 
 ['(': 2, ')': 2, '*': 1]
 
 )())((*
 
 IDEA: // THIS DOESN'T WORK
 // While looping
 // Make a count of the parenthesis
 // If ) check to see if its opposite or a star is in the dictionary count (came before)
 // If so, remove itself and its opposite/star
 // If not, continue
 // If (, put in dictionary and continue
 // If *, continue
 
 // Return true if at the end the values for ( and ) are zero
 // Shouldn't matter how many stars there are
 
 IDEA:
 // Maybe this same concept should instead be applied with a stack
 // Then I'll be able to maintain order
 
 Note:
    > The string size will be in the range [1, 100]
 
 */

func checkValidString(_ s: String) -> Bool {
    
    var strings = s.map { String($0) }
    
    var stack: [String] = []
    
    for string in strings {
        
        // If it's an open or a star, add to the stack
        if string == "(" || string == "*" {
            stack.append(string)
            
        // If it's a closed
        } else if string == ")" {
            
            // Find index of the last appearance of the open in the stack
            if let match = stack.lastIndex(of: "(") {
                
                // Remove it
                stack.remove(at: match)
                
            // If there is no open, look for a star to act as an open
            } else if let match = stack.lastIndex(of: "*") {
                
                // Remove it
                stack.remove(at: match)
                
            // If there is neither an open that came before or a star,
            // it means we have a stray closed parenthesis, so return false
            } else {
                
                return false
            }
        }
    }
    
    // Now account for leftover opens and stars that could be matches
    // While there are still items in the stack to pop off
    while let last = stack.popLast() {
        
        // If it's an open, we know it's a stray
        if last == "(" {
            return false
        }
        
        // Otherwise, we popped off a star, so we need to remove its match
        // So remove the first occurrence of the open bracket
        if let match = stack.lastIndex(of: "(") {
            stack.remove(at: match)
        }
        
        // If it was just a star left, it doesn't matter
    }
    
    // If the stack is empty, return true
    return stack.isEmpty
    
}

checkValidString("()") // true
checkValidString("(*)") // true
checkValidString("(*))") // true
checkValidString("(*()") // true
checkValidString("(((**)()(**)") // true
checkValidString(")())((*") // false
