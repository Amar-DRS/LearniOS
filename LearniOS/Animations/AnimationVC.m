//
//  AnimationVC.m
//  LearniOS
//
//  Created by Apple on 04/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "AnimationVC.h"
#import "DRSCommonMethodVC.h"

#define SPIN_CLOCK_WISE 5
#define SPIN_COUNTERCLOCK_WISE 1

// This is defined in Math.h
#define M_PI   3.14159265358979323846264338327950288   /* pi */

// Our conversion definition
#define DEGREES_TO_RADIANS(angle) (angle / 180.0 * M_PI)
@interface AnimationVC ()

@end

@implementation AnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Animation";
    
     UIImageView *imageToMove =
    [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"X206H16p.png"]];
    imageToMove.frame = CGRectMake(150, self.view.center.y, 40, 40);
    [self.view addSubview:imageToMove];
    
    [DRSCommonMethodVC spinLayer:imageToMove.layer duration:1 direction:SPIN_CLOCK_WISE];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
