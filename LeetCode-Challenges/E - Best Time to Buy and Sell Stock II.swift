//
//  E - Best Time to Buy and Sell Stock II.swift
//  
//
//  Created by Audrey Welch on 2/10/20.
//

import Foundation

/*
 
 Say you have an array for which the i-th element is the price of a given stock on day i.
 
 Design an algorithm to find the maximum profit.
 You may complete as many transactions as you like
 > (i.e. buy one and sell one share of the stock multiple times)
 
 Note: You may not engage in multiple transactions at the same time
 > (i.e. you must sell the stock before you buy again)
 
 
 Example #1
 Input: [7, 1, 5, 3, 6, 4]
 Output: 7
 Explanation:
    > Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4
    > Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3
 
 Example #2
 Input: [1, 2, 3, 4, 5]
 Output: 4
 Explanation:
    > Buy on day 1 (price = 3) and sell on day 5 (price = 5), profit = 5-1 = 4
    > Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are engaging in multiple transactions at the same time. You must sell before buying again.
 
 Example #3
 Input: [7, 6, 4, 3, 1]
 Ouput: 0
 Explanation:
    > In this case, no transaction is done, i.e. max profit = 0
 
 */

// Need to buy at the lowest price, and sell at a price higher than you bought it for
// If there is no number greater than the one you bought it for, don't sell

// O(n) time complexity
// O(1) space complexity
func maxProfit(_ prices: [Int]) -> Int {
    
    var result: Int = 0
    
    // Make sure there is more than one day listed in the prices
    guard prices.count > 1 else { return 0 }
    
    // Create variable for the maximum profit and set to start at zero
    var maxProfit = 0
    
    // Loop through each element from the second to the end
    for i in 1..<prices.count {
        
        // Compare profits
        
        // Take each price subtracted by the price/day before and save that number
        let profit = prices[i] - prices[i-1]
        
        // If the number is greater than zero, add it to the current profit, and continue
        if profit > 0 {
            maxProfit += profit
        }
    }
    
    return maxProfit
    
}

var input1 = [7, 1, 5, 3, 6, 4] // 7
var input2 = [1, 2, 3, 4, 5] // 4
var input3 = [7, 6, 4, 3, 1] // 0

maxProfit(input1)
maxProfit(input2)
maxProfit(input3)

// BRUTE FORCE
// In this case, we simply calculate the profit corresponding to all the possible sets of transactions and find out the maximum profit out of them.

// Initial Thoughts
/*
 // I want to buy at the lowest number in the array
 // but only if there is a number greater than that number that comes after it
 // And then
 
 // dictionary that holds: key(profit) : value([index, index]
 // take the highest profit
 // then look for the next highest profit, but only if the value[0] is greater than the other profit's value[1]
 */

func maxProfitBruteForce(_ prices: [Int]) -> Int {
    
    // Variable holding total profit to return
    var totalProfit = 0
    
    var startRange = -1
    
    // Boolean to keep track of buying vs. selling
    var hasStock = false
    
    // We can't buy and sell with less than 2 days of data
    if prices.count < 2 { return 0 }
    
    // Loop through array
    for i in 0..<prices.count {
        
        // If we are NOT at the last element in the array
        if i < prices.count - 1 {
            
            // If we are increasing in price
            if prices[i] <= prices[i + 1] {
                
                // If we don't have stock yet, it's time to BUY
                if !hasStock {
                    startRange = i
                    hasStock = true
                } else {
                    // We are holding the stock + tomorrow price is higher: HOLD
                }
                
            // Prices [i] > prices[i + 1]
            // If tomorrow's stock is lower
            } else {
                
                // if we have the stock currently
                if hasStock {
                    
                    // Time to SELL
                    totalProfit += prices[i] - prices[startRange]
                    hasStock = false
                    
                } else {
                    // Tomorrow's price is lower, but it might still come down: WAIT
                }
            }
        } else {
            // We are at the last element (Sell if you have the stock or sell yesterday
            if hasStock { // We should sell
                totalProfit += prices[i] - prices[startRange]
                hasStock = false
            }
        }
    }
    
    
    return totalProfit
    
}

maxProfitBruteForce(input1) // 7
maxProfitBruteForce(input2) // 4
maxProfitBruteForce(input3) // 0
