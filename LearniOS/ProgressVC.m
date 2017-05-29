//
//  ProgressVC.m
//  LearniOS
//
//  Created by Apple on 16/08/16.
//  Copyright © 2016 AmarDRS. All rights reserved.
//

#import "ProgressVC.h"

@interface ProgressVC ()
{

}
@end

@implementation ProgressVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title=@"Gradient Progress view";
     progressbar=[[GradientProgressView alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width-40, 13.0f)];
    
    [self.view addSubview:progressbar];
    [progressbar startAnimating];
    [progressbar setProgress:1.0f];
//            [progressbar stopAnimating];
//        [progressbar removeFromSuperview];
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
