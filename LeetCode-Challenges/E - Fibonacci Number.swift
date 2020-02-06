//
//  E - Fibonacci Number.swift
//  
//
//  Created by Audrey Welch on 2/5/20.
//

import Foundation

"""
The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1.

That is:
F(0) = 0, F(1) = 1
F(N) = F(N - 1) + F(n - 2), for N > 1

Given N, calculate F(N)

EXAMPLE 1
Input: 2
Output: 1
Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1

EXAMPLE 2
Input: 3
Output: 2
Explanation: F(3) = F(2) + F(1) = 1 + 1 = 2

EXAMPLE 3
Input: 4
Output: 3
Explanation: F(4) = F(3) + F(2) = 2 + 1 = 3

0 1 1 2 3 5 8 13 21 34...

"""

func fib(_ N: Int) -> Int {
    
    if N == 0 {
        return 0
    } else if N == 1 {
        return 1
    } else {
        return fib(N - 1) + fib(N - 2)
    }

}

print(fib(2)) // 1
print(fib(3)) // 2
print(fib(4)) // 3
print(fib(5)) // 5
print(fib(6)) // 8

func nonRecursiveFib(_ N: Int) -> Int {
    
    var firstNumber = 1
    var secondNumber = 1
    var fibNumber: Int = 0
    
    if N == 1 || N == 2 {
        return 1
    }
    
    for eachFib in 3...N {
        fibNumber = firstNumber + secondNumber
        
        // Move up one step
        firstNumber = secondNumber
        secondNumber = fibNumber
    }
    
    return fibNumber
 
}

print(nonRecursiveFib(2)) // 1
print(nonRecursiveFib(3)) // 2
print(nonRecursiveFib(4)) // 3
print(nonRecursiveFib(5)) // 5
print(nonRecursiveFib(6)) // 8
