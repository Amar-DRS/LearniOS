//
//  MainTVC.m
//  LearniOS
//
//  Created by Apple on 04/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "MainTVC.h"
#import <sys/sysctl.h>
#include <sys/types.h>
#include <objc/runtime.h>


@interface MainTVC ()
{
int Expand;
}
@end

@implementation MainTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    Expand=1;
//    NSString *stringURL = @"sms:+919971352921";
//    NSURL *url = [NSURL URLWithString:stringURL];
//    [[UIApplication sharedApplication] openURL:url];
    NSLog(@"iOSVersion>>>%@",[self runningProcesses]);

    NSString *stringURL1 = @"dailymotion://";
    NSURL *url1 = [NSURL URLWithString:stringURL1];
    [[UIApplication sharedApplication] openURL:url1];
   // [self allInstalledApp];
  
//    NSArray *appList = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"/Applications" error:nil];
//    NSLog(@"%@",appList);
    
    Class LSApplicationWorkspace_class = objc_getClass("LSApplicationWorkspace");
    SEL selector=NSSelectorFromString(@"defaultWorkspace");
    NSObject* workspace = [LSApplicationWorkspace_class performSelector:selector];
    
    SEL selectorALL = NSSelectorFromString(@"allApplications");
    NSLog(@"apps: %@",NSStringFromClass( [[[workspace performSelector:selectorALL] objectAtIndex:0] class]));
   // NSLog(@"apps: %@",[[workspace performSelector:selectorALL] objectAtIndex:0].localizedName);

    
//    LSApplicationProxy *apps =[[workspace performSelector:selectorALL] objectAtIndex:0];
//    
//        NSString *localizedName = apps.localizedName;
//        
//        if([apps.applicationType isEqualToString:@"User"])
//        {
//            NSLog(@"\nlocalizedName: %@",localizedName);
//            NSLog(@"minimumSystemVersion: %@",apps.minimumSystemVersion);
//            NSLog(@"fileSharingEnabled: %d",apps.fileSharingEnabled);
//            NSLog(@"sdkVersion: %@",apps.sdkVersion);
//        }
   
    
    NSString *iOSVersion = [[UIDevice currentDevice] systemVersion];
    NSString *model = [[UIDevice currentDevice] model];

    
    NSLog(@"iOSVersion>>>%@",iOSVersion);
    NSLog(@"model>>>%@",model);
    
    NSLog(@"model>>>%@",[self platformRawString]);
    NSLog(@"model>>>%@",[self platformNiceString]);
   
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.tableView.frame.size.width,30)];
    headerView.backgroundColor=[[UIColor redColor]colorWithAlphaComponent:0.5f];
    headerView.layer.borderColor=[UIColor blackColor].CGColor;
    headerView.layer.borderWidth=1.0f;

    //self.tableView.tableHeaderView=headerView;

    //self.tableView.contentInset = UIEdgeInsetsMake(-20.0f, 0.0f, 0.0f, 0.0f);

    
    self.title=@"ITEM LIST";
    self.ListArr=[NSArray arrayWithObjects:@"UI Controls",@"UIView",@"Databases",@"Notifications",@"Multi Threading",@"Entertainment",@"App Architecure",@"iOS Architecture",@"Custom Classes",@"Third Party Libraries",@"Social",@"Animations",@"Storyboarding",@"URL Schemes",@"In App Purchase" ,@"Contacts List",@"Set Reminder",@"FlashLight",@"Custom Table View",nil];
    // Uncomment the following line to preserve selection between presentations.
    NSLog(@"%ld",self.ListArr.count);
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
  //  self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (NSArray *)runningProcesses {
    
    int mib[4] = {CTL_KERN, KERN_PROC, KERN_PROC_ALL, 0};
    size_t miblen = 4;
    
    size_t size;
    int st = sysctl(mib, miblen, NULL, &size, NULL, 0);
    
    struct kinfo_proc * process = NULL;
    struct kinfo_proc * newprocess = NULL;
    
    do {
        
        size += size / 10;
        newprocess = realloc(process, size);
        
        if (!newprocess){
            
            if (process){
                free(process);
            }
            
            return nil;
        }
        
        process = newprocess;
        st = sysctl(mib, miblen, process, &size, NULL, 0);
        
    } while (st == -1 && errno == ENOMEM);
    
    if (st == 0){
        
        if (size % sizeof(struct kinfo_proc) == 0){
            int nprocess = size / sizeof(struct kinfo_proc);
            
            if (nprocess){
                
                NSMutableArray * array = [[NSMutableArray alloc] init];
                
                for (int i = nprocess - 1; i >= 0; i--){
                    
                    NSString * processID = [[NSString alloc] initWithFormat:@"%d", process[i].kp_proc.p_pid];
                    NSString * processName = [[NSString alloc] initWithFormat:@"%s", process[i].kp_proc.p_comm];
                    
                    NSDictionary * dict = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:processID, processName, nil]
                                                                        forKeys:[NSArray arrayWithObjects:@"ProcessID", @"ProcessName", nil]];
//                    [processID release];
//                    [processName release];
//                    [array addObject:dict];
//                    [dict release];
                }
                
                free(process);
                return array ;
            }
        }
    }
    
    return nil;
}


