//
//  E - FizzBuzz.swift
//  
//
//  Created by Audrey Welch on 2/25/20.
//

import Foundation

/*
 
 Write a program that outputs the string representation of numbers from 1 to n.

 But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.
 
 n = 15,

 Return:
 [
     "1",
     "2",
     "Fizz",
     "4",
     "Buzz",
     "Fizz",
     "7",
     "8",
     "Fizz",
     "Buzz",
     "11",
     "Fizz",
     "13",
     "14",
     "FizzBuzz"
 ]
 
 */

// Time: O(n)
// Space: O(1)
func fizzBuzz(_ n: Int) -> [String] {
    
    var resultArray: [String] = []
    
    for number in 1...n {
        
        if number % 3 == 0 && number % 5 == 0 {
            resultArray.append("FizzBuzz")
        } else if number % 3 == 0 {
            resultArray.append("Fizz")
        } else if number % 5 == 0 {
            resultArray.append("Buzz")
        } else {
            resultArray.append("\(number)")
        }
    }
    
    return resultArray
}

print(fizzBuzz(15))

// Optimized for adding a bunch of mappings
// O(n)
// O(1)
func fizzBuzzJazz(_ n: Int) -> [String] {
    
    var answer: [String] = []
    
    // Dictionary to store all fizzbuzz mappings
    var fizzBuzzDictionary = [3: "Fizz", 5: "Buzz", 7: "Jazz"]
    
    for num in 1...n {
        
        var numAnswerStr = ""
        
        for key in fizzBuzzDictionary.keys {
            
            // If the num is divisible by the key,
            // then add the corresponding string mapping to current numAnswerStr
            if num % key == 0 {
                numAnswerStr += fizzBuzzDictionary[key]!
            }
        }
        
        if numAnswerStr.isEmpty {
            answer.append("\(num)")
        } else {
            answer.append(numAnswerStr)
        }
        
        
    }
    
    return answer
    
}

print(fizzBuzzJazz(15))
