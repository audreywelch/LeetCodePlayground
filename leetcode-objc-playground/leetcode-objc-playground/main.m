//
//  main.m
//  leetcode-objc-playground
//
//  Created by Audrey Welch on 6/11/20.
//  Copyright © 2020 Audrey Welch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        BOOL isPalindrome = YES;

        NSArray *array = @[@"a", @"b", @"t", @"b", @"a"];
        NSInteger count = array.count;
        NSInteger halfLength = (count / 2);
        
        for (int i = 0; i < halfLength; i++) {
            
            if (array[i] != array[count - i - 1]) {
                isPalindrome = NO;
                break;
            }
        }
        
        NSLog(@"isPalindrome: %@", isPalindrome ? @"yes" : @"no");
    }
    return 0;
}
