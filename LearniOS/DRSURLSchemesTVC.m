//
//  DRSURLSchemesTVC.m
//  LearniOS
//
//  Created by Apple on 29/08/16.
//  Copyright © 2016 AmarDRS. All rights reserved.
//

#import "DRSURLSchemesTVC.h"
#import <MediaPlayer/MediaPlayer.h>
#import <QuickLook/QuickLook.h>

@interface DRSURLSchemesTVC ()
{
    MPMoviePlayerController *moviePlayer;

}
@end

@implementation DRSURLSchemesTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"ITEM LIST";
    self.ListArr=[NSArray arrayWithObjects:@"Rate App",@"Send SMS",@"Make Phone Call",@"Open Safari",@"Open Maps",@"Send Mail",@"Open  Music / iPod ",@"Open YouTube Architecture",@"Open Videos",@"Open iTunes",@"Open App Store",@"Open iBooks",@"Storyboarding",@"Rate App",@"Open Webex App", nil];
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    if (indexPath.row==0)
        
    {
          [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=375380948"]];
        //        NSString *str = @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa";
        //        str = [NSString stringWithFormat:@"%@/wa/viewContentsUserReviews?", str];
        //        str = [NSString stringWithFormat:@"%@type=Purple+Software&id=", str];
        //
        //        // Here is the app id from itunesconnect
        //        str = [NSString stringWithFormat:@"%@289382458", str];
        //
        //        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        
        
    }
    else if (indexPath.row==1)
        
    {
        /*SMS
        
        To open the SMS application, just use the sms: protocol in your URL:
        
        NSString *stringURL = @"sms:";
        NSURL *url = [NSURL URLWithString:stringURL];
        [[UIApplication sharedApplication] openURL:url];
        
        You can specify a phone number, but apparently not a default text for your message:
            
            NSString *stringURL = @"sms:+12345678901";
        NSURL *url = [NSURL URLWithString:stringURL];
        [[UIApplication sharedApplication] openURL:url];
        
        The same restrictions apply as for phone URLs, regarding spaces, brackets and dashes.
         */
        NSString *stringURL = @"sms:";
        NSURL *url = [NSURL URLWithString:stringURL];
        [[UIApplication sharedApplication] openURL:url];
    }
    else if (indexPath.row==2)
        
    {
        
        NSMutableString *phone = [@"+ 12 34 567 89 01" mutableCopy];
        [phone replaceOccurrencesOfString:@" "
                               withString:@""
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0, [phone length])];
        [phone replaceOccurrencesOfString:@"("
                               withString:@""
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0, [phone length])];
        [phone replaceOccurrencesOfString:@")"
                               withString:@""
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0, [phone length])];
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", phone]];
        [[UIApplication sharedApplication] openURL:url];
        
    }
    else if (indexPath.row==3)
        
    {
        NSString *stringURL = @"http://wiki.akosma.com/";
        NSURL *url = [NSURL URLWithString:stringURL];
        [[UIApplication sharedApplication] openURL:url];
        
        
    }
    else if (indexPath.row==4)
        
    {
        NSString *title = @"title";
        float latitude = 35.4634;
        float longitude = 9.43425;
        int zoom = 13;
        NSString *stringURL = [NSString stringWithFormat:@"http://maps.google.com/maps?q=%@@%1.6f,%1.6f&z=%d", title, latitude, longitude, zoom];
        NSURL *url = [NSURL URLWithString:stringURL];
        [[UIApplication sharedApplication] openURL:url];
        
        
    }
    
    
    else if (indexPath.row==5)
        
    {
      /*
       These URLs launch Mail and open the compose message controller:
       
       NSString *stringURL = @"mailto:test@example.com";
       NSURL *url = [NSURL URLWithString:stringURL];
       [[UIApplication sharedApplication] openURL:url];
       
       You can also provide more information, for a customized subject and body texts:
       
       NSString *subject = @"Message subject";
       NSString *body = @"Message body";
       NSString *address = @"test1@akosma.com";
       NSString *cc = @"test2@akosma.com";
       NSString *path = [NSString stringWithFormat:@"mailto:%@?cc=%@&subject=%@&body=%@", address, cc, subject, body];
       NSURL *url = [NSURL URLWithString:[path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
       [[UIApplication sharedApplication] openURL:url];
       
       You might also omit some information:
       
       NSString *subject = @"Message subject";
       NSString *path = [NSString stringWithFormat:@"mailto:?subject=%@", subject];
       NSURL *url = [NSURL URLWithString:[path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
       [[UIApplication sharedApplication] openURL:url];

       */
        
        NSString *stringURL = @"mailto:test@example.com";
        NSURL *url = [NSURL URLWithString:stringURL];
        [[UIApplication sharedApplication] openURL:url];
        
    }
    else if (indexPath.row==6)
        
    {
   
//      
//      There are two common techniques.
//      
//      Using CAShapeLayer:
//      
//      Create a UIBezierPath (replace the coordinates with whatever you want):
      
      UIBezierPath *path = [UIBezierPath bezierPath];
      [path moveToPoint:CGPointMake(10.0, 10.0)];
      [path addLineToPoint:CGPointMake(100.0, 100.0)];
        [path addLineToPoint:CGPointMake(100.0, 110.0)];
        [path addLineToPoint:CGPointMake(100.0, 200)];
        [path addLineToPoint:CGPointMake(100.0, 300)];
        [path addLineToPoint:CGPointMake(100.0, 400)];
        [path addLineToPoint:CGPointMake(100.0, 450)];
        [path addLineToPoint:CGPointMake(100.0, 500)];
        [path addLineToPoint:CGPointMake(200.0, 500)];
        [path addLineToPoint:CGPointMake(300.0, 500)];
        [path addLineToPoint:CGPointMake(250, 500)];
        [path addLineToPoint:CGPointMake(100.0, 500)];
        [path addLineToPoint:CGPointMake(50, 500)];

     // Create a CAShapeLayer that uses that UIBezierPath:
      
      CAShapeLayer *shapeLayer = [CAShapeLayer layer];
      shapeLayer.path = [path CGPath];
      shapeLayer.strokeColor = [[UIColor blueColor] CGColor];
      shapeLayer.lineWidth = 3.0;
      shapeLayer.fillColor = [[UIColor clearColor] CGColor];
      
    //  Add that CAShapeLayer to your view's layer:
      
      [self.view.layer addSublayer:shapeLayer];
      

        
    }
    else if (indexPath.row==13)
        
    {
        
        moviePlayer=[[MPMoviePlayerController alloc] initWithContentURL:[NSURL URLWithString:@"https://www.youtube.com/watch?v=h2zWxqpGppA"]];
        
        [self playerSupport];

        //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayStart:) name:MPMovieSourceTypeAvailableNotification  object:moviePlayer];
        [moviePlayer.view setFrame: CGRectMake(5, 100, 100,100)];  // player's frame must match parent's
        [self.view addSubview: moviePlayer.view];
        //[mediaView sendSubviewToBack:moviePlayer.view];
        [moviePlayer play];
        
    }
    else if (indexPath.row==14)
        
    {
        
        NSString *stringURL = @"wbx://";
        NSURL *url = [NSURL URLWithString:stringURL];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url ];
        }
        else
        {
        
            NSString *iTunesLink = @"https://itunes.apple.com/in/app/cisco-webex-meetings/id298844386?mt=8";
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:iTunesLink]];
//            NSString *appId = @"you appid"; //like 999999999
//            NSString *link = [@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=" stringByAppendingString:appId];
            
