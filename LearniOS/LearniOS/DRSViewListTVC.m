//
//  DRSViewListTVC.m
//  LearniOS
//
//  Created by Apple on 16/08/16.
//  Copyright © 2016 AmarDRS. All rights reserved.
//

#import "DRSViewListTVC.h"
#import "MDViewController.h"

@interface DRSViewListTVC ()

@end

@implementation DRSViewListTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Views";
    self.ListArr=[NSArray arrayWithObjects:@"Page Menu",@"Gradient Progress View",@"UILable",@"Apple Map View",@"Google Map", nil];
    
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    if (indexPath.row==0) {
        
        DRSMenuVCViewController *detailViewController = [[DRSMenuVCViewController alloc] initWithNibName:@"DRSMenuVCViewController" bundle:nil];
        
        // Pass the selected object to the new view controller.
        
        // Push the view controller.
        [self.navigationController pushViewController:detailViewController animated:YES];
        
        
        
    }
    
    
    
    else if(indexPath.row==3)
    {
    
        DRSAppleMapVC *mapVC =[[DRSAppleMapVC alloc] initWithNibName:@"DRSAppleMapVC" bundle:nil];
        [self.navigationController pushViewController:mapVC animated:YES];

    }
    
    else if(indexPath.row==4)
    {
        
        MDViewController *GMSmapVC =[[MDViewController alloc] initWithNibName:nil bundle:nil];

      //  DRSGoogleMapVCViewController *GMSmapVC =[[DRSGoogleMapVCViewController alloc] initWithNibName:@"DRSGoogleMapVCViewController" bundle:nil];
        [self.navigationController pushViewController:GMSmapVC animated:YES];
        
    }
    else
      
        
        
    {
ProgressVC *detailViewController = [[ProgressVC alloc] initWithNibName:@"ProgressVC" bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    
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
