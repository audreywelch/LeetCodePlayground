//
//  M - Permutations.swift
//  
//
//  Created by Audrey Welch on 6/23/20.
//

import Foundation

/*
 
 Given a collection of distinct integers, return all possible permutations.
 
 Example:
    > Input: [1,2,3]
    > Output:
        [
            [1,2,3],
            [1,3,2],
            [2,1,3],
            [2,3,1],
            [3,1,2],
            [3,2,1]
        ]
 
 */


func permute(_ nums: [Int]) -> [[Int]] {
    
    var result = [[Int]]()
    
    var nums = nums
    
    recurse(0, &nums, &result)
    
    return result
}

func recurse(_ first: Int, _ nums: inout [Int], _ result: inout [[Int]]) {
    
    if first == nums.count {
        result.append(nums)
        return
    }
    
    for index in first..<nums.count {
        //
        nums.swapAt(first, index)
        recurse(first + 1, &nums, &result)
        nums.swapAt(first, index)
    }
    
}

permute([1, 2, 3])
