//
//  E - Valid Anagram.swift
//  
//
//  Created by Audrey Welch on 2/14/20.
//

import Foundation

/*
 
 Given two strings S and T, write a function to determine if T is an anagram of S.
 
 Example 1:
 > S = "anagram", T = "nagaram"
 > true
 
 Example 2:
 > S = "rat", T = "car"
 > False
 
 Note:
 You may assume the string contains only lowercase alphabets
 
 */

// time: O(n)
// space: O(1) - stays constant because the dictionary will stay the same size no matter how big n is (it will never grow above the 26 letters in the alphabet)
func isAnagram(_ s: String, _ t: String) -> Bool {
    
    var result: Bool = true
    
    /*
     
     PLAN
     
     Questions:
     > Is an anagram the same number of letters/are repeats okay?
     > "all original letters exactly once"
     
     Convert s and t to arrays
     
     // Check that the length of the arrays are the same size
     // If not, return false
     
     Loop through s to form a dictionary that holds each letter and the number of times it occurs in the array
     
     Create two dictionaries - one for each letter
     
     loop through one of the words using indices
     compare dictionaries
     if they are identical, it is a valid anagram
     they will both hold whatever letter is at [i]
     and the value will be the same number
     if !dict1[array[i]] == dict2[array[i]] {
        return false }
        ^ // this actually didn't work b/c count could be the same
        ^ need to also check that the key + the count is the same
     
     First thought on time and space complexity = not great.
     Not only am I making 2 dictionaries (space), I am looping through the arrays 3 times
     So the time complexity is O(n)
     [ was able to combine 2 of the loops, but doesn't make an impact on the time complexity ]
     
     BETTER WAY TO GO ABOUT THE HASH TABLE SOLUTION:
     > Make only one dictionary. Increase the counts for array s
     > Decrease the counts for array t
     > If at any point the count falls below zero, we know that t contains an extra letter not in s,
        and returns false immediately
     
     */
    
    // Convert input strings to arrays
    let s = s.map { String($0) }
    let t = t.map { String($0) }
    
    // Return false if the arrays do not have an equal count
    if s.count != t.count { return false }
    
    var dictS: [String: Int] = [:]
    var dictT: [String: Int] = [:]
    
    // Loop through the count of the arrays (same count, doesn't matter which array to use)
    // Create dictionaries accordingly
    for i in 0..<s.count {
        
        // Create s dictionary
        
        // If already in the dictionary
        if let count = dictS[s[i]] {
            // Add to the count
            dictS[s[i]] = count + 1
        // If it was not in the dictionary, put it there and give it a count of 1
        } else {
            dictS[s[i]] = 1
        }
        
        // Create t dictionary
        
        // If already in the dictionary
        if let count = dictT[t[i]] {
            // Add to the count
            dictT[t[i]] = count + 1
            
        // If it was not in dict, put it in and give a count of 1
        } else {
            dictT[t[i]] = 1
        }
    }
    
    // If the keys don't match, return false
    if dictS.keys != dictT.keys {
        return false
    }
    
    for i in 0..<s.count {
        
        // If the S dictionary holds the key
        // AND if the count is the same
        if dictS.keys.contains(t[i]) && dictS[t[i]] == dictT[t[i]] {
            continue
        } else {
            return false
        }

    }
    
    return result
    
}

isAnagram("anagram", "nagaram") // true
isAnagram("rat", "ram") // false

// O(n log n)
// Solution
func isAnagramSolution(_ s: String, _ t: String) -> Bool {

    if s.count != t.count { return false }
    
    // Convert input strings to arrays AND sort
    // Sorting costs O(n log n)
    let s = s.map { String($0) }.sorted()
    let t = t.map { String($0) }.sorted()

    // Comparing two strings costs O(n)
    return s == t

}

isAnagramSolution("anagram", "nagaram") // true
isAnagramSolution("rat", "ram") // false
