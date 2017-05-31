//
//  NSDictionary+ReplaceNull.m
//  Your Show
//
//  Created by Supra Dev Team on 16/09/15.
//  Copyright (c) 2016 SupraITS. All rights reserved.
//

#import "NSDictionary+ReplaceNull.h"

@interface NSArray (ReplaceNull)

- (NSArray *)arrayByReplacingNullsWithStrings;

@end

@implementation NSArray (ReplaceNull)

- (NSArray *)arrayByReplacingNullsWithStrings  {
    
    NSMutableArray *replaced = [self mutableCopy];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    for (int idx = 0; idx < [replaced count]; idx++) {
        id object = [replaced objectAtIndex:idx];
        if (object == nul) [replaced replaceObjectAtIndex:idx withObject:blank];
        else if ([object isKindOfClass:[NSDictionary class]]) [replaced replaceObjectAtIndex:idx withObject:[object dictionaryByReplacingNullsWithStrings]];
        else if ([object isKindOfClass:[NSArray class]]) [replaced replaceObjectAtIndex:idx withObject:[object arrayByReplacingNullsWithStrings]];
    }
    return [replaced copy];
    
}

@end

@implementation NSDictionary (ReplaceNull)

- (NSDictionary *)dictionaryByReplacingNullsWithStrings {
    const NSMutableDictionary *replaced = [self mutableCopy];
    const id nul = [NSNull null];
    const NSString *blank = @"";
    for (NSString *key in self) {
        id object = [self objectForKey:key];
        if (object == nul) [replaced setObject:blank forKey:key];
        else if ([object isKindOfClass:[NSDictionary class]]) [replaced setObject:[object dictionaryByReplacingNullsWithStrings] forKey:key];
        else if ([object isKindOfClass:[NSArray class]]) [replaced setObject:[object arrayByReplacingNullsWithStrings] forKey:key];
    }
    return [NSDictionary dictionaryWithDictionary:[replaced copy]];
}

@end

