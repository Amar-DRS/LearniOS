//
//  DRSPListVC.m
//  LearniOS
//
//  Created by Apple on 12/09/16.
//  Copyright © 2016 AmarDRS. All rights reserved.
//

#import "DRSPListVC.h"

@interface DRSPListVC ()

@end

@implementation DRSPListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem =  [[UIBarButtonItem alloc] initWithTitle:@"Custom Back Title"
                                                                               style:UIBarButtonItemStyleBordered
                                                                              target:nil
                                                                              action:nil];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)save_Action
{
//    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsPath = [paths objectAtIndex:0];
//    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"manuallyData.plist"];
//    
////    [self.nameArr addObject:self.nameField.text];
////    [self.countryArr addObject:self.countryField.text];
////    [self.imageArr addObject:@"image.png"];
//    
//    [self.nameArr addObject:@""];
//    [self.countryArr addObject:@""];
//    [self.imageArr addObject:@"image.png"];
//    
//    NSDictionary *plistDict = [[NSDictionary alloc] initWithObjects: [NSArray arrayWithObjects: self.nameArr, self.countryArr, self.imageArr, nil] forKeys:[NSArray arrayWithObjects: @"Name", @"Country",@"Image", nil]];
//    
//    NSString *error = nil;
//    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:plistDict format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
//    
//    if(plistData)
//    {
//        [plistData writeToFile:plistPath atomically:YES];
//        //alertLbl.text = @"Data saved sucessfully";
//    }
//    else
//    {
//       // alertLbl.text = @"Data not saved";
//    }
}

-(void)GetDataFromPList
{
//NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
//NSString *documentsPath = [paths objectAtIndex:0];
//NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"manuallyData.plist"];
//
//if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath])
//{
//    plistPath = [[NSBundle mainBundle] pathForResource:@"manuallyData" ofType:@"plist"];
//}
//
//NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
//self.nameArr = [dict objectForKey:@"Name"];
//self.countryArr = [dict objectForKey:@"Country"];
// Data is saved in your plist and plist is saved in DocumentDirectory
}

-(void)RemoveDataFromPList
{

//    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsPath = [paths objectAtIndex:0];
//    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"manuallyData.plist"];
//    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithContentsOfFile:(NSString *)plistPath];
//    
//    self.nameArr = [dictionary objectForKey:@"Name"];
//    self.countryArr = [dictionary objectForKey:@"Country"];
//    
////    [self.nameArr removeObjectAtIndex:indexPath.row];
////    [self.countryArr removeObjectAtIndex:indexPath.row];
//    
//    [dictionary writeToFile:plistPath atomically:YES];
}

-(void)UpdateDataFromPList
{
//    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsPath = [paths objectAtIndex:0];
//    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"manuallyData.plist"];
//    
//    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath])
//    {
//        plistPath = [[NSBundle mainBundle] pathForResource:@"manuallyData" ofType:@"plist"];
//    }
//    
//    self.plistDic = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
//    
//    [[self.plistDic objectForKey:@"Name"] removeObjectAtIndex:self.indexPath];
//    [[self.plistDic objectForKey:@"Country"] removeObjectAtIndex:self.indexPath];
//    [[self.plistDic objectForKey:@"Image"] removeObjectAtIndex:self.indexPath];
//    
//    [[self.plistDic objectForKey:@"Name"] insertObject:nameField.text atIndex:self.indexPath];
//    [[self.plistDic objectForKey:@"Country"] insertObject:countryField.text atIndex:self.indexPath];
//    [[self.plistDic objectForKey:@"Image"] insertObject:@"dhoni.jpg" atIndex:self.indexPath];
//    
//    [self.plistDic writeToFile:plistPath atomically:YES];
}
@end
