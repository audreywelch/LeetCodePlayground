//
//  M - Minimum Path Sum.swift
//  
//
//  Created by Audrey Welch on 2/24/20.
//

import Foundation

/*
 
 Given a 'm x n' grid filled with non-negative numbers, find a path from top left to bottom right
 which minimizes the sum of all numbers along its path.
 
 Note: You can only move either down or right at any point in time.
 
 Example
 > Input:
 [
   [1,3,1],
   [1,5,1],
   [4,2,1]
 ]
 
 > Output: 7
 > Explanation: Because the path 1→3→1→1→1 minimizes the sum.
 
 
 */

// O(n*m)
// This approach starts at the last number and then calculates the sum of what each step would cost
// choosing the lowest sum along the way, so that when we get back to (0,0)
// that holds the smallest sum
func minPathSum1(_ grid: [[Int]]) -> Int {
    
    // width of grid
    var width = grid.count
    
    // height of grid
    var height = grid[0].count
    
    // check for invalid grid
    if width <= 0 || height <= 0 { return 0 }
    
    // Create an empty grid of the same size
    var costGrid = [[Int]](repeating: [Int](repeating: 0, count: height), count: width)
    
    // Set the LAST item in the grid into the costGrid
    costGrid[width - 1][height - 1] = grid[width - 1][height - 1]
    
    var x: Int = width - 2
    
    // Last column
    // Working through rows backwards from the last one until all the way to 0
    while x >= 0 {
        
        /*
            * currently equal to 1 in grid
         
                0 0 0
                0 0 *
                0 0 1
         */
        
        // Set the previous row, last column to be equal to
        // the number entered there in the grid +
        // the "target" we are trying to get to
        costGrid[x][height - 1] = costGrid[x + 1][height - 1] + grid[x][height - 1]
        
        // Move x to one previous row
        x -= 1
    }
    
    var y: Int = height - 2
    
    
    while y >= 0 {
        
        /*
            * currently equal to 2 in grid
         
                0 0 3
                0 0 2
                0 * 1
         */
        
        // Set the last row, previous column to be equal to
        // the number entered there in the grid +
        // the "target' we are trying to get to
        costGrid[width - 1][y] = costGrid[width - 1][y + 1] + grid[width - 1][y]
        
        // Move y to one previous column
        y -= 1
        
    }
    
    /*
            0 0 3
            0 0 2
            7 3 1
     */
    
    // Reset the y to the second to last column
    y = height - 2
    
    while y >= 0 {
        
        // Reset the x to the second to last row
        x = width - 2
        
        while x >= 0 {
            
            /*
                * currently equal to 5 in grid
             
                    0  0  3     -> 0  0  3
                    0  *  2*    -> 0  7  2
                    7  3* 1     -> 7  3  1
             */
            
            // Compare the two possible previous steps
            // Whichever sum is lower will be the step we decide to take
            // Add that sum to the number at this location
            costGrid[x][y] = min(costGrid[x + 1][y], costGrid[x][y + 1]) + grid[x][y]
            
            // Move backwards one row
            x -= 1
        }
        
        // Move backwards one column
        y -= 1
    }
    
    // Return the total sum that is at (0,0)
    return costGrid[0][0]
    
}

var input =  [
    [1,3,1],
    [1,5,1],
    [4,2,1]
]

minPathSum1(input) // 7

/*
SOLUTION EXPLANATIONS
 
Approach 1: Brute Force

   > This approach involves recursion. For each element, we consider two paths, rightwards or downwards, and find the minimum sum out of those two. It specifies whether we need to take a right step or downward step to minimize the sum.

   > Time: O(n^(m+n)) - for every move, we have at most 2 options
   > Space: O(m + n) - Recursion of depth m + n

   func calculate(grid: [[Int]], i: Int, j: Int) -> Int {
       if (i == grid.length || j == grid[0].length) {
           return Integer.MAX_VALUE;
       }

       if (i == grid.length - 1 && j == grid[0].length - 1) {
           return grid[i][j];
       }

       return grid[i][j] + Math.min(calculate(grid, i + 1, j), calculate(grid, i, j + 1));
   }

   func minPathSum(_ grid: [[Int]]) -> Int {
       return calculate(grid, 0, 0);
   }


Approach 2: Dynamic Programming 2D
[ my approach ]

   > We use an extra matrix `dp` of the same size as the original matrix. In this matrix, dp(i, j) represents the minimum
       sum of the path from the index (i, j) to the bottom rightmost element.
   > We start by initializing the bottom rightmost element of dp as the last element of the given matrix.
       Then for each element starting from the bottom right, we traverse backwards and fill in the matrix with the required
       minimum sums. Now, we need to note that at every elmenet, we can eitehr move rightwards or downwards.
       Therefore, for filling in the min sum, we use the equation:
       
       dp(i, j) = grid(i, j) + min(dp(i + 1, j), dp(i, j + 1))


*/
