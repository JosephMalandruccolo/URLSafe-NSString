//
//  NSString+URLSafe.h
//  CategoryBuilder
//
//  Created by Joseph Malandruccolo on 5/29/13.
//  Copyright (c) 2013 Joseph Malandruccolo. All rights reserved.
//

#import <Foundation/Foundation.h>

//  category that helps make NSString objects safe for use in a url
@interface NSString (URLSafe)

//  make any NSString safe for passing through a url by removing unsafe characters
//  optionally append a urlSafe suffix to the end of the resulting string
+ (NSString*)makeUrlSafeByRemovingFrom:(NSString*)str;
+ (NSString*)makeUrlSafeByRemovingFrom:(NSString *)str andAppending:(NSString*)safeSuffix;


//  make any NSString safe for passing through a url by replacing unsafe characters with a safe string
//  optionally append a urlSafe suffix to the end of the resulting string
+ (NSString*)makeUrlSafe:(NSString*)str byReplacingWith:(NSString*)safe;
+ (NSString*)makeUrlSafe:(NSString *)str byReplacingWith:(NSString *)safe andAppending:(NSString*)safeSuffix;

@end
