//
//  E - Lightbulbs On.swift
//  
//
//  Created by Audrey Welch on 2/5/20.
//

import Foundation

"""

Count the number of lightbulbs lit up next to each other

[0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1]
> 4

"""

func findNumberInARow(array: [Int]) -> Int {
    
    var lightbulbCount: Int = 0
    var mostInARow: Int = 0
    
    for eachLightbulb in array {
        if eachLightbulb == 1 {
            lightbulbCount += 1
            if lightbulbCount > mostInARow {
                mostInARow = lightbulbCount
            }
        } else {
            lightbulbCount = 0
        }
    }
    
    
    return mostInARow
}

var lightbulbs = [0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 1, 0, 1, 1]
findNumberInARow(array: lightbulbs)

/*
 
 Given an input array, if there are three consecutive numbers in any part of the given array then output '1' else '0'
 
 */

func threeConsecutive(arr: [Int]) -> Int {
    
    var result: Int = 0
    
    var numberOfConsecutives: Int = 0
    var numberToMatch: Int = arr.first!
    
    // Loop through array
    for i in arr {
        if i == numberToMatch {
        
            numberOfConsecutives += 1
        
            if numberOfConsecutives == 3 {
                result = 1
                return result
        
            }
        } else {
            numberToMatch = i
        }
    }
    
    return result
    
}

threeConsecutive(arr: [0, 6, 3, 4, 4, 7, 0, 5, 5, 5, 6, 3])
threeConsecutive(arr: [0, 1, 0, 0, 0, 4])
threeConsecutive(arr: [0, 1, 0, 1, 0, 2, 4, 4, 2])
