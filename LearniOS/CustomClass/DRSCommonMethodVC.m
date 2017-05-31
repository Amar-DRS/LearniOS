//
//  DRSCommonMethodVC.m
//  LearniOS
//
//  Created by Apple on 10/08/16.
//  Copyright © 2016 AmarDRS. All rights reserved.
//

#import "DRSCommonMethodVC.h"

#define SPIN_CLOCK_WISE 5
#define SPIN_COUNTERCLOCK_WISE 1

// This is defined in Math.h
#define M_PI   3.14159265358979323846264338327950288   /* pi */

// Our conversion definition
#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)

@interface DRSCommonMethodVC ()

@end

@implementation DRSCommonMethodVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


+ (void)spinLayer:(CALayer *)inLayer duration:(CFTimeInterval)inDuration
        direction:(int)direction
{
    
    
    /*
     
     kCAMediaTimingFunctionLinear
     kCAMediaTimingFunctionEaseIn
     kCAMediaTimingFunctionEaseOut
     kCAMediaTimingFunctionEaseInEaseOut
     kCAMediaTimingFunctionDefault
     
     */
    CABasicAnimation* rotationAnimation;
    
    // Rotate about the z axis
    rotationAnimation =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    
    // Rotate 360 degress, in direction specified
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 * direction];
    
    // Perform the rotation over this many seconds
    rotationAnimation.duration = inDuration;
    
    // Set the pacing of the animation
    rotationAnimation.timingFunction =
    [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    
    // Add animation to the layer and make it so
    [inLayer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
