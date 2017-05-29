//
//  DRSCommonMethodVC.h
//  LearniOS
//
//  Created by Apple on 10/08/16.
//  Copyright © 2016 AmarDRS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRSCommonMethodVC : UIViewController

+ (void)spinLayer:(CALayer *)inLayer duration:(CFTimeInterval)inDuration
        direction:(int)direction;
@end
