//
//  E - Reverse Integer.swift
//  
//
//  Created by Audrey Welch on 2/5/20.
//

import Foundation

"""

> Given a 32-bit signed integer, reverse digits of an integer.

> Example 1
> Input: 123
> Output: 321

> Example 2
> Input: -123
> Output: -321

"""

func reverse(_ x: Int) -> Int? {
    
    // Check that the number is not zero
    guard x != 0 else { return x }
    
    // Create allowed range of Int32
    let allowedRange = Int(Int32.min)...Int(Int32.max)
    
    // Check that the number is in the range to begin with
    guard allowedRange.contains(x) else { return 0 }
    
    let number = x
    let string = String(x)
    var reversedString = ""
    var reversedX: Int = 0
    
    // If number is negative
    if number < 0 {
        // Remove negative
        let positiveBase = String(0 - x)
        
        // Reverse
        reversedString = String(positiveBase.reversed())
        
        // Make negative
        reversedX = 0 - Int(reversedString)!
    
    // If number is positive
    } else {
        
        // Reverse
        reversedString = String(string.reversed())
        
        // Convert to Int
        reversedX = Int(reversedString)!
    }
    
    // Check that the reversed number is within range
    guard allowedRange.contains(reversedX) else { return 0 }
    return reversedX
}

//print("123 reversed is \(reverse(123))")
//print("-123 reversed is \(reverse(-123))")
//
//print("1534236469 reversed is \(reverse(1534236469))")

reverse(1534236469)


"""
ANOTHER SOLUTION that is faster but confusing to me

"""

func reverseFast(_ x: Int) -> Int {
    
    // Check that the number is not zero
    guard x != 0 else { return x }
    
    // Create allowed range of Int32
    let allowedRange = Int(Int32.min)...Int(Int32.max)
    
    // Check that the number is in the range to begin with
    guard allowedRange.contains(x) else { return 0 }
    
    // Turn integer value to array
    var digits: [Int] = []
    var remainder = abs(x)
    
    while remainder > 0 {
        let digit = remainder % 10
        digits.append(digit)
        remainder = remainder / 10
    }
    
    // Remove leading zero
    if let first = digits.first, first == 0 {
        digits.remove(at: 0)
    }
    
    // Compose result
    var result = 0
    var multiplier = Int(pow(Float(10), Float(digits.count - 1)))
    for digit in digits {
        result += digit * multiplier
        multiplier = multiplier / 10
    }
    
    // Check that the reversed number is within range
    guard allowedRange.contains(result) else { return 0 }
    
    // If the number is less than zero, make it negative, otherwise return positive
    return x < 0 ? -result : result
}

reverseFast(1534236469)
reverseFast(123)
reverseFast(-123)
