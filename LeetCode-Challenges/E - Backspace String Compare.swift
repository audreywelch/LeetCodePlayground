//
//  E - Backspace String Compare.swift
//  
//
//  Created by Audrey Welch on 4/9/20.
//

import Foundation

/*
 
 Given two strings S and T, return if they are equal when both are typed into empty text editors.
 # means a backspace character
 
 EXAMPLE 1
    > Input: S = "ab#c", T = "ad#c"
    > Output: true
    > Explanation: Both S and T become "ac".
 
 EXAMPLE 2
    > Input: S = "ab##", T = "c#d#"
    > Output: true
    > Explanation: Both S and T become "".
 
 EXAMPLE 3
    > Input: S = "a##c", T = "#a#c"
    > Output: true
    > Explanation: Both S and T become "c".
 
 EXAMPLE 4:
    > Input: S = "a#c", T = "b"
    > Output: false
    > Explanation: S becomes "c" while T becomes "b"
 
 NOTE:
    1. 1 <= S.length <= 200
    2. 1 <= T.length <= 200
    3. S and T only contain lowercase letters and '#' characters.
 
 FOLLOW UP:
    > Can you solve it in O(n) time and O(1) space?
 
 
 // Loop through
 // When string[i] == "#", remove both string[i] and string[i-1]
 
 //    for i in 1..<T.count {
 //
 //        if tArr[i] == "#" {
 //            tArr.remove(at: i)
 //            tArr.remove(at: i - 1)
 //        }
 //    }
 
 */

func backspaceCompare(_ S: String, _ T: String) -> Bool {
    
    func backspaceExecution(_ string: String) -> String {
        
        var result: String = ""
        
        // Turn string into array to access indices
        let arr = string.map { String($0) }
        
        // Loop through characters in the string
        for i in 0..<string.count {
            
            // If no backspace, append to result string
            if arr[i] != "#" {
                result.append(arr[i])
                
            // If backspace, remove the last item from the string
            } else {
                if !result.isEmpty {
                    result.removeLast()
                }
            }
        }
        
        return result
    }
    
    // Then compare
    if backspaceExecution(S) == backspaceExecution(T) {
        return true
    } else {
        return false
    }
}

backspaceCompare("ab#c", "ad#c") // true
backspaceCompare("ab##", "c#d#") // true
backspaceCompare("a##c", "#a#c") // true
backspaceCompare("a#c", "b") // false
backspaceCompare("bxj##tw", "bxj###tw") // false


// O(1) Space Complexity
func backspaceCompare2(_ S: String, _ T: String) -> Bool {
    
    func backspaceExecution(_ string: String) -> [Character] {
        
        var stack: [Character] = []
        
        // Loop through characters in the string
        for char in string {
            
            // If no backspace, append to result string
            if char != "#" {
                stack.append(char)
                
            // If backspace, remove the last item from the string
            } else {
                if !stack.isEmpty {
                    stack.removeLast()
                }
            }
        }
        
        return stack
    }
    
    // Then compare
    return backspaceExecution(S) == backspaceExecution(T) ? true : false
}

backspaceCompare2("ab#c", "ad#c") // true
backspaceCompare2("ab##", "c#d#") // true
backspaceCompare2("a##c", "#a#c") // true
backspaceCompare2("a#c", "b") // false
backspaceCompare2("bxj##tw", "bxj###tw") // false
