//
//  main.m
//  Names
//
//  Created by brandon kehl on 11/9/15.
//  Copyright © 2015 brandonkehl. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Read in a file as a huge string(ignoring the possibilty of an error)
        NSString *wordString=
                    [NSString stringWithContentsOfFile:@"/usr/share/dict/words"
                                              encoding:NSUTF8StringEncoding
                                                 error:NULL];
        
        NSString *nameString =
                        [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames"
                                                    encoding:NSUTF8StringEncoding
                                                     error:NULL];
        // Break it into an array of strings
        NSArray *words = [wordString componentsSeparatedByString:@"\n"];
        NSArray *names = [nameString componentsSeparatedByString:@"\n"];
        
       
        
        // Go through the array one string at a time
        for (NSString *w in words) {
           
            for(NSString *n in names){
                
                NSComparisonResult result = [w localizedCaseInsensitiveCompare:n]; // Compares words & names 
                
                if (result == NSOrderedSame) { // NSOrderedSame = operands are equal
                    
                    
                    NSRange r = [n rangeOfString:w];
                    
                    
                    if(r.location == NSNotFound){
                   
                        
                        NSLog(@"%@ and %@ are equal", n, w);
                    
                    
                    }
                    
                }
            
            }
            
        }
        
        
    } return 0;
    
}
