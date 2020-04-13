//
//  E - Last Stone Weight.swift
//  
//
//  Created by Audrey Welch on 4/13/20.
//

import Foundation

/*
 
 We have a collection of stones, each stone has a positive integer weight.
 
 Each turn, we choose the two heaviest stone and smash them together. Suppose the stones have weights x and y with x <= y.
 
 The result of the smash is:
 
    - If x == y, both stones are totally destroyed;
    - If x != y, the stone of weight x is totally destroyed, and the stone of weight y has new weight y - x.
 
 At the end, there is at most 1 stone left. Return the weight of this stone ) or 0 if there are no stones left.)
 
 Example
 Input: [2, 7, 4, 1, 8, 1]
 Output: 1
 Explanation:
    > We combine 7 and 8 to get 1 so the array converts to [2, 4, 1, 1, 1] then,
    > We combine 2 and 4 to get 2 so the array converts to [2, 1, 1, 1] then,
    > We combine 2 and 1 to get 1 so the array converts to [1, 1, 1] then,
    > We combine 1 and 1 to get 0 so the array converts to [1] then that's the value of the last stone
 
 Note
    > 1 <= stones.length <= 30
    > 1 <= stones[i] <= 1000
 
 */

func lastStoneWeight(_ stones: [Int]) -> Int {
    
    // Make array mutable
    var stones = stones
    
    while stones.count > 1 {
        
        // Sort the array from largest to smallest
        stones.sort { ($0 > $1) }
        
        if stones[0] != stones[1] {
            print("Stone \(stones[0]) is not equal to Stone \(stones[1]) so we are subtracting the larger from the smaller: \(stones[0]) - \(stones[1]) and replacing the stones[0] with that number, then removing at first index.")
            stones[0] = stones[0] - stones[1]
            stones.remove(at: 1)
            print(stones)
        } else if stones[0] == stones[1] {
            stones.remove(at: 0) // Remove them both
            stones.remove(at: 0)
        }
        
    }
    
    print("Stones at the end: \(stones)")
    
    
    // Return the value of the only item in the array
    if stones.count >= 1 {
        return stones[0]
    } else {
        return 0
    }
}

lastStoneWeight([2, 7, 4, 1, 8, 1]) // 1
lastStoneWeight([2, 2]) // 0
