//
//  E - Most Common Element.swift
//  
//
//  Created by Audrey Welch on 2/5/20.
//

import Foundation

"""

Most Common element in the array and the count of how often it appears

"""

var colorArray = ["red", "red", "green", "green", "black", "blue", "yellow", "red", "green", "yellow", "red", "red", "green", "green", "grey", "purple", "orange", "grey", "blue", "red", "green", "yellow", "orange", "purple", "black", "red", "blue", "green", "orange", "blue", "white", "yellow", "blue", "red", "green", "orange", "purple", "blue", "black"]

func mostCommonElement(array: [String]) -> [String] {
    
    // Create a dictionary that will hold the colors as keys and the amount of times they appear as values
    var colorDictionary: [String: Int] = [:]
    
    var mostCommonColors: [String] = []
    
    // Iterate through the array
    for color in array {
        
        // If the color is in there / is not nil
        if let count = colorDictionary[color] {
            colorDictionary[color] = count + 1
            
            
        // If there is no count / it's nil, it means it's the first time we've seen the color
        // Otherwise add it to the dictinary with the value as one appearance
        } else {
            colorDictionary[color] = 1
        }
    }
    
    let highestValue = colorDictionary.values.max()
    
    let finalDict = colorDictionary.filter( {$0.value == highestValue} )
    
//    for (color, count) in colorDictionary {
//        if count == highestValue {
//            mostCommonColors.append(color)
//        }
//    }
    
    print(finalDict)
    print(colorDictionary)
    
    return mostCommonColors
    
}

//mostCommonElement(array: colorArray)


// Use the following for no built-in dictionary capabilities
func mostCommonElementBasic(array: [String]) -> [String] {
    
    if array == nil {
        return [""]
    }
    
    // Create a dictionary that will hold the colors as keys and the amount of times they appear as values
    var colorDictionary: [String: Int] = [:]
    
    var topCount = 1
    var topColor: [String] = []
    
    // Iterate through the array
    for color in array {
        
        // If the color is in there / is not nil
        if let count = colorDictionary[color] {
            
            colorDictionary[color] = count + 1
            
            let updatedCount = count + 1
            
            if updatedCount > topCount {
                topCount = updatedCount
                topColor = [color]
            } else if updatedCount == topCount {
                topCount = updatedCount
                topColor.append(color)
            }
            
        // If there is no count / it's nil, it means it's the first time we've seen the color
        // Otherwise add it to the dictinary with the value as one appearance
        } else {
            colorDictionary[color] = 1
        }
    }
    
    print(colorDictionary)
    print("\(topColor): \(topCount)")
    
    return topColor
    
}

mostCommonElementBasic(array: colorArray)
