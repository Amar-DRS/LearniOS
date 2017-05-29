//
//  UILabel+Boldify.h
//  SourceTheCourse
//
//  Created by JITEN on 3/28/16.
//  Copyright © 2016 SupraITS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ReplaceNull)
- (void) boldSubstring: (NSString*) substring;
- (void) boldRange: (NSRange) range;
@end
