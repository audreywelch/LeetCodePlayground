//
//  Sorting - Insertion Sort.swift
//  
//
//  Created by Audrey Welch on 3/1/20.
//

import Foundation

/*
 
 INSERTION SORT
 Time: O(n^2)
 
    *Works well if big chunks of the array are already sorted, and with sorting small arrays
 
    > Evaluates a constant set of numbers with a secondary set of changing numbers
    > The outer loop acts as the invariant (assumption that remains unchanged), assuring all array values are checked.
    > The inner loop acts as a secondary engine, reviewing which numbers get compared.
    > Completed enough times, this process eventually sorts all items in the list
 
 Method:
 
    1. Put the numbers in a pile.
    2. Pick a number from the pile - easiest to pick from the top
    3. Insert this number into a new array
    4. Pick the next number in the unsorted pile and also insert that into the new array. It either goes before or after the first number you picked, so that now has these two numbers sorted.
    5. Again pick the next number from the pile and insert it into the array in the proper sorted position.
    6. Keep doing this until there are no more numbers on the pile. You end up with an empty pile and an array that is sorted.
 
    * Called "insertion" sort because you take a number from the pile and insert it in the array in its proper sorted position
 
In-Place
 
    > Keep track of which part of the array is sorted already and which part is the unsorted pile
 
        [| 8, 3, 5, 4, 6]
 
        [8 | 3, 5, 4, 6]
 
        [3, 8 | 5, 4, 6]
 
        [3, 5, 8 | 4, 6]
 
 How to Insert (inner loop):
 
    *Insert the number from the top of the pile into the sorted portion by swapping numbers.
 
    > Let's say we've already done the first few elements and the array looks like this:

        [ 3, 5, 8 | 4, 6 ]
 
    > The next number to sort is 4. We need to insert that into the sorted portion [ 3, 5, 8 ] somewhere.

    > Here's one way to do this: Look at the previous element, 8.

        [ 3, 5, 8, 4 | 6 ]
                ^
 
    > Is this greater than 4? Yes it is, so the 4 should come before the 8. We swap these two numbers to get:

        [ 3, 5, 4, 8 | 6 ]
                <-->
                swapped
 
    > We're not done yet. The new previous element, 5, is also greater than 4. We also swap these two numbers:

        [ 3, 4, 5, 8 | 6 ]
            <-->
            swapped
 
 */

func insertionSort(array: [Int]) -> [Int] {
// to make generic:
// func insertionSort<T>(_ array: [T], _ isOrderedBefore: (T, T) -> Bool) -> [T] {
    
    // Make copy of array for mutability
    var array = array
    
    // Look at each element in the array in order to pick the top-most number from the pile
    // index = index of where sorted portion ends and the pile begins |
    for index in 1..<array.count {
        
        let value = array[index]
        var position = index
        
        // Look at the element at position x - the number at the top of the pile
        // Step backwards through sorted array - each time find a previous number that is larger, make the swap
        // While the element is still less than the last element in the sorted portion
        // generic: while y > 0 && isOrderedBefore(temp, a[y - 1]) {
        while position > 0 && value < array[position - 1] {
            
            // Swap
            array.swapAt(position - 1, position)
            // array[position] = array[position - 1]
            
            // Move backward into sorted array one position
            position -= 1
        }
        
        array[position] = value
    }
    
    return array
}

var numberList: [Int] = [8, 2, 10, 9, 11, 1, 7, 3, 4]
insertionSort(array: numberList)
