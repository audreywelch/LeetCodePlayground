//
//  M - Jerrick's Interview Question.swift
//  
//
//  Created by Audrey Welch on 2/13/20.
//

import Foundation

/*
 
 Write a function that calculates the total % of a video watched by a single user.
 
 You are given the following parameters:
 1) Unordered list of tuples, in which the first element is the start time and the second one is the end time. These represent different segments of the video that have been watched.
 2) Total duration of the video.
 
 */

typealias Segment = (startTime: Double, endTime: Double)

func percentWatched(segments: [Segment], totalDuration: Double) -> Double {
    
    var percentWatched: Double = 0.0
    
    /*
     
     PLAN
     
     1. I need to calculate duration of each segment: secondTuple - firstTuple = segmentDuration
     
        loop through tuples in segments
        take secondTuple - firstTuple = segmentDuration
        totalDurationWatched += segmentDuration
     
     2. Add together each segmentDuration - totalDurationWatched
     
        takes place in for-loop: totalDurationWatched += segmentDuration
     
     3. Get the percentage of totalDurationWatched to totalDuration: totalDurationWatched / totalDuration * 100
     
     Edge Cases:
        > Check that there is at least 1 segment in the list - if not, return 0%
        > End time must be greater than start time
        > totalDuration must be greater than totalDurationWatched
        > What if there is overlapping time?
            .. I can only know if this is true if the array is sorted by start times
            .. then each time through the loop I can save the previousEndTime
            .. startTime needs to be greater than previousEndTime
            .. if startTime < previousEndTime
            .. the difference needs to be subtracted from that segmentDuration b/c it was already counted previously
     
            [(5, 10), (25, 45), (7, 30)] -> [(5, 10), (7, 30), (25, 45)]
     
            5 + 20 + 23 = 48
            5 + (23 - 3 = 20) + (20 - 5 = 15) = 40
     
     */
    
    // Variable holds the total duration of the video watched by user
    var totalDurationWatched: Double = 0.0
    
    // Variable holds previous end time in order to check for overlaps
    var previousEndTime: Double = 0.0
    
    let sortedSegments = segments.sorted(by: { $0.startTime < $1.startTime } )
        
    // Loop through the tuples/sets in the list of segments
    for (startTime, endTime) in sortedSegments {
        
        // Start time needs to be greater than previousEndTime
        // If it's not greater...
        if startTime < previousEndTime {
            
            // Find the difference of overlapping watch time
            let difference = previousEndTime - startTime
            
            // Calculate duration of each segment and subtract the difference
            let segmentDuration = (endTime - startTime) - difference
                   
            // Add together each segmentDuration as we go
            totalDurationWatched += segmentDuration
            
        } else {
            
            let segmentDuration = endTime - startTime
            
            totalDurationWatched += segmentDuration
            
        }

        // Save the current endTime as the previousEndTime to be used in next iteration of loop
        previousEndTime = endTime
        
    }
    
    // Calculate percentage
    percentWatched = (totalDurationWatched / totalDuration) * 100
    
    return percentWatched
}

var segments: [Segment] = [(0.0, 1.0), (1.5, 2.5), (2.75, 5.0), (7.5, 9.5)] // 6.25 / 10
var overlappedSegments: [Segment] = [(5, 10), (25, 45), (7, 30)] // 40
var totalDuration: Double = 10.0

percentWatched(segments: segments, totalDuration: totalDuration) // 62.5%
percentWatched(segments: overlappedSegments, totalDuration: 100) // 40%
