   //
//  DRSSocialTVC.m
//  LearniOS
//
//  Created by Apple on 22/08/16.
//  Copyright © 2016 AmarDRS. All rights reserved.
//

#import "DRSSocialTVC.h"
#import "DRSShareVC.h"
#import <linkedin-sdk/LISDK.h>


@interface DRSSocialTVC ()

@end

@implementation DRSSocialTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title=@"Social Integration";
    self.ListArr=[NSArray arrayWithObjects:@"Facebook",@"Twitter",@"Linkdin",@"Whatsapp",@"GooglePlus",@"Share" ,nil];
    // Uncomment the following line to preserve selection between presentations.
    
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
   // UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
if (indexPath.row==5)
{
    //DRSShareVC.h
    DRSShareVC *ShareVC = [[DRSShareVC alloc] initWithNibName:@"DRSShareVC" bundle:nil];
    ShareVC.title=@"Share";
    [self.navigationController pushViewController:ShareVC animated:YES];

}
    else if (indexPath.row==2)
    {
        NSArray *permissions = [NSArray arrayWithObjects:LISDK_BASIC_PROFILE_PERMISSION, nil];
        [LISDKSessionManager createSessionWithAuth:permissions state:nil showGoToAppStoreDialog:YES successBlock:^(NSString *returnState)
        {
            NSLog(@"%s","success called!");
            LISDKSession *session = [[LISDKSessionManager sharedInstance] session];
            NSLog(@"Session : %@", session.description);
        } errorBlock:^(NSError *error)
        {
            NSLog(@"%s","error called!");
        }];
        
        
        [[LISDKAPIHelper sharedInstance] getRequest:@"https://api.linkedin.com/v1/people/~"
                                            success:^(LISDKAPIResponse *response)
        {
            NSData* data = [response.data dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *dictResponse = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSLog(@"Authenticated user name : %@ %@", [dictResponse valueForKey: @"firstName"], [dictResponse valueForKey: @"lastName"]);
        } error:^(LISDKAPIError *apiError)
        {
            NSLog(@"Error : %@", apiError);
        }];
    
    }
    else
        {
            FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
            loginButton.center = self.view.center;
            [self.view addSubview:loginButton];
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
