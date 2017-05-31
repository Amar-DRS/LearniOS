//
//  MainTVC.h
//  LearniOS
//
//  Created by Apple on 04/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "NotificationTVC.h"
#import "AnimationVC.h"
#import "UIControlTVC.h"
#import "DRSDBTVC.h"
#import "DRSMULTITHEADTVC.h"
#import "DRSViewListTVC.h"
#import "DRSSocialTVC.h"
#import "DRSURLSchemesTVC.h"
#import "DRSPaymentTVC.h"
#import "DRSContacts.h"
#import "DRSCustomTVC.h"




@interface MainTVC : UITableViewController
@property(strong,nonatomic) NSArray *ListArr;
@end
