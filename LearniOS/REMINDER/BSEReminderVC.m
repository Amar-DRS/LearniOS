//
//  BSEAddDiscussionVC.m
//  SourceTheCourse
//
//  Created by Supra Dev Team on 3/31/16.
//  Copyright © 2016 SupraITS. All rights reserved.
//

#import "BSEReminderVC.h"

@interface BSEReminderVC ()

@end

@implementation BSEReminderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initFields];
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

#pragma mark -- control functions

-(IBAction)actionSubmit:(id)sender {
    if(![self itemHasReminder:self.course_name]) {
        [self addReminderForToDoItem:self.course_name];
    } else {
        [self deleteReminderForToDoItem:self.course_name];
    }
}

-(IBAction)actionBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}





#pragma mark -- Custom functions

-(void) initFields {
    backLabel.text=@"";//[NSString fontAwesomeIconStringForEnum:FATimes];
    store = [[EKEventStore alloc] init];
    [store requestAccessToEntityType:EKEntityTypeReminder completion:^(BOOL granted, NSError *error) {
        if(!granted) {
            [self actionBack:nil];
        } else {
            [self setupReminder];
        }
    }];
}

-(void) setupReminder {
    //store.eventStoreIdentifier=[NSString stringWithFormat:@"course_id_%i",self.course_id];
    [self setupCalendar];
}

-(void) setupCalendar {
    // 1
    NSArray *calendars = [store calendarsForEntityType:EKEntityTypeReminder];
    
    // 2
    NSString *calendarTitle = @"Expert Plus";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title matches %@", calendarTitle];
    NSArray *filtered = [calendars filteredArrayUsingPredicate:predicate];
    
    if ([filtered count]) {
        calendar = [filtered firstObject];
    } else {
        // 3
        calendar = [EKCalendar calendarForEntityType:EKEntityTypeReminder eventStore:store];
        calendar.title = @"Expert Plus";
        calendar.source = store.defaultCalendarForNewReminders.source;
        
        // 4
        NSError *calendarErr = nil;
        BOOL calendarSuccess = [store saveCalendar:calendar commit:YES error:&calendarErr];
        if (!calendarSuccess) {
            NSLog(@"calender is not created");
        }
    }
    
    [self fetchReminders];

}

- (BOOL)itemHasReminder:(NSString *)item {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title matches %@", item];
    NSArray *filtered = [self.reminders filteredArrayUsingPredicate:predicate];
    return [filtered count];
}

- (void)addReminderForToDoItem:(NSString *)item {
    NSLog(@"it is come here");
    // 1
    EKReminder *reminder = [EKReminder reminderWithEventStore:store];
    reminder.title = item;
    reminder.calendar = calendar;
    reminder.dueDateComponents = [self dateComponentsForDefaultDueDate];
    
    //2
    
    EKRecurrenceRule *recurrence=[[EKRecurrenceRule alloc]initRecurrenceWithFrequency:EKRecurrenceFrequencyWeekly interval:1 end:nil];
    [reminder addRecurrenceRule:recurrence];
    
    // 3
    NSError *error = nil;
    BOOL success = [store saveReminder:reminder commit:YES error:&error];
    if (!success) {
        // Handle error.
    }
    NSString *message = (success) ? @"Reminder successfully added!" : @"Failed to add reminder!";
    [self.bseReminderVCDelegateObj submitSuccess:message];
    [self actionBack:nil];
}

- (void)deleteReminderForToDoItem:(NSString *)item {
    // 1
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"title matches %@", item];
    NSArray *results = [self.reminders filteredArrayUsingPredicate:predicate];
    
    // 2
    if ([results count]) {
        [results enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSError *error = nil;
            // 3
            BOOL success = [store removeReminder:obj commit:NO error:&error];
            if (!success) {
                // Handle delete error
            } else {
                [self addReminderForToDoItem:item];
            }
        }];
        
        // 4
        NSError *commitErr = nil;
        BOOL success = [store commit:&commitErr];
        if (!success) {
            // Handle commit error.
        }
    }
}



- (NSDateComponents *)dateComponentsForDefaultDueDate {
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDate *date = remindPicker.date;
    NSCalendar * cal = [NSCalendar currentCalendar];
    NSDateComponents *comps = [cal components:unitFlags fromDate:date];
   
    return comps;
}

- (void)fetchReminders {
        NSPredicate *predicate = [store predicateForRemindersInCalendars:@[calendar]];
        [store fetchRemindersMatchingPredicate:predicate completion:^(NSArray *reminders) {
            self.reminders = reminders;
        }];
}



@end
