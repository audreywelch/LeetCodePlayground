//
//  Facebook Discover Production Engineering II.swift
//  
//
//  Created by Audrey Welch on 4/18/20.
//

import Foundation

/*
 
 Instagram stickers cost a dollar each from the company store. I have an idea. I want to buy stickers, cut them up, and use the letters to make other words/phrases. An Instagram sticker contains only the word ‘instagram’, in all lower-case letters.

 Written a function that, given a string consisting of a word or words made up of letters from the word ‘instagram’, outputs an integer with the number of stickers I will need to buy.

 Some examples:
 ‘artisan martians’ needs 2 stickers
 ‘taming giant gnats’ needs 3 stickers
 ‘tiara’ only needs 1 sticker

 You can assume the input you are passed is valid, that is, does not conta
 
 */

// I N S T A G R A M
// i: 1
// n: 1
// s: 1
// t: 1
// a: 2
// g: 1
// r: 1
// m: 1

// Unless the max number is A
// If max number is A, divide that number in half
// Is it still the max number?
// If so, that's the amount of stickers needed
// If not, find the max number

func stickersFor(phrase: String) -> Int {
    
    var result: Int = 0
    
    var phraseDict: [String: Double] = [:]
    
    // Put into an array & strip whitespace from phrase
    var phrase = phrase.map { String($0).trimmingCharacters(in: .whitespaces).lowercased() }
    
    // Loop through the phrase array to create a dictionary
    // Put all letters into a dictionary with the [letter: count]
    for letter in phrase {
        
        // Check if letter is already in the dictionary - if so, add to the county
        if let count = phraseDict[letter] {
            phraseDict[letter] = count + 1
        } else {
            // If not in the dictionary, add it
            phraseDict[letter] = 1
        }
    }
    
    // Divide # of A's in half to account for having 2 A's available per sticker
    if let numberOfA = phraseDict["a"] {
        
        phraseDict["a"] = numberOfA.rounded(.up) / 2
    }
    
    // Letter with max number as value in key:value pair is the amount of stickers we need
    guard let maximumValue = phraseDict.values.max() else { return 0 }
    
    result = Int(maximumValue)

    return result
    
}

stickersFor(phrase: "artisan martians") // 2
stickersFor(phrase: "taming giant gnats") // 3
stickersFor(phrase: "tiara") // 1
stickersFor(phrase: "aaaatt") // Equal occurrences // 2
stickersFor(phrase: "TiAra") // Check capitals // 1
