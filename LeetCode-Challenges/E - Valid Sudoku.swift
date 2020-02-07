//
//  E - Valid Sudoku.swift
//  
//
//  Created by Audrey Welch on 2/6/20.
//

import Foundation

/*
 
 Determine if a 9x9 Sudoku board is valid.
 Only the filled cells need to be validated according to the following rules:
 
 1. Each row must contain the digits 1-9 without repetition
 2. Each column must contain the digits 1-9 without repetition
 3. Each of the 9 3x3 sub-boxes of the grid must contain the digits 1-9 without repetition
 
 The sudoku board could be partially filled, where empty cells are filled with the character '.'
 
 Example 1:
 
 Input:
 [
   ["5","3",".",".","7",".",".",".","."],
   ["6",".",".","1","9","5",".",".","."],
   [".","9","8",".",".",".",".","6","."],
   ["8",".",".",".","6",".",".",".","3"],
   ["4",".",".","8",".","3",".",".","1"],
   ["7",".",".",".","2",".",".",".","6"],
   [".","6",".",".",".",".","2","8","."],
   [".",".",".","4","1","9",".",".","5"],
   [".",".",".",".","8",".",".","7","9"]
 ]
 
 Output: true
 
 Example 2:
 
 Input:
 [
   ["8","3",".",".","7",".",".",".","."],
   ["6",".",".","1","9","5",".",".","."],
   [".","9","8",".",".",".",".","6","."],
   ["8",".",".",".","6",".",".",".","3"],
   ["4",".",".","8",".","3",".",".","1"],
   ["7",".",".",".","2",".",".",".","6"],
   [".","6",".",".",".",".","2","8","."],
   [".",".",".","4","1","9",".",".","5"],
   [".",".",".",".","8",".",".","7","9"]
 ]
 
 Output: false
 Explanation: Same as Example 1, except with the 5 in the top left corner being
     modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.
 
 Note:
 > A sudoku board (partially filled) could be valid but is not necessarily solvable
 > Only the filled cells need to be validated according to the mentioned rules
 > The given board contain only digits 1-9 and the character '.'
 > The given board size is always 9x9
 
 */

func isValidSudoku2(_ board: [[Character]]) -> Bool {
    
    for i in 0..<9 {
        
        // Check digits in row #i:
        
        // Make a new array from horizontal arrays that filters out the periods
        let rowDigits = board[i].filter { $0 != "." }
        
        // Turning the array into a set ensures there are no duplicates
        // Compare the filtered array with the set that has taken out duplicates
        // If they are not the same size, it means there are duplicates
        if rowDigits.count != Set(rowDigits).count {
            return false
        }
        
        // Check digits in column #i:
        
        // Make a new array from the array[i] each time that filters out periods
        let columnDigits = board.map { $0[i] }.filter { $0 != "." }
        
        if columnDigits.count != Set(columnDigits).count {
            return false
        }
        
        // Check digits in block #i:
        
        // Find starting row and column of each block
        let startingRow = 3 * (i / 3)
        let startingColumn = 3 * (i % 3)
        
        // Make a new array of digits from the block, filtering out periods
        let blockDigits = board[startingRow..<startingRow + 3].flatMap { $0[startingColumn..<startingColumn + 3]}
            .filter { $0 != "." }
        
        if blockDigits.count != Set(blockDigits).count {
            return false
        }
        
    }
    
    return true
}

