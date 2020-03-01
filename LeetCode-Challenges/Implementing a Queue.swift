//
//  Implementing a Queue.swift
//  
//
//  Created by Audrey Welch on 3/1/20.
//

import Foundation

/*
 
 DATA STRUCTURES: Queues

 Objective
     -> to understand how queues work and what some of their pros and cons are.

 What is a queue data structure?
     - queue = line
     - items that come into a queue get added to the back - they wait in the queue until everything in front of them is removed, which is called FIFO

 First In First Out (FIFO)

     class Queue:
         self.size = 0
         self.storage = storage_data_structure

 Questions to ask yourself:
     - What's the opposite of FIFO ordering? What data structures exhibit this ordering?
     - What data structures would you use to implement a queue?
     - When is FIFO ordering useful? When is it not?

 Pros & Cons of Queues
     - Pros:
         .. Queues are simple and intuitive to use and implement
         .. They can be used to SERIALIZE data coming in from multiple sources
     - Con:
         .. Are not general-purpose at all in and of themselves
 
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
