//
//  M - Integer to Roman.swift
//  
//
//  Created by Audrey Welch on 2/15/20.
//

import Foundation

/*
 
 Roman numerals are represented by seven different symbols:
 
 Symbol       Value
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 
 For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.
 
 Roman numerals are usually written largest to smallest from left to right.
 However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five, we subtract it making four.
 The same principle applies to the number nine, which is written as IX.
 There are six instances where subtraction is used:
 
    > I can be placed before V (5) and X (10) to make 4 and 9
    > X can be placed before L (50) and C (100) to make 40 and 90
    > C can be placed before D (500) and M (1000) to maek 400 and 900
 
 Given an integer, convert it to a roman numeral. Input is guaranteed to be within the range from 1 to 3999.
 
 Example 1:
 > Input: 3
 > Output: "III"
 
 Example 2:
 > Input: 4
 > Output: "IV"
 
 Example 3:
 > Input: 9
 > Output: "IX"
 
 Example 4:
 > Input: 58
 > Output: "LVIII"
 > Explanation: L = 50, V = 5, III = 3.
 
 Example 5:
 > Input: 1994
 > Output: "MCMXCIV"
 > Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
 
 */

// BRUTE FORCE SOLUTION
func intToRoman(_ num: Int) -> String {
    
    // Create a result variable that will hold the string of symbols
    var result: String = ""
    
    /*
     
     PLAN
     
     // Check if the input num is > the set values and < the next set value
     // Subtract the next lowest value from the input num
     // And add the symbol associated to the result String
     
     // This does not accommodate for the 6 instances of subtraction
     
     // If the number is between 500 and 1000
     // and then if the number is between 900 and 999
        // we know it needs a special character
        // subtract 900
        // add CM to the string
     
     // Do this check for each level
     
     Make a dictionary that holds the value: symbol

     */
    
    // Create a dictionary to hold roman numeral symbols
    var dict: [Int: String] = [1: "I", 5: "V", 10: "X", 50: "L", 100: "C", 500: "D", 1000: "M"]
    
    // Assign num to its own variable so that it is mutable
    var num = num
    
    while num > 0 {
        
        switch num {
        case 0..<5:
            // Check if it is a special character
            if num == 4 {
                num -= 4
                result += "IV"
            } else {
                num -= 1
                result += dict[1]!
            }
        case 5..<10:
            // Check if it is a special character
            if num == 9 {
                num -= 9
                result += "IX"
            } else {
                num -= 5
                result += dict[5]!
            }
        case 10..<50:
            // Check if it is a special character
            if num >= 40 && num <= 49 {
                num -= 40
                result += "XL"
            } else {
                num -= 10
                result += dict[10]!
            }
        case 50..<100:
            // Check if it is a special character
            if num >= 90 && num <= 99 {
                num -= 90
                result += "XC"
            } else {
                num -= 50
                result += dict[50]!
            }
        case 100..<500:
            // Check if it is a special character
            if num >= 400 && num <= 499 {
                num -= 400
                result += "CD"
            } else {
                num -= 100
                result += dict[100]!
            }
        case 500..<1000:
            if num >= 900 && num <= 999 {
                num -= 900
                result += "CM"
            } else {
                num -= 500
                result += dict[500]!
            }
        case 1000..<4000:
            num -= 1000
            result += dict[1000]!
        default:
            result = "Number \(num) invalid. Please input a number within the range of 1 to 3999."
            return result
        }
    }
    
    return result
}

intToRoman(3) // "III"
intToRoman(4) // "IV"
intToRoman(9) // "IX"
intToRoman(58) // "LVIII"
intToRoman(1994) // "MCMXCIV"

/*
 
 Other ideas:
 
    1. Recursion
        func intToRoman(_ num: Int) -> String {
            if num == 0 {
                return ""
            } else if num >= 1000 {
                return "M" + intToRoman(num - 1000)
            } else if num >= 900 {
                return "CM" + intToRoman(num - 900)
            } else if num >= 500 {
                return "D" + intToRoman(num - 500)
            } else if num >= 400 {
                return "CD" + intToRoman(num - 400)
            } ETC.
 
 
 */

// USING TWO ARRAYS
func intToRomanWithTwoArrays(_ num: Int) -> String {
    
    var result = ""
    var num = num
    
    let values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    let roman = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]
    
    var currentIndex = 0
    
    while num > 0 {
        // While the number is greater than the current value being considered
        while num/values[currentIndex] > 0 {
            // Add the corresponding roman numeral to the result
            result.append(roman[currentIndex])
            // Subtract that value from num
            num -= values[currentIndex]
        }
        // Move down to the next value in the array
        currentIndex += 1
    }
    return result
}


// TUPLE SOLUTION
func intToRomanWithTuples(_ num: Int) -> String {
    
    let map = [
        (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"),
        (100, "C"),  (90, "XC"),  (50, "L"),  (40, "XL"),
        (10, "X"),   (9, "IX"),   (5, "V"),   (4, "IV"),
        (1, "I")
    ]
    
    var result = "", num = num
    for (base, str) in map {
        result += Array(repeating: str, count: num / base).joined()
        num = num % base
    }
    return result
}

intToRomanWithTuples(3) // "III"
intToRomanWithTuples(4) // "IV"
intToRomanWithTuples(9) // "IX"
intToRomanWithTuples(58) // "LVIII"
intToRomanWithTuples(1994) // "MCMXCIV"