var boardInputTrueChars: [[Character]] =
[
  ["5","3",".",".","7",".",".",".","."],
  ["6",".",".","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]
]

var boardInputFalseChars: [[Character]] =
[
  ["8","3",".",".","7",".",".",".","."],
  ["6",".",".","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]
]

isValidSudoku2(boardInputTrueChars)
isValidSudoku2(boardInputFalseChars)

// First Attempt:
// BRUTE-FORCE SOLUTION
func isValidSudoku(_ board: [[String]]) -> Bool {
    
    var result: Bool = true
    
    // HORIZONTAL
    // Loop through each array
    // Ignore periods
    // Check that there are no repeating strings
    
    // Create a dictionary that will hold the string in the sudoku board
    // and a bool whether or not it is in the board
    var dict: [String: Bool] = [:]
    
    for array in board {
        
        // Clear the dictionary for the next array
        dict = [:]
        
        for element in array {
            
            // Ignore periods
            if element != "." {
                
                // If the element is already in the dictionary
                if dict[element] != nil {
                    result = false
                    return result
                    
                // Otherwise, add the element to the dictionary
                } else {
                    dict[element] = true
                }
            }
  
        }
    }
    
    // VERTICAL
    
    // Loop through 0..<9 for the rows (x) - this stays at 0, then stays at 1, etc.
    // Loop through 0..<9 for the columns (y)
    // [0][0] -> [1][0] -> [2][0] first my y stays the same and I am looping through my x
    // [1][1] -> [1][1] -> [1][2] second loop
    // Ignore periods
    // Check that there are no repeating strings
    
    for y in 0..<9 {
        
        // Clear the dictionary for the next column
        dict = [:]
        
        for x in 0..<9 {
            
            var currentElement = board[x][y]
            
            if currentElement != "." {
                
                if dict[currentElement] != nil {
                    result = false
                    return result
                } else {
                    dict[currentElement] = true
                }
                
            }
        }
    }
    
    // SUBGRID
    // Loop through board from board[0] - board[2]
    // Then loop through each item in those arrays from array[0] - array[2]
    // [0][0] [0][1] [0][2]
    // [1][0] [1][1] [1][2]
    // [2][0] [2][1] [2][2]
    // Loop through 0..<9 for the x position
    // Then 3 loops for y position
    // 0 1 2
    // 3 4 5
    // 6 7 8
    
    // Clear dictionary before subgrids
    dict = [:]
    
    for x in 0..<9 {
        for y in 0..<3 {
            
            // Save the element that is at the coordinates
            var currentElement = board[x][y]
            
            // Ignore the periods and if the dictionary doesn't contain that element
            if currentElement != "." && dict[currentElement] != nil {
                // Return false b/c the element is already in the dictionary
                // indicating a repeat
                result = false
                return result
                
            // Otherwise, add the element to the dictionary
            } else if currentElement != "." && dict[currentElement] == nil {
                dict[currentElement] = true
            }
            
            // Once a full subgrid has been completed, clear the dictionary
            if x == 2 && y == 2 || x == 5 && y == 2 || x == 8 && y == 2 {
                dict = [:]
            }
        }
    }
    
    for x in 0..<9 {
        for y in 3..<6 {
            
            // Save the element that is at the coordinates
            var currentElement = board[x][y]
            
            // Ignore the periods and if the dictionary doesn't contain that element
            if currentElement != "." && dict[currentElement] != nil {
                // Return false b/c the element is already in the dictionary
                // indicating a repeat
                result = false
                return result
                
            // Otherwise, add the element to the dictionary
            } else if currentElement != "." && dict[currentElement] == nil {
                dict[currentElement] = true
            }
            
            // Once a full subgrid has been completed, clear the dictionary
            if x == 2 && y == 5 || x == 5 && y == 5 || x == 8 && y == 5 {
                dict = [:]
            }
        }
    }
    
    for x in 0..<9 {
        for y in 6..<9 {
            
            // Save the element that is at the coordinates
            var currentElement = board[x][y]
            
            // Ignore the periods and if the dictionary doesn't contain that element
            if currentElement != "." && dict[currentElement] != nil {
                // Return false b/c the element is already in the dictionary
                // indicating a repeat
                result = false
                return result
                
            // Otherwise, add the element to the dictionary
            } else if currentElement != "." && dict[currentElement] == nil {
                dict[currentElement] = true
            }
            
            // Once a full subgrid has been completed, clear the dictionary
            if x == 2 && y == 8 || x == 5 && y == 8 || x == 8 && y == 8 {
                dict = [:]
            }
        }
    }
    
    return result
}

var boardInputTrue =
[
  ["5","3",".",".","7",".",".",".","."],
  ["6",".",".","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]
]

var boardInputFalse =
[
  ["8","3",".",".","7",".",".",".","."],
  ["6",".",".","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]
]

isValidSudoku(boardInputTrue)
isValidSudoku(boardInputFalse)
