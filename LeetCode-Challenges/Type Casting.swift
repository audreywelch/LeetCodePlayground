//
//  Type Casting.swift
//  
//
//  Created by Audrey Welch on 3/3/20.
//

import UIKit

var newArray: [Any] = ["String", 2, 5, UIView(), 6, 2, 1, 4, 8]

// Takes an array
// Returns sum of all the ints

func newFunction(array: [Any]) -> Int {
    
    var resultSum: Int = 0
    
    for element in array {
        
        // Set variable to intElement if it can be cast as an integer
        if let intElement = element as? Int  {
            
            resultSum += intElement
        }
    }
    
    return resultSum
}

newFunction(array: newArray)


// Remove everything from array that is not an Integer
// Return new array of ints
func integerArray(array: [Any]) -> [Int] {

    var resultArray: [Int] = []
    
    for i in 0..<array.count {
        
        if array[i] is Int {
            resultArray.append(array[i] as! Int)
        }
    }
    
    return resultArray
}

integerArray(array: newArray)
