//
//  M - Counting Elements.swift
//  
//
//  Created by Audrey Welch on 4/7/20.
//

import Foundation

/*
 
 Given an integer array `arr`, count element `x` such that `x + 1` is also in `arr`.
 If there're duplicates in arr, count them separately.
 
 EXAMPLE 1
 Input:
    > arr = [1, 2, 3]
 
 Output:
    > 2
 
 Explanation:
    > 1 and 2 are counted because 2 and 3 are in arr.
 
 -----
 
 EXAMPLE 2
 Input:
    > arr = [1, 1, 3, 3, 5, 5, 7, 7]
 
 Output:
    > 0
 
 Explanation:
    > No numbers are counted, because there's no 2, 4, 6, or 8 in arr.
 
 -----
 
 EXAMPLE 3
 Input:
    > arr = [1, 3, 2, 3, 5, 0]
 
 Output:
    > 3
 
 Explanation:
    > 0, 1, and 2 are counted becuase 1, 2, and 3 are in arr.
 
 -----
 
 EXAMPLE 4
 Input:
    > arr = [1, 1, 2, 2]
 
 Output:
    > 2
 
 Explanation:
    > Two 1s are counted because 2 is in arr.
 
 -----
 
 Constraints:
    > 1 <= arr.length <= 1000
    > 0 <= arr[i] <= 1000
 
 */

func countElements(_ arr: [Int]) -> Int {
    
    var result = 0
    
    for num in arr {
        
        var numToFind = num + 1
        
        if arr.contains(numToFind) {
            result += 1
        }
    }
    
    
    return result
}

countElements([1, 2, 3]) // 2
countElements([1, 1, 3, 3, 5, 5, 7, 7]) // 0
countElements([1, 3, 2, 3, 5, 0]) // 3
countElements([1, 1, 2, 2]) // 2
