//
//  M - Number of Islands.swift
//  
//
//  Created by Audrey Welch on 2/25/20.
//

import Foundation

/*
 
 Given a 2D grid map of '1's (land) and '0's (water), count the number of islands.
 An island is surrounded by water and is formed by connecting adjacent lands
 horizontally or vertically. You may assume all four edges of the grid are all
 surrounded by water.
 
 Example 1:
 > Input:
            11110
            11010
            11000
            00000
 
 > Output: 1
 
 Example 2:
 > Input:
            11000
            11000
            00100
            00011
 
 > Output: 3
 
 */

/*
 
 Approach #1: Depth-First Search
 
    Intuition:
        > Treat the 2D grid map as an undirected graph and there is an edge between two horizontally or vertically adjacent nodes of value '1'.
 
    Algorithm:
        > Linearly scan the 2D grid map. If a node contains a '1', then it is a root node that triggers a Depth First Search. During DFS, every visited node should be set as '0' to mark as visited node.
 
        > Count the number of root nodes that trigger DFS, this number would be the number of islands, since each DFS starting at some root identifies an island.
 
    Time:
        > O(m x n) where m is the number of rows and n is the number of columns
 
    Space:
        > Worst case: O(m x n) in case the grid map is filled with islands where DFS goes by m x n deep
 
 */

func dfs(_ grid: inout [[Character]], _ row: Int, _ column: Int) {
    
    var numberOfRows = grid.count
    var numberOfColumns = grid[0].count
    
    // Stop the depth first search if:
    // We are outside the grid (less than rows or columns),
    // We have gone through all rows,
    // We have gone through all columns,
    // Or if we have hit a 0
    if row < 0 || column < 0 || row >= numberOfRows || column >= numberOfColumns || grid[row][column] == "0" {
        return
    }
    
    // Set the current grid node to 0 to mark as visited
    grid[row][column] = "0"
    
    // Search above node
    dfs(&grid, row - 1, column)
    
    // Search below node
    dfs(&grid, row + 1, column)
    
    // Search to the left of node
    dfs(&grid, row, column - 1)
    
    // Search to the right of node
    dfs(&grid, row, column + 1)
    
    
}

func numIslands(_ grid: [[Character]]) -> Int {
    
    var grid = grid
    
    // Check that the grid is valid
    if grid == nil || grid.count == 0 {
        return 0
    }
    
    // Find the count of rows & columns in the grid
    var numberOfRows = grid.count
    var numberOfColumns = grid[0].count
    
    // Variable to hold the number of islands
    var numberOfIslands = 0
    
    // Loop through each row ...
    for row in 0..<numberOfRows {
        
        // ... and each column
        for column in 0..<numberOfColumns {
            
            // If the element is equal to 1, increase the count of the islands
            if grid[row][column] == "1" {
                numberOfIslands += 1
                
                // Perform a depth first search to visit all 1s in the island
                // and mark them as visited
                dfs(&grid, row, column)
            }
        }
    }
    
    return numberOfIslands
}

var input1: [[Character]] = [["1", "1", "1", "1", "0"],
                             ["1", "1", "0", "1", "0"],
                             ["1", "1", "0", "0", "0"],
                             ["0", "0", "0", "0", "0"]]

var input2: [[Character]] = [["1", "1", "0", "0", "0"],
                             ["1", "1", "0", "0", "0"],
                             ["0", "0", "1", "0", "0"],
                             ["0", "0", "0", "1", "1"]]

numIslands(input1) // 1
numIslands(input2) // 3


/*
 
 Approach #2: Breadth First Search
 
    Algorithm
        > Linear scan the 2D grid map, if a node contains a '1', then it is a root node that triggers a Breadth First Search. Put it into a queue and set its value as '0' to mark as visited node. Iteratively search the neighbors of enqueued nodes until the queue becomes empty.
 
    Time
        > O(m x n) where m is the number of rows and n is the number of columns
 
    Space
        > O(min(m, n)) because in worst case where the grid is filled with lands, the size of the queue can grow up to whichever is smaller - min(m, n)
 
 */

// Queue
struct Queue<T> {
    
    var array = [T]()
    
    // Computed property to return the count of the queue
    var count: Int {
        return array.count
    }
    
    // Computed property to return if the queue is empty
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    // Computed property to return the first item in the queue
    var front: T? {
        return array.first
    }
    
    // Enqueue adds an element to the end of the queue
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    // Dequeue returns the first element in the queue
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
}

func numIslandsBFS(_ grid: [[Character]]) -> Int {
    
    var grid = grid
    
    let numberOfRows = grid.count
    guard numberOfRows > 0 else { return 0 } // Exception case
    
    let numberOfColumns = grid[0].count
    
    // Instantiate a queue that will hold an array of Ints
    var queue = Queue<[Int]>()
    
    var numberOfIslands = 0
    
    for rowIndex in 0..<numberOfRows {
        for columnIndex in 0..<numberOfColumns {
            
            if grid[rowIndex][columnIndex] == "1" {
                queue.enqueue([rowIndex, columnIndex])
                numberOfIslands += 1
                
                // While there are still elements to dequeue
                // Assign neighbor to the dequeued last element
                while let neighbor = queue.dequeue() {
                    
                    // Assign the rows and columns
                    let row = neighbor[0]
                    let col = neighbor[1]
                    
                    if row - 1 >= 0 && grid[row - 1][col] == "1" {
                        queue.enqueue([row - 1, col])
                        grid[row - 1][col] = "0"
                    }
                    
                    if row + 1 < numberOfRows && grid[row + 1][col] == "1" {
                        queue.enqueue([row + 1, col])
                        grid[row + 1][col] = "0"
                    }
                    
                    if col - 1 >= 0 && grid[row][col - 1] == "1" {
                        queue.enqueue([row, col - 1])
                        grid[row][col - 1] = "0"
                    }
                    
                    if col + 1 < numberOfColumns && grid[row][col + 1] == "1" {
                        queue.enqueue([row, col + 1])
                        grid[row][col + 1] = "0"
                    }
                }
            }
        }
    }
    
    return numberOfIslands

}

numIslandsBFS(input1) // 1
numIslandsBFS(input2) // 3
