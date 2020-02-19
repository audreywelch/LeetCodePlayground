//
//  M - Letter Combinations of a Phone Number.swift
//  
//
//  Created by Audrey Welch on 2/18/20.
//

import Foundation

/*
 
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations
 that the number could represent.
 
 A mapping of digits to letters (just like on the telephone buttons) is given below in the image.
 
 Note that 1 does not map to any letters
 
 1
 2: a, b, c
 3: d, e, f
 4: g, h, i
 5: j, k, l
 6: m, n, o
 7: p, q, r, s
 8: t, u, v
 9: w, x, y, z
 
 Example:
 > Input: "23"
 > Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 
 Note:
 Although the above answer is in lexicographical order, your answer could be in any order you want.
 
 */

func letterCombinations(_ digits: String) -> [String] {
    
    var result: [String] = []
    
    let digits: [Int] = digits.map { Int(String($0))! }
    
    let dictionary: [Int: [String]] = [2: ["a", "b", "c"], 3: ["d", "e", "f"], 4: ["g", "h", "i"],
                                       5: ["j", "k", "l"], 6: ["m", "n", "o"], 7: ["p", "q", "r", "s"],
                                       8: ["t", "u", "v"], 9: ["w", "x", "y", "z"]]
    
    /*
     
     Dictionary could hold each number and then an array of strings
     dict[2] = ["a", "b", "c"]
     
     If each number represents an array of letters
     For each letter in that array,
     loop through each letter in the next number's array
     and so on
     
     
     */
    
    // Loop through each number
    for digit in digits {
        
        // Unwrap to make sure the letter is in the dictionary
        guard let letters = dictionary[digit] else { continue }
        
        // Create an array to hold the new combinations
        var newCombinations: [String] = []
        
        // Loop through each letter inside the array associated with each number in dictionary
        for eachLetter in letters {
            
            // If the result combos is at zero, add each letter
            if result.count == 0 {
                newCombinations.append(String(eachLetter))
                
            // Otherwise
            } else {
                // For each letter already in the result, add to it the new letter
                // And then add that letter combo to the newCombinations array
                newCombinations += result.map { $0 + eachLetter }
            }
            
        }
        result = newCombinations
    }
    
    return result
}

print(letterCombinations("23")) // ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
