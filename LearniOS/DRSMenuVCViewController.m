//
//  DRSMenuVCViewController.m
//  LearniOS
//
//  Created by Apple on 16/08/16.
//  Copyright © 2016 AmarDRS. All rights reserved.
//

#import "DRSMenuVCViewController.h"

@interface DRSMenuVCViewController ()
{
   // NSMutableArray *controllerArray;
}
@property(nonatomic) CAPSPageMenu *pageMenu;

@end

@implementation DRSMenuVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
   // controllerArray=[NSMutableArray array];
    MainTVC *controller1 = [[MainTVC alloc]initWithNibName:@"MainTVC" bundle:nil];
    controller1.title = @"LATEST";
    //[controllerArray addObject:controller1];
    MainTVC *controller2 = [[MainTVC alloc]initWithNibName:@"MainTVC" bundle:nil];
    controller2.title = @"MIDDLE";
   // [controllerArray addObject:controller2];
    
    MainTVC *controller3 = [[MainTVC alloc]initWithNibName:@"MainTVC" bundle:nil];
    controller3.title = @"OLDEST1";
  //  [controllerArray addObject:controller3];
    MainTVC *controller4 = [[MainTVC alloc]initWithNibName:@"MainTVC" bundle:nil];
    controller4.title = @"OLDEST2";
    MainTVC *controller5 = [[MainTVC alloc]initWithNibName:@"MainTVC" bundle:nil];
    controller5.title = @"OLDEST3";
    MainTVC *controller6 = [[MainTVC alloc]initWithNibName:@"MainTVC" bundle:nil];
    controller6.title = @"OLDEST4";
   // [controllerArray addObject:controller4];
    
    NSArray *controllerArray = @[controller1, controller2, controller3, controller4,controller5,controller6];
    NSDictionary *parameters = @{
                                 CAPSPageMenuOptionScrollMenuBackgroundColor: [UIColor colorWithRed:30.0/255.0 green:30.0/255.0 blue:30.0/255.0 alpha:1.0],
                                 CAPSPageMenuOptionViewBackgroundColor: [UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0],
                                 CAPSPageMenuOptionSelectionIndicatorColor: [UIColor whiteColor],
                                 CAPSPageMenuOptionBottomMenuHairlineColor: [UIColor colorWithRed:70.0/255.0 green:70.0/255.0 blue:70.0/255.0 alpha:1.0],
                                 CAPSPageMenuOptionMenuItemFont: [UIFont fontWithName:@"HelveticaNeue" size:13.0],
                                 CAPSPageMenuOptionMenuHeight: @(40.0),
                                 CAPSPageMenuOptionMenuItemWidth: @(90.0),
                                 CAPSPageMenuOptionCenterMenuItems: @(YES)
                                 };
    
    _pageMenu = [[CAPSPageMenu alloc] initWithViewControllers:controllerArray frame:CGRectMake(0.0, 100.0, self.view.frame.size.width, self.view.frame.size.height) options:parameters];
    [_pageMenu.view setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:_pageMenu.view];
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