//            [[UIApplication sharedApplication] openURL: [NSURL URLWithString:link]];
//            https://itunes.apple.com/in/app/cisco-webex-meetings/id298844386?mt=8
//         [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=375380948"]];
        }
        
      //  [[UIApplication sharedApplication] openURL:url];
        
    }

    else
    {
        NSLog(@"indexpath>> Row>>%ld",indexPath.row);
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert:" message:@"working on it" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *OKAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       
                                   }];
        
        [alertController addAction:OKAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        
        //    NotificationTVC *Notification = [[NotificationTVC alloc] initWithNibName:@"NotificationTVC" bundle:nil];
        //
        //    // Pass the selected object to the new view controller.
        //
        //    // Push the view controller.
        //    [self.navigationController pushViewController:Notification animated:YES];
    }
}

#pragma video player settings

-(void)playerSupport
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayBackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:moviePlayer];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayBackDonePressed:) name:MPMoviePlayerDidExitFullscreenNotification object:moviePlayer];
    moviePlayer.controlStyle=MPMovieControlStyleDefault;
    
    [moviePlayer play];
    [self.view addSubview:moviePlayer.view];
    [moviePlayer setFullscreen:YES animated:YES];
}


- (void) moviePlayBackDonePressed:(NSNotification*)notification
{
    [moviePlayer stop];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerDidExitFullscreenNotification object:moviePlayer];
    
    if ([moviePlayer respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [moviePlayer.view removeFromSuperview];
    }
    moviePlayer=nil;
}

- (void) moviePlayBackDidFinish:(NSNotification*)notification
{
    [moviePlayer stop];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:moviePlayer];
    
    if ([moviePlayer respondsToSelector:@selector(setFullscreen:animated:)])
    {
        [moviePlayer.view removeFromSuperview];
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
