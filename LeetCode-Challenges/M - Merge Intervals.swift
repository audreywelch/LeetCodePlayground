//
//  M - Merge Intervals.swift
//  
//
//  Created by Audrey Welch on 5/5/20.
//

import Foundation

/*
 
 Given a collection of intervals, merge all overlapping intervals.

 Example 1:
    > Input: [[1, 3], [2, 6], [8, 10], [15, 18]]
    > Output: [[1, 6], [8, 10], [15, 18]]
    > Explanation: Since intervals [1, 3] and [2, 6] overlaps, merge them into [1, 6].
 
 Example 2:
    > Input: [[1, 4], [4, 5]]
    > Output: [[1, 5]]
    > Explanation: Intervals [1, 4] and [4, 5] are considered overlapping.
 
 */

func merge(_ intervals: [[Int]]) -> [[Int]] {
    
    // Overlapping intervals means either the first number of an array is less than or equal to
    // the second number of another array
    
    // I think I'll need to sort the array by the first element in each array
    // that will guarantee that I can use the rule above
    
    // [2, 4], [1, 2]
    // [5, 8], [4, 6]
    
    // The merged array will have the first number (array[0]) as the smallest of the four
    // and the second number (array[1]) as the largest number of the four
    
    // Assign the first array to a variable
    
    // Loop through to look at each array, starting with the second
    // Compare the array to the one stored in the variable
    // if secondArray[0] <= previousArray[1]
    // findMin(previousArray[0], previousArray[1], secondArray[0], secondArray[1]
    // findMax()
    // newArray = [min, max]
    // append to result array of arrays
    // if NOT
    // append secondArray to result array
    
    // What about if there are more than 2 in a row that overlap
    // I think this will account for that
    // [1, 3], [2, 6], [3, 8]
    // [1, 6], [3, 8]
    // [1, 8]
    
    // What about if the first number is the same?
    // [2, 6], [2, 8]
    // [2, 8]
    

    var results = [[Int]]()
    
    if intervals == [] {
        return results
    } else if intervals.count == 1 {
        results.append(intervals[0])
        return results
    }
    
    let sortedIntervals = intervals.sorted(by: {$0[0] < $1[0]})
    print("sorted intervals: \(sortedIntervals)")
    
    var previous = sortedIntervals[0]
    
    for array in 1..<sortedIntervals.count {

        if sortedIntervals[array][0] <= previous[1] {
            print("current interval is less than or equal to previous: \(sortedIntervals[array][0]) <= \(previous[1])")

            let minimum = min(sortedIntervals[array][0],
                              sortedIntervals[array][1],
                              previous[0],
                              previous[1])
            
            let maximum = max(sortedIntervals[array][0],
                              sortedIntervals[array][1],
                              previous[0],
                              previous[1])

            let mergedArray = [minimum, maximum]
            
            // Update previous to the merged array
            previous = mergedArray
            
        } else {

            // Add previous to the results as it is not an overlap
            results.append(previous)
            
            // Update previous to the current array
            previous = sortedIntervals[array]
        }
    }
    
    // Add last array being held for inspection
    results.append(previous)
    
    return results
}

merge([[2, 6], [8, 10], [1, 3], [15, 18]]) // [[1, 6], [8, 10], [15, 18]]
merge([[1, 4], [4, 5]]) // [[1, 5]]
merge([]) // []
merge([[1, 3]]) // [[1, 3]]
merge([[1,4],[5,6]]) // [[1,4], [5,6]]
merge([[1, 4], [5, 6], [7, 9], [9, 10]]) // [[1, 4], [5, 6], [7, 10]]
