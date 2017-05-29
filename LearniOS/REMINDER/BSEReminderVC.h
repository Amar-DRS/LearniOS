//
//  BSEAddDiscussionVC.h
//  SourceTheCourse
//
//  Created by Supra Dev Team on 3/31/16.
//  Copyright © 2016 SupraITS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>

@protocol BSEReminderVCDelegate <NSObject>
-(void) submitSuccess:(NSString *)str;

@end

@interface BSEReminderVC : UIViewController {
   IBOutlet UILabel *backLabel;
    EKEventStore *store;
    EKCalendar *calendar;
    IBOutlet UIDatePicker *remindPicker;
}
@property int course_id;
@property (nonatomic,strong) NSString *course_name;
@property (nonatomic,strong) id<BSEReminderVCDelegate> bseReminderVCDelegateObj;
@property (copy, nonatomic) NSArray *reminders;

@end
