//
//  DRSShareVC.m
//  LearniOS
//
//  Created by Apple on 28/08/16.
//  Copyright © 2016 AmarDRS. All rights reserved.
//

#import "DRSShareVC.h"

@interface DRSShareVC ()

@end

@implementation DRSShareVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
   // [button addTarget:self
        //       action:@selector(aMethod:)
    // forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Show View" forState:UIControlStateNormal];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [self.view addSubview:button];
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

- (IBAction)FBShare:(id)sender {
    NSLog(@"FBShare");
}
- (IBAction)GoogleShare:(id)sender {
    NSLog(@"GoogleShare");

}

- (IBAction)TwitterShare:(id)sender {
    NSLog(@"TwitterShare");

}

- (IBAction)WHatsAppShare:(id)sender {
    NSLog(@"WHatsAppShare");
    NSString *str=@"whatsapp://send?text=Hello World";
    
    str=[NSString stringWithFormat:@"%@",[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURL * url = [NSURL URLWithString:str];
    if ([[UIApplication sharedApplication] canOpenURL: url]) {
        [[UIApplication sharedApplication] openURL: url];
    } else {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"WhatsApp Not Installed." message:@" WhatsApp is not installed on your device." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }

}

- (IBAction)LinkedinShare:(id)sender {
    NSLog(@"LinkedinShare");

}

- (IBAction)GoogleMapShare:(id)sender {
    NSLog(@"GoogleMapShare");

}
@end
