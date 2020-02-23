//
//  H - Integer to English Words.swift
//  
//
//  Created by Audrey Welch on 2/22/20.
//

import Foundation

/*
 
 Convert a non-negative integer to its english words representation.
 Given input is guaranteed to be less than 2^31- 1.
 
 Example 1:
 > Input: 123
 > Output: "One Hundred Twenty Three"
 
 Example 2:
 > Input: 12345
 > Output: "Twelve Thousand Three Hundred Forty Five"
 
 Example 3:
 > Input: 1234567
 > Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
 
 Example 4:
 > Input: 1234567891
 > Output: "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"
 
 */

/*
 
 PLAN
 
 THINGS I KNOW
 > Counting from the left
    .. index 2 will have "hundred" at end of number
    .. index 3 - 5 will have "thousand" at the end
    .. index 6 - 8 will have "million"
    .. index 9 - 11 will have "billion"
 
 > I need to find nubers in sets of three, then add the correct suffix
 
 
 */


class Solution {
    
    var oneDigitDict: [Int: String] = [ 0: "",
                                        1: "One",
                                        2: "Two",
                                        3: "Three",
                                        4: "Four",
                                        5: "Five",
                                        6: "Six",
                                        7: "Seven",
                                        8: "Eight",
                                        9: "Nine" ]
    
    var teensDict: [Int: String] = [ 10: "Ten",
                                     11: "Eleven",
                                     12: "Twelve",
                                     13: "Thirteen",
                                     14: "Fourteen",
                                     15: "Fifteen",
                                     16: "Sixteen",
                                     17: "Seventeen",
                                     18: "Eighteen",
                                     19: "Nineteen" ]
    
    var tensDict: [Int: String] = [ 2: "Twenty",
                                    3: "Thirty",
                                    4: "Forty",
                                    5: "Fifty",
                                    6: "Sixty",
                                    7: "Seventy",
                                    8: "Eighty",
                                    9: "Ninety" ]
    
    let names: [String] = [" Thousand", " Million", " Billion"]

    
    func numberToWords(_ num: Int) -> String {
        
        if num == 0 {
            return "Zero"
        }
        
        var num = num
        var index = 0
        var buffer = convert3DigitNumbers(n: num % 1000)
        
        // 0 < thousand
        if num < 999 {
            return buffer
        }
        
        if num > 2147483647 { return "num out of range." }
        
        num /= 1000
        
        while num > 0 {
            let threeDigitsWord = convert3DigitNumbers(n: num % 1000)
            
            if threeDigitsWord.count > 0 {
                let space = buffer.count > 0 ? " " : ""
                buffer = threeDigitsWord + names[index] + space + buffer
            }
            
            index += 1
            num /= 1000
        }

        return buffer
    }

    func convert2DigitNumbers(num: Int) -> String {
        
        if num == 0 {
            return ""
        }
        
        // If the number is less than ten, return the matching ones place word
        if num < 10 {
            return oneDigitDict[num]!
        }
        
        // If the number is less than twenty, return the matching tens place digit (teen)
        if num < 20 {
            return teensDict[num]!
        }
        
        // Find the tens place number
        let tens = num / 10
        
        // Find the ones place number
        let ones = num % 10
        
        // If the ones place is not zero,
        // Return the tens place (twenty) plus the ones place (two)
        if ones != 0 {
            return tensDict[tens]! + " " + oneDigitDict[ones]!
        
        // Otherwise, just return the tens place
        } else {
            return tensDict[tens]!
        }
        
    }
    
    func convert3DigitNumbers(n: Int) -> String {
        
        // Find the tens place
        let tens = convert2DigitNumbers(num: n % 100)
        
        // Find the hundreds place
        let numOfHundred = n / 100
        
        // Print the word associated with the hundreds place + the word "hundred"
        let hundred = numOfHundred > 0 ? oneDigitDict[n / 100]! + " Hundred" : ""
        
        // If the tens place is greater than zero
        if tens.count > 0 {
            // If numOfHundred is greater than zero, return the word for the hundreds place
            // + a space + the tens place
            return numOfHundred > 0 ? hundred + " " + tens : tens
        }
        
        return hundred
    }
}

var numberToWord = Solution()
print(numberToWord.numberToWords(123)) // "One Hundred Twenty Three"
print(numberToWord.numberToWords(12345)) // "Twelve Thousand Three Hundred Forty Five"
print(numberToWord.numberToWords(1234567891)) // "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"
