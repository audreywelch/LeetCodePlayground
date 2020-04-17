//
//  Facebook Discover Production Engineering I.swift
//  
//
//  Created by Audrey Welch on 4/17/20.
//

import Foundation

/*
 
 Two strings are anagrams if they are permutations of each other. In other words, both strings have the same size and the same characters. For example, “aaagmnrs” is an anagram of “anagrams”. Given an array of strings, remove each string that is an anagram of an earlier string, then return the remaining array in sorted order.

 Example
 Str = [‘code’, ‘doce’, ‘ecos’, ‘framer’, ‘frame’]

     •    “code” and “doce” are anagrams. Remove “doce” from the array and keep the first occurrence “code” in the array.
     •    “code” and “ecod” are anagrams. Remove “ecod” from the array and keep the first occurrence “code” in the array.
     •    “code” and “framer” are not anagrams. Keep both strings in the array.
     •    “framer” and “frame” are not anagrams due to the extra ‘r’ in “framer”. Keep both strings in the array.
     •    Order the remaining strings in ascending order: [“code”, “frame”, “framer”]
 
 */

// O(n log n)
func isAnagram(_ a: [String], _ b: [String]) -> Bool {

    if a.count != b.count { return false }
    
    // Convert input strings to arrays AND sort
    // Sorting costs O(n log n)
    let a = a.map { String($0) }.sorted()
    let b = b.map { String($0) }.sorted()

    // Comparing two strings costs O(n)
    return a == b

}

func funWithAnagrams(text: [String]) -> [String] {
    
    var stack: [String] = text
    
    // Keep a dictionary of each anagram so far
    // Key: index
    // Value: Array of each string used per word, sorted
    var anagrams: [[String]: Bool] = [:]
    
    // Loop through the array to create the dictionary
    for i in 0..<text.count {
        
        // Turn each word in the array into an array of sorted strings
        var a = text[i].map { String($0) }.sorted()
        
        // If the word isn't in the dictionary yet, put it in there
        if anagrams[a] == nil {
            anagrams[a] = true
        }
    }
    
    print(anagrams)
    
//    var keys = anagrams.keys
//    print(keys)

    
    for i in 0..<text.count {
        
        stack.append(text[i])
        
        // if text[i].sorted is in the anagrams dictionary, then remove it from the array
        var a = text[i].map { String($0) }.sorted()
        
        if let newAnagram = anagrams[a] {
            
            // If the array of letters are equal, remove from the stack
            if isAnagram(newAnagram, a) {
                stack.removeLast()
            }
        }

//
//        if keys.contains(a) {
//            print("a is in the list of keys: \(a)")
//            print("STACK: \(stack)")
//            stack.removeLast()
//        }
        
//        if let newAnagram = anagrams[a] {
//            print("anagrams[a]: \(anagrams[a]) is in the dictionary")
//            //stack.removeLast()
//            //text.remove(at: i)
//            indicesToRemove.append(i)
//        } else {
//            stack.append(text[i])
//        }
        
        
//        if anagrams[text[i].sorted()] == true {
//
//        }
    }
    
    // [["c", "d", "e", "o"]: true]
    // Then run isAnagram function checking if dict[a] == text[i]
    
    return stack.sorted()
}



funWithAnagrams(text: ["code", "doce", "ecod", "framer", "frame"]) // ["code", "frame", "framer"]
funWithAnagrams(text: ["code", "framer", "frame", "doce", "ecode"])
funWithAnagrams(text: ["code", "aaagmnrs", "anagrams", "doce"]) // ["aaagmnrs", "code"]
funWithAnagrams(text: ["poke", "pkoe", "okpe", "ekop"]) // ["poke"]



//func funWithAnagrams2(text: [String]) -> [String] {
//
//    var result: [String] = []
//
//    for i in 0..<text.count {
//        for j in i+1..<text.count {
//
//            if isAnagram(text[i], text[j]) == true {
//                result.append(text[j])
//            }
//        }
//    }
//
//    return result
//
//}



//funWithAnagrams2(text: ["code", "doce", "ecod", "framer", "frame"]) // ["code", "frame", "framer"]
//funWithAnagrams2(text: ["code", "framer", "frame", "doce", "ecode"])
//funWithAnagrams2(text: ["code", "aaagmnrs", "anagrams", "doce"]) // ["aaagmnrs", "code"]
//funWithAnagrams2(text: ["poke", "pkoe", "okpe", "ekop"]) // ["poke"]
