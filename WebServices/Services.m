//
//  Services.m
//  LearniOS
//
//  Created by Apple on 12/08/16.
//  Copyright © 2016 AmarDRS. All rights reserved.
//

#import "Services.h"

@implementation Services

 + (BOOL) isNetworkRechable {
 Reachability *reachability = [Reachability reachabilityForInternetConnection];
 NetworkStatus networkStatus = [reachability currentReachabilityStatus];
 if (networkStatus == NotReachable) {
 
    
     
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil) message:NSLocalizedString(@"Please check Network...", nil) delegate:nil cancelButtonTitle:NSLocalizedString(@"Ok", nil) otherButtonTitles:nil, nil];
 
 [alert show];
 }
 return !(networkStatus == NotReachable);
 }
//-(NSDictionary *)dictionaryByReplacingNullsWithStrings {
//    const NSMutableDictionary *replaced = [self mutableCopy];
//    const id nul = [NSNull null];
//    const NSString *blank = @"";
//    
//    for(NSString *key in self) {
//        const id object = [self objectForKey:key];
//        if(object == nul) {
//            //pointer comparison is way faster than -isKindOfClass:
//            //since [NSNull null] is a singleton, they'll all point to the same
//            //location in memory.
//            [replaced setObject:blank
//                         forKey:key];
//        }
//    }
//    
//    return [replaced copy];
//}

@end
