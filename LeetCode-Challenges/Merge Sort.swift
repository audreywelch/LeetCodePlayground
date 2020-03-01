//
//  Merge Sort.swift
//  
//
//  Created by Audrey Welch on 2/29/20.
//

import Foundation

/*
 
 MERGE SORT
 Time: O(n log n)
 Divide & Conquer Approach
 
 Two Steps:
 1. Chop array in half until element is in own single array
 2. Combine arrays while sorting in process
 
 [7, 3, 1, 8, 5, 4, 2, 6]
 
 // Chop array in half until
 // Each element is in its own array
 
 [7] [3] | [1] [8] | [5] [4] | [2] [6]
 
 // Comibine arrays
 Compare first element in left array and first element in right array
 Whichever one is smaller, we append to a new array
 
 [3, 7] [1, 8] | [4, 5] [2, 6]
 
 Compare 3 and 1 - 1 is smaller, so REMOVE 1
 Put it in the array
 
 [1,     ]
 
 [3, 7] [8]
 
 Compare 3 and 8 - 3 is smaller, so remove and put in the array
 
 [1, 3,     ]
 
 [7] [8] etc.

 [1, 3, 7, 8]
 
 [1, 3, 7, 8] [2, 4, 5, 6]
 
 // If one array gets down to zero elements first,
 // we can just append the array with elements to the end of the new array
 // because we know its elements are already sorted
 
 */

// TWO STEPS
// Split
// Merge

// Split Arrays
// Takes in an unsorted array -> returns a sorted array
func mergeSort(array: [Int]) -> [Int] {
    
    // Make sure array has more than one object
    guard array.count > 1 else {
        return array
    }
    
    // Left array is beginning up to (but not including) the middle
    let leftArray = Array(array[0..<array.count/2])
    
    // Right array is middle to the end
    let rightArray = Array(array[array.count/2..<array.count])
    
    // Keep running merge sort to split the array until each number is in its own array
    // Result of recursively running merge sort on each side of the array,
    // then finally merge the left and right side of the recomposed sorted array
    return merge(left: mergeSort(array: leftArray), right: mergeSort(array: rightArray))
}

// Merge Arrays
// Takes in left array and right array, and returns combined/merged array
func merge(left: [Int], right: [Int]) -> [Int] {
    
    // Array to return
    var mergedArray: [Int] = []
    
    // Make arrays mutable
    var left = left
    var right = right
    
    // While both arrays have at least one element in them
    while left.count > 0 && right.count > 0 {
        
        // If the first element in the left array is smaller
        if left.first! < right.first! {
            
            // Remove it and append that returned first element to the merged array
            mergedArray.append(left.removeFirst())
        
        // Otherwise, do the opposite
        } else {
            mergedArray.append(right.removeFirst())
        }
    }
    
    // If one of the arrays runs out of elements
    // but the other still has elements,
    // Append the element with elements to the merged array
    // because it's already sorted
    return mergedArray + left + right
}