-(void) allInstalledApp
{
    NSDictionary *cacheDict;
    
    NSDictionary *user;
    
    static NSString *const cacheFileName = @"com.apple.mobile.installation.plist";
    
    NSString *relativeCachePath = [[@"Library" stringByAppendingPathComponent: @"Caches"] stringByAppendingPathComponent: cacheFileName];
    
    NSString *path = [[NSHomeDirectory() stringByAppendingPathComponent: @"../.."] stringByAppendingPathComponent: relativeCachePath];
    
    cacheDict    = [NSDictionary dictionaryWithContentsOfFile: path];
    
    user = [cacheDict objectForKey: @"User"];
    
    NSDictionary *systemApp=[cacheDict objectForKey:@"System"];
    NSLog(@"user>>%@",user);
    NSLog(@"systemApp>>%@",systemApp);


}

- (NSString *)platformRawString {
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}
- (NSString *)platformNiceString {
    NSString *platform = [self platformRawString];
    
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"Verizon iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5 (GSM)";
    if ([platform isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([platform isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([platform isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([platform isEqualToString:@"iPad2,6"])      return @"iPad Mini (GSM)";
    if ([platform isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 (GSM)";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([platform isEqualToString:@"iPad3,5"])      return @"iPad 4 (GSM)";
    if ([platform isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([platform isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    
    if ([platform isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([platform isEqualToString:@"iPad4,4"])      return @"iPad mini 2G (WiFi)";
    if ([platform isEqualToString:@"iPad4,5"])      return @"iPad mini 2G (Cellular)";
    
    if ([platform isEqualToString:@"iPad4,7"])      return @"iPad mini 3 (WiFi)";
    if ([platform isEqualToString:@"iPad4,8"])      return @"iPad mini 3 (Cellular)";
    if ([platform isEqualToString:@"iPad4,9"])      return @"iPad mini 3 (China Model)";
    
    if ([platform isEqualToString:@"iPad5,3"])      return @"iPad Air 2 (WiFi)";
    if ([platform isEqualToString:@"iPad5,4"])      return @"iPad Air 2 (Cellular)";
    if ([platform isEqualToString:@"iPad6,8"])      return @"iPad Pro";
    
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    
    return platform;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)prefersStatusBarHidden{
    return YES;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.ListArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    

    if (cell == nil) {
        
      
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyIdentifier"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    

    
    cell.textLabel.text = [self.ListArr objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"row number>>%ld",indexPath.row+1];
   
    
    
    return cell;
    

}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    
//    if (Expand==1)
//    {
//    [UIView animateWithDuration:0.5 animations:^(void){
//        [self.tableView scrollToRowAtIndexPath:indexPath
//                              atScrollPosition:UITableViewScrollPositionTop
//                                      animated:YES];
//        
//    }];
//        Expand=2;
//    }
//    else
//    {
//       
//
//        
//        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]
//                              atScrollPosition:UITableViewScrollPositionTop
//                                      animated:YES];
//        Expand=1;
//
//    }

    if (indexPath.row==0)
        
    {
        UIControlTVC *Control = [[UIControlTVC alloc] initWithNibName:@"UIControlTVC" bundle:nil];
        
        [self.navigationController pushViewController:Control animated:YES];
        
        
    }
    else if (indexPath.row==1)
        
    {
        DRSViewListTVC *ViewController = [[DRSViewListTVC alloc] initWithNibName:@"DRSViewListTVC" bundle:nil];
        
        [self.navigationController pushViewController:ViewController animated:YES];
        
        
    }
    else if (indexPath.row==2)
        
    {
        DRSDBTVC *DBController = [[DRSDBTVC alloc] initWithNibName:@"DRSDBTVC" bundle:nil];
        
        [self.navigationController pushViewController:DBController animated:YES];
        
        
    }
    else if (indexPath.row==4)
        
    {
         DRSMULTITHEADTVC *MTController = [[DRSMULTITHEADTVC alloc] initWithNibName:@"DRSMULTITHEADTVC" bundle:nil];
        
        [self.navigationController pushViewController:MTController animated:YES];
        
        
    }
    else if (indexPath.row==10)
        
    {
        DRSSocialTVC *SocialVC = [[DRSSocialTVC alloc] initWithNibName:@"DRSSocialTVC" bundle:nil];
        
        [self.navigationController pushViewController:SocialVC animated:YES];
        
        
    }
    

    else if (indexPath.row==11)
        
    {
        AnimationVC *Animation = [[AnimationVC alloc] initWithNibName:@"AnimationVC" bundle:nil];

        [self.navigationController pushViewController:Animation animated:YES];

    
    }
    else if (indexPath.row==13)
        
    {
        
        DRSURLSchemesTVC *Animation = [[DRSURLSchemesTVC alloc] initWithNibName:@"DRSURLSchemesTVC" bundle:nil];
        
        [self.navigationController pushViewController:Animation animated:YES];
        
       
          //  [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=375380948"]];
//        NSString *str = @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa";
//        str = [NSString stringWithFormat:@"%@/wa/viewContentsUserReviews?", str];
//        str = [NSString stringWithFormat:@"%@type=Purple+Software&id=", str];
//        
//        // Here is the app id from itunesconnect
//        str = [NSString stringWithFormat:@"%@289382458", str];
//        
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        
    }
    else if (indexPath.row==14)
        
    {
        DRSPaymentTVC *PaymentTVC = [[DRSPaymentTVC alloc] initWithNibName:@"DRSPaymentTVC" bundle:nil];
        
        [self.navigationController pushViewController:PaymentTVC animated:YES];

  
    }
    else if (indexPath.row==15)
        
    {
        DRSContacts *Contacts = [[DRSContacts alloc] initWithNibName:@"DRSContacts" bundle:nil];
        
        [self.navigationController pushViewController:Contacts animated:YES];
        
        
    }
 else if (indexPath.row==17)

{
 AVCaptureDevice *flashLight = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
 if ([flashLight isTorchAvailable] && [flashLight isTorchModeSupported:AVCaptureTorchModeOn])
 {
 BOOL success = [flashLight lockForConfiguration:nil];
     if (success)
     {
        if ([flashLight isTorchActive])
            {
                [flashLight setTorchMode:AVCaptureTorchModeOff];
            }
        else
            {
                [flashLight setTorchMode:AVCaptureTorchModeOn];
            }
     [flashLight unlockForConfiguration];
     }
 }
 }
 else if (indexPath.row==18)
 {

     DRSCustomTVC *Contacts = [[DRSCustomTVC alloc] initWithNibName:@"DRSCustomTVC" bundle:nil];
     
     [self.navigationController pushViewController:Contacts animated:YES];

 }

    else
    {
        NSString *textToShare = @"Look at this awesome website for aspiring iOS Developers!";
        NSURL *myWebsite = [NSURL URLWithString:@"http://www.codingexplorer.com/"];
        
        NSArray *objectsToShare = @[textToShare, myWebsite];
        
        UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
        
        NSArray *excludeActivities = @[UIActivityTypeAirDrop,
                                       UIActivityTypePrint,
                                       UIActivityTypeAssignToContact,
                                       UIActivityTypeSaveToCameraRoll,
                                       UIActivityTypeAddToReadingList,
                                       UIActivityTypePostToFlickr,
                                       UIActivityTypePostToVimeo];
        
        activityVC.excludedActivityTypes = excludeActivities;
        
        [self presentViewController:activityVC animated:YES completion:nil];

        
    }
 
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
