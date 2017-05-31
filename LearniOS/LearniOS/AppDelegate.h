//
//  AppDelegate.h
//  LearniOS
//
//  Created by Apple on 04/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "DBManager.h"
#import "MainTVC.h"
#import "DRSLoginVCViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) DBManager *dbManager;

@property (strong, nonatomic) UIWindow *window;


@end

