import UIKit

"""

> Given an array of integers, return indices of the two numbers such that they add up to a specific target.

> You may assume that each input would have exactly one solution, and you may not use the same element twice.

Example:

Given nums = [2, 7, 11, 15], target = 9,

Because nums[0] + nums[1] = 2 + 7 = 9,
return [0, 1].

"""

// #1
// BRUTE FORCE SOLUTION
// O (n^2)

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var solutionsArray: [Int] = []
        
        for eachIndex in 0..<nums.count {
            //var baseNumber = eachIndex
            
            // Don't count where I currently am in the iteration
            for innerNum in 0..<nums.count where innerNum != eachIndex {
                if nums[eachIndex] + nums[innerNum] == target {
                    solutionsArray = [innerNum, eachIndex]
                }
            }
        }
        return solutionsArray
    }
}

let solution1 = Solution()

print("Brute Force Solution: \(solution1.twoSum([2, 7, 11, 15], 9))")


// #2
// BINARY SEARCH for complement (because it's sorted)
// O(n log n)

// Binary Search Helper Method
func binarySearch(array: [Int], key: Int) -> Bool {
    
    if array.count == 0 { return false }
    
    let minIndex: Int = 0
    let maxIndex: Int = array.count - 1
    let midIndex: Int = maxIndex / 2
    
    if key > array[maxIndex] || key < array[minIndex] {
        return false
    }
    
    let midValue = array[midIndex]
    
    // Take upper half of the array
    if key > midValue {
        let slice: [Int] = Array(array[midIndex + 1...maxIndex])
        return binarySearch(array: slice, key: key)
    }
    
    // Take lower half of the array
    if key < midValue {
        let slice = Array(array[minIndex...midIndex - 1])
        return binarySearch(array: slice, key: key)
    }
    
    // Found the key
    if key == midValue {
        print("\(key) found in the array")
        return true
    }
    
    return false
}

func binarySearchComplements(_ nums: [Int], _ target: Int) -> [Int]  {
    
    var result: [Int] = []
    
    // Iterate over array to find the compliment
    for i in 0..<nums.count {
        let complement = target - nums[i]
        
        // Adjust array to remove the number we are currently looking at, so that it doesn't use that same number as a complement
        var tempArray = nums
        tempArray.remove(at: i)
        
        let hasComplement = binarySearch(array: tempArray, key: complement)
        print("num: \(nums[i]) - \(hasComplement)")
        
        if hasComplement == true {
            print("true - num: \(nums[i]), complement: \(complement)")
            //result = [complement, nums[i]]
            //var indexOfComplement =
            result.append(i)
        }
    }
    
    return result
}

print("Binary Search Complements Solution: \(binarySearchComplements([2, 7, 11, 15], 9))")
print("Binary Search Complements Solution: \(binarySearchComplements([2, 5, 6, 7, 11, 15], 9))")


// #3
// HASH TABLE SOLUTION
// O(n)

class HashSolution {
    func twoSumHash(_ nums: [Int], _ target: Int) -> [Int] {
        
        var sumDict: [Int: Int] = [:]
        var result: [Int] = []
        
        // For every index in the array
        for currentIndex in 0..<nums.count {
            
            // Find the complement to n that would sum up to the target
            let numberToFind: Int = target - nums[currentIndex]
            
            // Check if the complement is in the dictionary
            if let indexOfNumberToFind = sumDict[numberToFind] {
                result = [indexOfNumberToFind, currentIndex]
            }
            
            // keys in dictionary will be the numbers
            let key = nums[currentIndex]
            
            // Store into the dictionary
            // values in dictionary will be the index of where that number is found in the array
            sumDict[key] = currentIndex
            print(sumDict)
        }
        
        return result
    }
}

let solution2 = HashSolution()

print("Hash Table Solution: \(solution2.twoSumHash([2, 7, 11, 15], 9))")


// #4
// MOVE POINTER from either end
// Linear - O(n)

"""
Pointers at either end of the array.
If the sum is greater than the target, move the high pointer down
If the sum is less than the target, move the low pointer up
If the pointers cross, no two values in the array add up to the target
"""

func twoPointers(_ nums: [Int], _ target: Int) -> [Int] {
    
    var result: [Int] = []
    
    // Pointers
    var lowIndex = 0
    var highIndex = nums.count - 1
    
    while lowIndex < highIndex {
        
        // Get sum of two pointers
        let sumOfItems = nums[lowIndex] + nums[highIndex]
        
        if sumOfItems == target {
            print("Sum of \(nums[lowIndex]) and \(nums[highIndex]) = \(target)")
            result = [lowIndex, highIndex]
            return result
        } else if sumOfItems < target {
            lowIndex += 1
        } else if sumOfItems > target {
            highIndex -= 1
        }
    }
    
    return result
}

print("Moving Pointers Solution: \(twoPointers([2, 7, 11, 15], 9))")
