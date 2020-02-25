//
//  M - String to Integer.swift
//  
//
//  Created by Audrey Welch on 2/25/20.
//

import Foundation

/*
 
 Convert a string to an integer without making nay calls to standard conversion code.
 
 */

var sampleString = "1337"

func convert(string: String) -> Int? {
    
    var result: Int = 0
    
    // 1337 = 1000 + 300 + 30 + 7
    // 1337 = 1 * 10^3 + 3 * 10^2 + 3 * 10^1 + 7 * 10^0
    
    // Dictionary to connect characters with integer values
    let valueMap: [Character: Int] = ["1": 1,
                                      "2": 2,
                                      "3": 3,
                                      "4": 4,
                                      "5": 5,
                                      "6": 6,
                                      "7": 7,
                                      "8": 8,
                                      "9": 9]
    
    // Loop through each index and character in the string
    for (i, c) in string.enumerated() {
        
        // Exponent is the opposite of i, or as if the index started from the end
        let exponent = string.count - i - 1
        
        // Unwrap/check if the value is in the dictionary
        if let value = valueMap[c] {
            
            // result += (c * 10^exponent)
            let num = Decimal(value) * pow(10, exponent)
            result += NSDecimalNumber(decimal: num).intValue
            
        } else {
            // If there is a character in the string that is not in the dictionary, return nil
            return nil
        }
    }

    return result
}

convert(string: sampleString)
