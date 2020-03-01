//
//  Sorting - Bubble Sort.swift
//  
//
//  Created by Audrey Welch on 3/1/20.
//

import Foundation

/*
 
 BUBBLE SORT
 Time: O(n^2)
 Space: O(1)
 
    > Start at the beginning of the array and swap the first two elements only if the first element is greater than the second element.
    > This comparison is then moved onto the next pair and so on.
    > This is done until the array is completely sorted.
    > Smaller items slowly "bubble" up to the beginning of the array.
 
 
 */

func bubbleSort(array: [Int]) -> [Int] {
    
    var array = array
    
    for i in 0..<array.count {
        for j in 1..<array.count - 1 {
            
            if array[j] < array[j-1] {
                
                let temp = array[j-i]
                array[j-1] = array[j]
                array[j] = temp
            }
        }
    }
    
    return array
}
