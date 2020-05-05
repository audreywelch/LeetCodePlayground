//
//  M - Clone Graph.swift
//  
//
//  Created by Audrey Welch on 5/4/20.
//

import Foundation

/*
 
 
 Given a reference of a node in a connected, undirected (edges are like a 2-way street) graph.
 
 Return a deep copy (clone) of the graph.
 
 Each node in the graph contains a val (int) and a list (List[Node]) of its neighbors
 
 class Node {
    public var val: int
    public var neighbors: [Node]
 }
 
 Test case format:
    > For simplicity sake, each node's value is the same as the node's index (1-indexed). For example, the first node with val = 1, the second node with val = 2, and so on. The graph is represented in the test case using an adjacency list.
 
    > Adjacency list is a collection of unordered lists used to represent a finite graph. Each list describes the set of neighbors of a node in the graph.
 
    > The given node will always be the first node with val = 1. You must return the copy of the given node as a reference to the cloned graph.
 
 Example 1:
 
 
    1 ------------- 2        |1| ------------- |2|
    |               |         |                 |
    |   original    |         |       clone     |
    |               |         | [nodes are new, |
    |               |         |   graph looks   |
    |               |         |     the same    |
    4 ------------- 3        |4| ------------- |3|
 
    > Input: adjList = [[2, 4], [1, 3], [2, 4], [1, 3]]
    > Output: [[2, 4], [1, 3], [2, 4], [1, 3]]
    > Explanation: There are 4 nodes in the graph
        1st node (val = 1)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
        2nd node (val = 2)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).
        3rd node (val = 3)'s neighbors are 2nd node (val = 2) and 4th node (val = 4).
        4th node (val = 4)'s neighbors are 1st node (val = 1) and 3rd node (val = 3).
 
 Example 2:
 
    |1|
 
    > Input: adjList = [[]]
    > Output: [[]]
    > Explanation: Note that the input contains one empty list. The graph consists of only one node with val = 1 and it does not have any neighbors.
 
 Example 3:
 
    > Input: adjList = []
    > Output: []
    > Explanation: This is an empty graph, it does not have any nodes.
 
 Example 4:
 
    |1| --------- |2|
    
    > Input: adjList = [[2], [1]]
    > Output: [[2], [1]]
 
 Constraints:
    > 1 <= Node.val <= 100
    > Node.val is unique for each node.
    > Number of nodes will not exceed 100
    > There is no repeated edges and no self-loops in the graph.
    > The graph is connected and all nodes can be visited starting from the given node.
 
 
 */

// Definition for a node
public class Node {
    public var val: Int
    public var neighbors: [Node?]
    
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

// Time: O(n) - we process each node exactly once
// DFS
func cloneGraph(_ node: Node?) -> Node? {
    
    /*
     
     Algorithm:
     
     1. Start traversing the graph from the given node
     
     2. Make a hash map called visited that stores visited nodes as keys, and a clone of that node as its value.
     
        A ---- B
     
        We go from A to B since B is the neighbor of A.
        Before moving to B, we create a clone of A and put it in the visited hashmap
     
        A : A`
     
        Move to B
     
        B sees A as its neighbor, but before moving to A, it checks for A in visited.
     
     3. If we don't find the node in the visited hash map, create a copy of it and put it in the hash map.
        It's important to create a copy of the node and add it to the hash map before entering recursion.
     
        cloneNode = Node(node.val, [])
        visited[node] = cloneNode
     
     4. Make a recursive call for the neighbors of the node.
        > Pay attention to how many recursion calls we will be making for any given node. For a given node the number of recursive calls would be equal to the number of its neighbors. Each recursive call made would return the clone of a neighbor. We will prepare the list of these clones returned and put into neighbors of clone node which we had created earlier. This way we will have cloned the given node and it's neighbors.
     
     */
    
    var visitedDict: [Int: Node] = [:]
    
    guard let node = node else { return nil }
    
    // If already in the dictionary, return it
    if let clonedNode = visitedDict[node.val] {
        return clonedNode
        
    // If it's not in the dictionary, add it
    // and create a new node clone to store as it's value
    } else {
        visitedDict[node.val] = Node(node.val)
    }
    
    for eachNeighbor in node.neighbors {
         
        // If the dictionary has the node of these neighbors we're iterating through (assign var for value/clone)
        // and recurse using the neighbor we're looking at to get it's cloned neighbor
        if let clonedNode = visitedDict[node.val], let clonedNeighbor = cloneGraph(eachNeighbor) {
            
            // Each recursive call returns the clone of a neighbor
            // Add that neighbor to the clonedNode we created earlier
            clonedNode.neighbors.append(clonedNeighbor)
            
            // Add the clone to the dictionary
            visitedDict[node.val] = clonedNode
            
            // Add the cloned neighbor to the dictionary
            visitedDict[clonedNeighbor.val] = clonedNeighbor
            
        }
    }
    return visitedDict[node.val]
}



// BFS
// Time: O(n)
// Space: O(n)

/*
 
 Algorithm

    1. We will use a hash map to store the reference of the copy of all the nodes that have already been visited and copied. The key for the hash map would be the node of the original graph and corresponding value would be the corresponding cloned node of the cloned graph. The visited is used to prevent cycles and get the cloned copy of a node.

    2. Add the first node to the queue. Clone the first node and add it to visited hash map.

    3. Do the BFS traversal.

        > Pop a node from the front of the queue.
        > Visit all the neighbors of this node.
        > If any of the neighbors was already visited then it must be present in the visited dictionary. Get the clone of this neighbor from visited in that case.
        > Otherwise, create a clone and store in the visited.
        > Add the clones of the neighbors to the corresponding list of the clone node.
 */
class Solution {
    
    // Dictionary storing nodes and clones
    var visited = [Int: Node]()
    
    func cloneGraph(_ node: Node?) -> Node? {
        
        guard let node = node else {
            return nil
        }
                        
        var queue = [Node]()
        queue.append(node)
        
        while !queue.isEmpty {
            
            let topNode = queue.removeFirst()
            
            // if the top node is not in the dictionary, add it with a new clone
            if visited[topNode.val] == nil {
                visited[topNode.val] = Node(topNode.val)
            }
            
            // Loop through each of that node's neighbors
            for neighbor in topNode.neighbors where neighbor != nil {
                
                // If the neighbor has NOT been visited, add it to the queue
                if visited[neighbor!.val] == nil {
                    queue.append(neighbor!)
                    
                    // and add it to the dictionary with a new clone
                    visited[neighbor!.val] = Node(neighbor!.val)
                }
                
                // If the top node has already been visited
                // and the neighbor has been visited
                if let topNode = visited[topNode.val], let neighbor = visited[neighbor!.val] {
                    
                    // Add the neighbors to the top node
                    topNode.neighbors.append(neighbor)
                    
                    // Add to the dictionary (updating it now that it has neighbors
                    visited[topNode.val] = topNode
                    visited[neighbor.val] = neighbor
                }
            }
        }
        
        return visited[node.val]
    }
}
