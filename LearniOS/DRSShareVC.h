//
//  DRSShareVC.h
//  LearniOS
//
//  Created by Apple on 28/08/16.
//  Copyright © 2016 AmarDRS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DRSShareVC : UIViewController
- (IBAction)FBShare:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *GoogleShare;
- (IBAction)GoogleShare:(id)sender;

- (IBAction)TwitterShare:(id)sender;
- (IBAction)WHatsAppShare:(id)sender;
- (IBAction)LinkedinShare:(id)sender;
- (IBAction)GoogleMapShare:(id)sender;
@end
