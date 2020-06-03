//
//  M - Combination Sum.swift
//  
//
//  Created by Audrey Welch on 6/2/20.
//

import Foundation

/*
 
 Given a set of cnadidate numbers (candidates) without duplicates, and a target (target),
 find all unique combinations in candidates where the candidate numbers sums to target.
 
 The same repeated number may be chosen from candidates unlimited number of times
 
 Note:
    > All numbers ( including target ) will be positive integers.
    > The solution set must not contain duplicate combinations.
 
 Example 1
    > Input: candidates = [2, 3, 6, 7], target = 7
    > A solution set is:
        [
            [7],
            [2, 2, 3]
        ]
 
 Example 2
    > Input: candidates = [2, 3, 5], target = 8
    > A solution set is:
        [
            [2, 2, 2, 2],
            [2, 3, 3],
            [3, 5]
        ]
 
 */

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    
    // Loop through the array
    // While looking at the first number
    // If the num is equal to the target, add it to the solution set
    // If the num is a multiple of the target, divide target by num (to get multiple)
    // and create an array containing num, muliple amount of times
    // If num is less than the target, loop through the rest of the array checking for:
    // target - num = newTarget
    // nextNum == newTarget? >> if so, add num & nextNum into an array & to solution set
    // if the nextNum is a multiple of the newTarget, divide target by num (to get multiple)
    // and create an array containing, num, and newNum the multiple amount of times
    
    // This exact repetition of steps points me to using recursion
    
    
    
    // Base case
    // Stop searching for the following reasons
    
//    for i in 0..<candidates.count {
//
//        var num = candidates[i]
//
////        var newTarget = target - candidates[i]
//
//        // Check if it is the target
//        if num == target {
//            let newCandidate = [num]
//            resultArray.append(newCandidate)
//        }
//
//        // Check if it is a multiple of the target
//        if target % num == 0 {
//            let multiple = target / num
//            var newCandidate = Array(repeating: num, count: multiple)
//            resultArray.append(newCandidate)
//        }
//
//        // Check all remaining numbers in the array
//        if num < target {
//
//            combinationSum(candidates, target - num)
//
//        }
//
//    }
    
    var resultArray: [[Int]] = []
    var temp = [Int]()
    
    backtrackHelper(&resultArray, &temp, candidates, target, 0)
    
    return resultArray
}

func backtrackHelper(_ resultArray: inout [[Int]],
                     _ tempList: inout [Int],
                     _ candidates: [Int],
                     _ target: Int,
                     _ startingIndex: Int) {
    
    // Base Case
    if target < 0 {
        print("target is less than 0")
        return
    }
    
    if target == 0 {
        resultArray.append(tempList)
        return
    }
    
    // Recursion
    // Keeps working at the 0 index until we've subtracted the target down to 0
    // If it actually reaches 0 and is equal to 0, it means it was a multiple of the target,
    // so add the temporary list to our result list
    for i in startingIndex..<candidates.count {
        
        print("i is \(i)")
            
        var num = candidates[i]
        
        if num == 0 { continue } // end this iteration of the loop
            
        tempList.append(num)
        
        print("temp list: \(tempList)")
        
        backtrackHelper(&resultArray, &tempList, candidates, target - num, i)
        tempList.removeLast()
        
        print("new temp list: \(tempList)")
        
    }

}

//combinationSum([2, 3, 6, 7], 7) // [[7], [2, 2, 3]]
combinationSum([2, 3, 5], 8) // [[2, 2, 2, 2], [2, 3, 3], [3, 5]]
