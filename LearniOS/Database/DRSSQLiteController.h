//
//  DRSSQLiteController.h
//  LearniOS
//
//  Created by Apple on 12/09/16.
//  Copyright © 2016 AmarDRS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface DRSSQLiteController : UITableViewController
@property(strong,nonatomic) NSMutableArray *DBListArr;
@property (nonatomic, strong) DBManager *dbManager;

@end
