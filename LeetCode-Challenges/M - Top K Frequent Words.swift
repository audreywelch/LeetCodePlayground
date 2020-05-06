//
//  M - Top K Frequent Words.swift
//  
//
//  Created by Audrey Welch on 5/6/20.
//

import Foundation

/*
 
 Given a non-empty list of words, return the k most frequent elements
 
 Your answer should be sorted by frequency from highest to lowest. If two words have the same frequency, then the word with the lower alphabetical order comes first.
 
 Example 1:
    > Input: ["i", "love", "leetcode", "i", "love", "coding"], k = 2
    > Output: ["i", "love"]
    > Explanation: "i" and "love" are the two most frequent words. Note that "i" comes before "love" due to a lower alphabetical order.
 
 Example 2:
    > Input: ["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"], k = 4
    > Output: ["the", "is", "sunny", "day"]
    > Explanation: "the", "is", "sunny", and "day" are the four most frequent words, with the number of occurrence being 4, 3, 2, and 1 respectively.
 
 Note:
 1. You may assume k is always valid, 1 <= k <= number of unique elements.
 2. Input words only contain lowercase letters.
 
 Follow Up:
    > Try to solve it in O(n log k) time and O(n) extra space.
 
 */

func topKFrequent(_ words: [String], _ k: Int) -> [String] {
    
    var result: [String] = []
    
    var k = k
    
    /*
     
     INITIAL THOUGHTS:
     
     Loop through the array to create a dictionary storing words with their counts
     
     Loop through 0..<k times
     Find the max of the values
     Loop through the dictionary to find the key that has the value matching the max
     (this is not time efficient)
     
     // Account for alphabetical ordering of duplicates
     // invert dictionary and merge duplicates
     instead of putting into result array right away
     loop through the dictionary
     // create a new dictionary that holds the count: ["if", "is"] and the words that have that count
     
     
     At the end of the loop
     loop again?
     this time through the of tuples
     
     Append the matching key to the result array
     
     Remove the key:value pair from the dictionary
     
     Sort the
     
     */
    
    var freqDict: [String: Int] = [:]
    
    for word in words {
        
        if let count = freqDict[word] {
            freqDict[word] = count + 1
        } else {
            freqDict[word] = 1
        }
    }
    
    var totalCounts = [Int: [String]]()
    
    // Invert the dictionary and merge the words with shared counts
    for (key, value) in freqDict {
        // If there are already words with that count
        if var wordList = totalCounts[value] {
            // Add them to the list
            wordList.append(key)
            
            // Re-set the list as the value
            totalCounts[value] = wordList
            
        // If there isn't a count at that number in the dictionary yet, add it
        } else {
            var list = [String]()
            list.append(key)
            totalCounts[value] = list
        }
    }
    
    var tempArray: [String] = []
    
    //while k > 0 {
    for _ in 0..<k {
        
        guard let maximum = totalCounts.keys.max() else { break }
        
        // Array holds the list of words at that count
        if var arr = totalCounts[maximum] {
            
            // Sort the array so that words with the same count will appear alphabetically
            arr.sort(by: { $0 < $1 })
            
            print("sorted array: \(arr)")
            
            // Add the array to the temp array
            tempArray += arr
            print("temp array: \(tempArray)")
            
            // Remove key:value from dictionary so it doesn't appear again
            totalCounts.removeValue(forKey: maximum)
            
            // Lower the count by the amount of words we added to the result array
            //k = k - arr.count
        }
  
    }
    
    // This extra step is to account for more results with the same count than k
    for j in 0..<k {
        result.append(tempArray[j])
    }

    return result
}

topKFrequent(["i", "love", "leetcode", "i", "love", "coding"], 2) // ["i", "love"]
topKFrequent(["the", "day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"], 4) // ["the", "is", "sunny", "day"]
topKFrequent(["i", "love", "leetcode", "i", "love", "coding"], 1) // ["i"]
topKFrequent(["i", "love", "leetcode", "i", "love", "coding"], 3) // ["i", "love", "coding]
