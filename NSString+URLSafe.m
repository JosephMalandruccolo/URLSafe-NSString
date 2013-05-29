//
//  NSString+URLSafe.m
//  CategoryBuilder
//
//  Created by Joseph Malandruccolo on 5/29/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import "NSString+URLSafe.h"

@implementation NSString (URLSafe)


#pragma mark - common set of dangerous characters
+ (NSCharacterSet*)dangerousCharacters
{
    NSCharacterSet *dangerousChars = [NSCharacterSet characterSetWithCharactersInString:@"&$+,/:;'=?.@ ^[]{}|#%~<>*"];
    return dangerousChars;
}


#pragma mark - remove dangerous characters
+ (NSString*)makeUrlSafeByRemovingFrom:(NSString *)str
{
    return [self makeUrlSafe:str byReplacingWith:@""];
}


+ (NSString*)makeUrlSafeByRemovingFrom:(NSString *)str andAppending:(NSString *)safeSuffix
{
    NSMutableString *safeResult = [[NSMutableString alloc] initWithCapacity:(str.length + safeSuffix.length)];
    [safeResult appendString:[self makeUrlSafeByRemovingFrom:str]];
    [safeResult appendString:safeSuffix];
    
    return [NSString stringWithString:safeResult];
}


#pragma mark - replace dangerous characters
+ (NSString*)makeUrlSafe:(NSString *)str byReplacingWith:(NSString *)safe
{
    NSMutableString *safeString = [[NSMutableString alloc] initWithCapacity:str.length];
    NSCharacterSet *dangerouschars = [self dangerousCharacters];
    
    for (NSInteger charIndex = 0; charIndex < str.length; charIndex++) {
        if (![dangerouschars characterIsMember:[str characterAtIndex:charIndex]]) {
            [safeString appendString:[NSString stringWithFormat:@"%C", [str characterAtIndex:charIndex]]];
        }
        else {
            [safeString appendString:safe];
        }
    }
    
    return [NSString stringWithString:safeString];
}


+ (NSString*)makeUrlSafe:(NSString *)str byReplacingWith:(NSString *)safe andAppending:(NSString *)safeSuffix
{
    NSMutableString *safeResult = [[NSMutableString alloc] initWithCapacity:(str.length + safeSuffix.length)];
    [safeResult appendString:[self makeUrlSafe:str byReplacingWith:safe]];
    [safeResult appendString:safeSuffix];
    
    return [NSString stringWithString:safeResult];
}

@end
