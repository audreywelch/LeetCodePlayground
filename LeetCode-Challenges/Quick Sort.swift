//
//  Quick Sort.swift
//  
//
//  Created by Audrey Welch on 2/29/20.
//

import Foundation

/*
 
 QUICKSORT
 Time: O(n log n)
 
 1. Select an element from the array as the "pivot element." It doesn't matter which you choose as the pivot, but typically it can be the middle element.
 
 2. Iterate through the array and put all elements smaller than the pivot in one array, all elements equal to the pivot in one array, and all elements larger than the pivot in one array.
 
 3. Sort both arrays by recursively applying quicksort to them
 
 
 [10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26]
 
 Pivot: 8
 
 less: [0, 3, 2, 1, 5, -1]
 equal: [8, 8]
 greater: [10, 9, 14, 27, 26]
 
 Now do quicksort on less and equal
 
 */

func quickSort(array: [Int]) -> [Int] {
    
    var less = [Int]()
    var equal = [Int]()
    var greater = [Int]()
    
    if array.count > 1 {
        let pivot = array[array.count/2]
        
        for x in array {
            if x < pivot {
                less.append(x)
            }
            
            if x == pivot {
                equal.append(x)
            }
            
            if x > pivot {
                greater.append(x)
            }
        }
        
        return (quickSort(array: less) + equal + quickSort(array: greater))
    } else {
        return array
    }
}

// Another implementation

func quickSort2<T: Comparable>(_ array: [T]) -> [T] {
    
    guard array.count > 1 else { return array }
    
    let pivot = array[array.count/2]
    
    let less = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let greater = array.filter { $0 > pivot }
    
    return quickSort2(less) + equal + quickSort2(greater)
    
}
