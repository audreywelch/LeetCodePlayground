//
//  E - Palindrome Number.swift
//  
//
//  Created by Audrey Welch on 2/5/20.
//

import Foundation

"""

> Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.

> Example 1:
> Input: 121
> Output: true

> Example 2:
> Input: -121
> Output: false
> Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.

"""

// FIRST PASS SOLUTION

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        var result: Bool = true
        
        let xString = String(x)
        let xArray = xString.map { String($0) }
        //var xArray = xString.compactMap{ $0.wholeNumberValue }
        
        var reversedArray: [String] = []
        
        // Create an array that is the reverse of our starting array of ints
        for eachCharacter in xArray {
            reversedArray.insert(eachCharacter, at: 0)
        }
        
        print(reversedArray)
        
        // For each index in the arrays...
        for eachIndex in 0..<xArray.count/2 {
            
            // If the numbers don't match, return false and don't continue
            if xArray[eachIndex] != reversedArray[eachIndex] {
                result = false
                return result
            }
            
        }
        
        return result
    }
}

var solution = Solution()
var solution2 = Solution()

solution.isPalindrome(121)
solution2.isPalindrome(-121)

// ONLY SLIGHTLY FASTER - both are O(n)

func isStringPalindrome(_ x: Int) -> Bool {
    
    if x >= 0 && x < 10 {
        return true
    }
    
    let string = "\(x)"
    var startIndex = string.startIndex
    var endIndex = string.endIndex
    
    // Returns the index immediately before
    endIndex = string.index(before: endIndex)
    
    while startIndex < endIndex {
        if string[startIndex] != string[endIndex] {
            return false
        }
        startIndex = string.index(after: startIndex)
        endIndex = string.index(before: endIndex)
    }
    return true
    
}


"""

PALINDROME PERMUTATION

Hannah - every letter has an even number of occurrences
Racecar - OR middle letter can have one number of occurrences

Pass in a word, is that word a permutation of a palindrome.

Ideas:

Dictionary - O(n)
> Keep track of the number of occurrences this way
"h": 2
"a": 2
etc.

Set
> We don't need to keep track of every single letter
> So walk through the string. Every time we see a letter, add it to the set. If we see that letter again, remove it from the set.
> At the end, check the count of our set - if we have less than or equal to one, we know it's a palindrome, so return true.

"""

func isPalindromePermutation(word: String) -> Bool {
    
    let lowercasedWord = word.lowercased()
    
    var oddCharacters: Set<Character> = []
    
    for eachCharacter in lowercasedWord {
        if oddCharacters.contains(eachCharacter) {
            oddCharacters.remove(eachCharacter)
        } else {
            oddCharacters.insert(eachCharacter)
        }
    }
    
    print("\(word): ")
    return oddCharacters.count <= 1
}

print("\(isPalindromePermutation(word: "Hannah"))")
print("\(isPalindromePermutation(word: "nhnaah"))")


"""

Just normal palindrome for strings

"""

func isPalindrome(word: String) -> Bool {
    
    let arrayOfWord = word.lowercased().map { String($0) }
    
    for i in 0 ..< arrayOfWord.count/2 {
        if arrayOfWord[i] != arrayOfWord[arrayOfWord.count - 1 - i] {
            return false
        }
    }
    
    return true
    
}

isPalindrome(word: "hannah")
isPalindrome(word: "Hannah")
isPalindrome(word: "racecar")
isPalindrome(word: "audrey")
