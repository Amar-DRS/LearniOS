//
//  Services.h
//  LearniOS
//
//  Created by Apple on 12/08/16.
//  Copyright © 2016 AmarDRS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "Reachability.h"

@interface Services : NSObject
+ (BOOL) isNetworkRechable ;
- (NSDictionary *)dictionaryByReplacingNullsWithStrings;
@end
