//
//  M - Word Search.swift
//  
//
//  Created by Audrey Welch on 5/19/20.
//

import Foundation

/*
 
 Given a 2D board and a word, find if the word exists in the grid.
 
 The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same ltter may not be used more than once.
 
 Example:
 
 board =
 [
   ['A','B','C','E'],
   ['S','F','C','S'],
   ['A','D','E','E']
 ]
 
 Given word = "ABCCED", return true
 Given word = "SEE", return true
 Given word = "ABCB", return false
 
 Constraints:
    > board and word consts only of lowercase and uppercase English letters
    > 1 <= board.length <= 200
    > 1 <= board[i].length <= 200
    > 1 <= word.length <= 10^3
 
 */

// PLAN

// Loop through the letters in the word
// Have a starting point in the board - board[row][column]
// Iterate through the board,
// Once I hit a match: i == board[row][column],
// Trigger a DFS to find a match
// Once I have a match, mark the spot as visited (change it to a "."?),
// If no match is found, return false

/*
 [
   ['.','B','C','E'],
   ['S','F','C','S'],
   ['A','D','E','E']
 ]
 
 Loop through the letters in the matrix
 If there's a match,
 run the search func:
 
 First mark the current as visited
 [0][0] == visited, == '.'
 
 Then explore the 4 neighbor directions
 via recursive DFS
 for each of these options:
 right // if array[0 + 1][0] ==
 down // if array[0][0 + 1]
 left // if array[0][0 - 1]
 up // if array[0 - 1][0]
 ... call the search function again
 
 */

func exist(_ board: [[Character]], _ word: String) -> Bool {
    
    let rows = board.count
    let columns = board[0].count
    
    for row in 0..<rows {
        
        for col in 0..<columns {
            
            // If there is a first character in the word
            if let first = word.first {
                
                // and if the characters match
                if board[row][col] == first {
                
                    // If a search of its neighbors returns true - return true
                    if search(row: row, col: col, indexOfWord: 0, word: word, board: board) {
                        return true
                    }
                }
            }
        }
    }

    // Return false if no match was found
    return false
}

func search(row: Int, col: Int, indexOfWord: Int, word: String, board: [[Character]]) -> Bool {
    
    // If we are at at the end of the word, we can return true
    if indexOfWord >= word.count {
        return true
    }
    
    var hasValidPath: Bool = false
    var mutableBoard = board
    let rows = mutableBoard.count
    let columns = mutableBoard[0].count

    // Base Case to stop recursive looking if we've reached the end of the board
    if row < 0 || row >= rows || col < 0 || col >= columns {
        return false
    }
    
    // Base case to stop recursive looking if the characters don't match
    let currentChar = word[word.index(word.startIndex, offsetBy: indexOfWord)]
    if board[row][col] != currentChar {
        return false
    }
    
    // Mark current spot as visited while saving its original value
    let currentVisitedLetter = mutableBoard[row][col]
    mutableBoard[row][col] = "."
    
    // Search all directions from current spot
    hasValidPath =  search(row: row + 1, col: col, indexOfWord: indexOfWord + 1, word: word, board: mutableBoard) || // Down
                    search(row: row, col: col + 1, indexOfWord: indexOfWord + 1, word: word, board: mutableBoard) || // Right
                    search(row: row, col: col - 1, indexOfWord: indexOfWord + 1, word: word, board: mutableBoard) || // Left
                    search(row: row - 1, col: col, indexOfWord: indexOfWord + 1, word: word, board: mutableBoard)    // Up
    
    // Reset spot as unvisited after each DFS, so that it can be completed again
    mutableBoard[row][col] = currentVisitedLetter
    
    return hasValidPath
}

var board: [[Character]] =
    [
        ["A","B","C","E"],
        ["S","F","C","S"],
        ["A","D","E","E"]
]

exist(board, "ABCCED") // true
exist(board, "SEE") // true
exist(board, "ABCB") // false
