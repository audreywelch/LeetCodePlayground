//
//  E - Validate IP Address.swift
//  
//
//  Created by Audrey Welch on 2/5/20.
//

import Foundation

/*
 
 Validate IP Address

 Validate an IP address (IPv4). An address is valid if and only if it is in the form "X.X.X.X", where each X is a number from 0 to 255.

 For example, "12.34.5.6", "0.23.25.0", and "255.255.255.255" are valid IP addresses, while "12.34.56.oops", "1.2.3.4.5", and "123.235.153.425" are invalid IP addresses.

 Examples:

 ip = '192.168.0.1'
 output: true

 ip = '0.0.0.0'
 output: true

 ip = '123.24.59.99'
 output: true

 ip = '192.168.123.456'
 output: false
 
 */

func validateIPAddress(address: String) -> Bool {
    
    var resultBool: Bool = true
  
    // Separate the String by the periods - returns array of strings
    //let addressArray = address.components(separatedBy: ".")
    let addressArray = address.split(separator: ".")
  
    // Make sure the count is only four numbers
    if !(addressArray.count == 4) {
        
        print("Too many numbers in the array")
        resultBool = false
    }
  
    for eachElement in addressArray {
    
        // Convert each element to an integer
        guard let elementInt = Int(eachElement) else {
            
            // If it's not a valid int - return false
            print("\(eachElement) is not an integer")
            resultBool = false
            
            return resultBool
        }
        
        // Check if it's greater than or equal to 0 OR less than 255
        if !(elementInt >= 0) || !(elementInt <= 255) {
            
            // If not, return false
            print("\(eachElement) is not between 0 and 255")
            resultBool = false
            
        }
    }

    return resultBool
}

validateIPAddress(address: "192.168.0.1") // true
validateIPAddress(address: "0.0.0.0") // true
validateIPAddress(address: "192.168.123.456") // false
validateIPAddress(address: "008.123.34.56") // true
