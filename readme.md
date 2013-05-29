NSString+URLSafe
===========

Easy conversion of NSString into a format that is safe to include in a URL
Great for adding an NSString as a parameter to an API call


Public API
===========

//  make any NSString safe for passing through a url by removing unsafe characters  
//  optionally append a urlSafe suffix to the end of the resulting string

  `+ (NSString*)makeUrlSafeByRemovingFrom:(NSString*)str;`
  `+ (NSString*)makeUrlSafeByRemovingFrom:(NSString *)str andAppending:(NSString*)safeSuffix;`


//  make any NSString safe for passing through a url by replacing unsafe characters with a safe string  
//  optionally append a urlSafe suffix to the end of the resulting string 

  `+ (NSString*)makeUrlSafe:(NSString*)str byReplacingWith:(NSString*)safe;`
  `+ (NSString*)makeUrlSafe:(NSString *)str byReplacingWith:(NSString *)safe andAppending:(NSString*)safeSuffix;` 


Example
===========

`SString *myDangerousString = @"Moe's Cantina";` 
`NSString *mySafeString = [NSString makeUrlSafe:myDangerousString byReplacingWith:@"+"];`  
`NSLog(@"%@", mySafeString); 	//	prints "Moe+s+Cantina" to the console`  
