//
//  M - Group Anagrams.swift
//  
//
//  Created by Audrey Welch on 4/6/20.
//

import Foundation

/*
 
 Given an array of strings, group anagrams together.
 
 EXAMPLE:
 Input
    > ["eat", "tea", "tan", "ate", "nat", "bat"]
 
 Output
    > [
        ["ate", "eat", "tea"],
        ["nat", "tan"],
        ["bat"]
      ]
 
 Note:
    > All inputs will be in lowercase
    > The order of your output does not matter
 
 */

// FIRST ATTEMPT DOESN'T ACCOUNT FOR EMPTY STRINGS
func groupAnagrams(_ strs: [String]) -> [[String]] {
    
//    if strs == [""] {
//        return [strs]
//    }
    
    var strs = strs
    
    var result: [[String]] = [[]]
    
    var anagramArray: [String] = []
    
    for i in 0..<strs.count {
        
        // Add the current word to an array
        anagramArray.append(strs[i])
        
        for anagram in (i + 1)..<strs.count {
            
            // If it is an anagram
            if isAnagram(string1: strs[i], string2: strs[anagram]) {
                
                // Append to the anagram array
                anagramArray.append(strs[anagram])
                
                // Remove anagram from strs
                //strs.remove(at: anagram)
                strs[anagram] = ""
            }
        }
        
        // Add the completed array to the result
        if !anagramArray.contains("") {
            result.append(anagramArray)
        }
        
        // Reset anagram array before continuing
        anagramArray = []
        
        // Remove i from array
        //strs.remove(at: i)
        strs[i] = ""
    }
    
    // First array is the empty placeholder array, so remove it
    result.remove(at: 0)
    
    return result
    
}

func isAnagram(string1: String, string2: String) -> Bool {
    
    if string1 == "" || string2 == "" { return false }
    
    if string1.count != string2.count { return false }
    
    let s1 = string1.map { (String($0)) }.sorted()
    let s2 = string2.map { (String($0)) }.sorted()
    
    if s1 == s2 {
        return true
    } else {
        return false
    }
    
}

print(groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
//[
//  ["ate", "eat", "tea"],
//  ["nat", "tan"],
//  ["bat"]
//]

print(groupAnagrams([""])) // [[""]]
print(groupAnagrams(["", ""])) // // [["", ""]]


// ACCEPTED SOLUTION
func groupAnagramsWithDict(_ strs: [String]) -> [[String]] {

    var dict: [String: [String]] = [:]
 
    // Loop through each item in the array
    for string in strs {
        
        let sortedString = String(string.sorted())
        
        // Check if there is a key in the dictionary that matches
        // If not, add it to the dictionary with just itself in the array
        if dict[sortedString] == nil {
            dict[sortedString] = [string]
            
        // If so, make this str one of the values
        } else {
            dict[sortedString]?.append(string)
        }
    }
 
    // Append key + values to new arrays and append to result
    return Array(dict.values)

}

print(groupAnagramsWithDict(["eat", "tea", "tan", "ate", "nat", "bat"]))
//[
//  ["ate", "eat", "tea"],
//  ["nat", "tan"],
//  ["bat"]
//]

print(groupAnagramsWithDict([""])) // [[""]]
print(groupAnagramsWithDict(["", ""])) // // [["", ""]]
