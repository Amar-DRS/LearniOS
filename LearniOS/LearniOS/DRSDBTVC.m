//
//  DRSDBTVC.m
//  LearniOS
//
//  Created by AmarDRS on 10/08/16.
//  Copyright © 2016 AmarDRS. All rights reserved.
//

#import "DRSDBTVC.h"

@interface DRSDBTVC ()

@end

@implementation DRSDBTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.DBListArr=[NSArray arrayWithObjects:@"SQLite",@"PList",@"UserDefaults",@"CoreData",@"NoSQL", nil];
    
    self.title=@"Databases";
//    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.tableView.frame.size.width,10)];
//    headerView.backgroundColor=[[UIColor redColor]colorWithAlphaComponent:0.5f];
//    headerView.layer.borderColor=[UIColor blackColor].CGColor;
//    headerView.layer.borderWidth=1.0f;
    //    CGSize yourLabelSize = [yourLabel.text sizeWithAttributes:@{NSFontAttributeName : [UIFont fontWithName:yourLabel.font size:yourLabel.fontSize]}];

//    self.tableView.tableHeaderView=headerView;

  }
- (void)scrollViewDidScroll:(UIScrollView *)aScrollView {
    NSIndexPath *topVisibleIndexPath = [[self.tableView indexPathsForVisibleRows] objectAtIndex:0];
    NSLog(@"top visible cell's section: %li, get row: %li", topVisibleIndexPath.section, topVisibleIndexPath.row);
   // self.title=[NSString stringWithFormat:@"Section-%li",topVisibleIndexPath.section];

}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSIndexPath *topVisibleIndexPath = [[self.tableView indexPathsForVisibleRows] objectAtIndex:0];
    NSLog(@"top visible cell's section: %li, get row: %li", topVisibleIndexPath.section, topVisibleIndexPath.row);
   // self.title=[NSString stringWithFormat:@"Section-%li",topVisibleIndexPath.section];
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
    return [self.DBListArr count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    
    
    if (cell == nil) {
     
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyIdentifier"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    cell.textLabel.text = [self.DBListArr objectAtIndex:indexPath.row];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    if (indexPath.row==0) {
 
    
    
    DRSSQLiteController *detailViewController = [[DRSSQLiteController alloc] initWithNibName:@"DRSSQLiteController" bundle:nil];
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    }
    
    else
    {
    DRSPListVC *detailViewController = [[DRSPListVC alloc] initWithNibName:@"DRSPListVC" bundle:nil];
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
