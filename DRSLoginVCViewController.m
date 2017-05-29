//
//  DRSLoginVCViewController.m
//  LearniOS
//
//  Created by Apple on 12/08/16.
//  Copyright © 2016 AmarDRS. All rights reserved.
//

#import "DRSLoginVCViewController.h"
//#import <QuartzCore/QuartzCore.h>
#import <LocalAuthentication/LocalAuthentication.h>



@interface DRSLoginVCViewController ()

@end

@implementation DRSLoginVCViewController
- (IBAction)LoginBtn {
    if ([self.LoginIdTXTF.text isEqualToString:@"109"]&&[self.PassTXTF.text isEqualToString:@"supra"]) {
        
            MainTVC *viewController = [[MainTVC alloc] initWithNibName:@"MainTVC" bundle:nil];
            [self.navigationController pushViewController:viewController animated:YES];
    } else {
       
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert!"
                                                        message:@"Please use TouchID to enter!"
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
    [alertView show];

    }
 

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
    self.title=@"Login";
    // to make text up down top bottom in button
    self.LoginBTN.contentEdgeInsets = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f);
    // change border width by calayer
    self.LoginBTN.layer.borderWidth=1.0f;
    // change border radious by calayer
    self.LoginBTN.layer.cornerRadius = 10;
    // change border color by calayer
    self.LoginBTN.layer.borderColor=[UIColor greenColor].CGColor;
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

- (IBAction)TouchLogin:(id)sender {
    
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *myLocalizedReasonString = @"Please use your fingers to login";
    
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                  localizedReason:myLocalizedReasonString
                            reply:^(BOOL success, NSError *error) {
                                if (success) {
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        
                                        
                                        MainTVC *viewController = [[MainTVC alloc] initWithNibName:@"MainTVC" bundle:nil];
                                        [self.navigationController pushViewController:viewController animated:YES];
                                        
                                        //[self performSegueWithIdentifier:@"Success" sender:nil];
                                    });
                                } else {
                                    dispatch_async(dispatch_get_main_queue(), ^{
                                        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                                            message:error.description
                                                                                           delegate:self
                                                                                  cancelButtonTitle:@"OK"
                                                                                  otherButtonTitles:nil, nil];
                                        [alertView show];
                                        NSLog(@"Switch to fall back authentication - ie, display a keypad or password entry box");
                                    });
                                }
                            }];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:authError.description
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles:nil, nil];
            [alertView show];
        });
    }
    
    
    

}


- (void)initialize
{
    UIMenuItem *itemA = [[UIMenuItem alloc] initWithTitle:@"A" action:@selector(a:)];
    UIMenuItem *itemB = [[UIMenuItem alloc] initWithTitle:@"B" action:@selector(b:)];
    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObjects:itemA, itemB, nil]];
   
}

-(void)a:(id)sender
{

}
-(void)b:(id)sender
{
    
}



- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    BOOL can = [super canPerformAction:action withSender:sender];
    if (action == @selector(a:) || action == @selector(b:))
    {
        can = YES;
    }
    if (action == @selector(copy:))
    {
        can = NO;
    }
    if (action == @selector(paste:))
    {
        can = NO;
    }
    NSLog(@"%@ perform action %@ with sender %@.", can ? @"can" : @"cannot", NSStringFromSelector(action), sender);
    return can;
}
    @end
