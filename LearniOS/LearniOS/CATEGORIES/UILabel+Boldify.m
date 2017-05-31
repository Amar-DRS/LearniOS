//
//  UILabel+Boldify.m
//  SourceTheCourse
//
//  Created by Supra Dev Team on 3/28/16.
//  Copyright © 2016 SupraITS. All rights reserved.
//

#import "UILabel+Boldify.h"

@implementation UILabel (ReplaceNull)

- (void) boldRange: (NSRange) range {
    if (![self respondsToSelector:@selector(setAttributedText:)]) {
        return;
    }
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    [attributedText setAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:self.font.pointSize]} range:range];
    
    self.attributedText = attributedText;
}

- (void) boldSubstring: (NSString*) substring {
    NSRange range = [self.text rangeOfString:substring];
    [self boldRange:range];
}

@end
