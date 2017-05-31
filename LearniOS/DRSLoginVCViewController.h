//
//  DRSLoginVCViewController.h
//  LearniOS
//
//  Created by Apple on 12/08/16.
//  Copyright © 2016 AmarDRS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainTVC.h"

@interface DRSLoginVCViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *LoginIdTXTF;
@property (weak, nonatomic) IBOutlet UITextField *PassTXTF;
@property (weak, nonatomic) IBOutlet UIButton *LoginBTN;

- (IBAction)TouchLogin:(id)sender;
@end
