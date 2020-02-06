//
//  E - Roman to Integer.swift
//  
//
//  Created by Audrey Welch on 2/5/20.
//

import Foundation

"""

Roman numerals are represented by seven different symbols:

Symbol      Value
I           1
V           5
X           10
L           50
C           100
D           500
M           1000

For example, two is written as II. Just two one's added together
Twelve is written as XII, which is simply X + II.
Twenty-seven is written as XXVII, which is XX + V + II

Roman numerals are usually written largest to smallest from left to right. However, the numberal for four is not IIII. Instead, the number four is written as IV.

Because the one is before the five, we subtract, making it four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

    > I can be placed before V (5) and X (10) to make 4 and 9.
    > X can be placed before L (50 and C (100) to make 40 and 90.
    > C can be placed before D (500) and M (1000) to make 400 and 900.

Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.

Examples:

"III" > 3

"IV" > 4

"IX" > 9

"LVIII" > 58
Explanation: L = 50, V = 5, III = 3

"MCMXCIV"
1994
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4


"""


func romanToInt(_ s: String) -> Int {
    
    var total: Int = 0
    
    // Convert String to array of roman numerals
    var array = s.map { String($0) }
    print(array)
    
    // Make index pointer in the array that starts at 0
    var pointer = 0
    
    if array[pointer] == "I" && array[pointer + 1] == "V" {
        
        // Add 4 to the total
        total += 4
        
        // Move down 2 places
        pointer += 2
        
    } else if array[pointer] == "I" && array[pointer + 1] == "X" {
        total += 9
        pointer += 2
        
    } else if array[pointer] == "X" && array[pointer + 1] == "L" {
        total += 40
        pointer += 2
        
    } else if array[pointer] == "X" && array[pointer + 1] == "C" {
        total += 90
        pointer += 2
        
    } else if array[pointer] == "C" && array[pointer + 1] == "D" {
        total += 400
        pointer += 2
        
    } else if array[pointer] == "C" && array[pointer + 1] == "M" {
        total += 900
        pointer += 2
        
    } else if array[pointer] == "I" {
        total += 1
        pointer += 1
        
    } else if array[pointer] == "V" {
        total += 5
        pointer += 1
        
    } else if array[pointer] == "X" {
        total += 10
        pointer += 1
        
    } else if array[pointer] == "L" {
        total += 50
        pointer += 1
        
    } else if array[pointer] == "C" {
        total += 100
        pointer += 1
        
    } else if array[pointer] == "D" {
        total += 500
        pointer += 1
        
    } else if array[pointer] == "M" {
        total += 1000
        pointer += 1
        
    }

    
    return total
    
}

romanToInt("III") // 3
romanToInt("IV") // 4
romanToInt("IX") // 9
romanToInt("LVIII") // 58
romanToInt("MCMXCIV") // 1994


func dictSolution(_ s: String) -> Int {
    let dictionary: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000];
    
    var array: [Int] = []
    
    // Create array of number values corresponding with the character
    for char in s {
        if let num = dictionary[char] {
            array.append(num)
        }
    }
    
    // print(array)
    
    var sum = 0
    
    while array.count != 0 {
        
        // If there is only one number in the array
        if array.count == 1 {
            
            // Add the number to the sum
            sum += array[0]
            
            // Remove that number
            array.removeFirst()
            
            // And return
            break
        }
        
        // If the first number is larger than the next number
        if array[0] >= array[1] {
            // Add the first number to the sum
            sum += array[0]
            
            // Then remove it
            array.removeFirst()
            
        // If the first number is not larger than the next number
        } else {
            // Subtract the first number from the second number
            // and add it to the sum
            sum = sum + array[1] - array[0]
            
            // Remove the first number
            array.removeFirst()
            
            // Remove the second number (now the first number in the array
            array.removeFirst()
        }
    }
    return sum
}

dictSolution("III") // 3
dictSolution("IV") // 4
dictSolution("IX") // 9
dictSolution("LVIII") // 58
dictSolution("MCMXCIV") // 1994


"""

Convert Integers to Roman Numerals

Symbol      Value
I           1
V           5
X           10
L           50
C           100
D           500
M           1000

"""

// BRUTE FORCE SOLUTION
func intToRoman(number: Int) -> String {
    
    // Setup our output string
    var result: String = ""
    
    // Redeclare number in order to change it
    var number = number
    
    // 1776
    
    // while the number is greater than 0
    while number > 0 {
        // If greater than or equal to 1000
        if number >= 1000 {
            // Subtract 1000
            number -= 1000
            
            // Add an M to the result string
            result += "M"
            
            print("Number: \(number)")
            print("Result: \(result)")
            
        // If less than 1000 and >= 500
        } else if number < 1000 && number >= 500 {
            // Subtract 500
            number -= 500
            
            // Add a D to the result string
            result += "D"
            
            print("Number: \(number)")
            print("Result: \(result)")
            
        // If less than 500 and >= 100
        } else if number < 500 && number >= 100 {
            // Subtract 100
            number -= 100
            
            // Add a C to the result string
            result += "C"
            
            print("Number: \(number)")
            print("Result: \(result)")
            
        // If less than 100 and >= 50
        } else if number < 100 && number >= 50 {
            // Sutract 50
            number -= 50
            
            // Add an L to the result string
            result += "L"
            
            print("Number: \(number)")
            print("Result: \(result)")
            
        // If less than 50 and >= 10
        } else if number < 50 && number >= 10 {
            // Subtract 10
            number -= 10
            
            // Add an X to the result string
            result += "X"
            
            print("Number: \(number)")
            print("Result: \(result)")
            
        // If less than 10 and >= 5
        } else if number < 10 && number >= 5 {
            // Subtract 5
            number -= 5
            
            // If number is 4
            if number == 4 {
                // Add an IV to the result string
                result += "IV"
                
            // Otherwise
            } else {
                // Add a V to the result string
                result += "V"
            }
            
            print("Number: \(number)")
            print("Result: \(result)")
            
        // If less than 4
        } else if number < 4 {
            // Subtract 1
            number -= 1
            
            // Add an I to the result string
            result += "I"
            
            print("Number: \(number)")
            print("Result: \(result)")
        }

            
    }

    return result
}

intToRoman(number: 1776)

// SUGGESTED SOLUTION

func intToRomanSuggested(number: Int) -> String {
    
    // Define roman numeral system
    // Sort the arrays from largest-to-smallest
    let decimals = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    let numerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    
    // Setup our output string
    var result: String = ""
    
    // Redeclare number in order to change it
    var number = number
    
    // Iterate for as long as number is greater than 0
    while number > 0 {
        
        // Access both array index and array value
        for (index, decimal) in decimals.enumerated() {
            
            // If number the decimal can fit inside the number
            if number - decimal >= 0 {
                
                // Subtract the decimal from the number
                number -= decimal
                
                // Add the numeral at the matching index to our result string
                result += numerals[index]
                
                print("Found \(numerals[index]) for \(decimal)")
                
                // If we've found a roman literal, so continue with next iteration
                break
            }
        }
    }
    
    
    return result
    
}

print(intToRomanSuggested(number: 2019)) // MMXIX
print(intToRomanSuggested(number: 1776)) // MDCCLXXVI
print(intToRomanSuggested(number: 1999)) // MCMXCIX
