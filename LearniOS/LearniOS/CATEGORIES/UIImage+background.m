//
//  UIImage+background.m
//  SourceTheCourse
//
//  Created by Supra Dev Team on 3/14/16.
//  Copyright © 2016 SupraITS. All rights reserved.
//

#import "UIImage+background.h"

@implementation UIImage (ReplaceNull)

+ (UIImage *)imageFromColor:(UIColor *)color andRect:(CGRect) recter {
    CGRect rect = CGRectMake(0, 0, recter.size.width, recter.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
