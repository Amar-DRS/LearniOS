//
//  DRSGoogleMapVCViewController.m
//  LearniOS
//
//  Created by Apple on 23/08/16.
//  Copyright © 2016 AmarDRS. All rights reserved.
//

#import "DRSGoogleMapVCViewController.h"

@interface DRSGoogleMapVCViewController ()

@end

@implementation DRSGoogleMapVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Google Map";
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.delegate = self;
    [locationManager startUpdatingLocation];

    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithTarget:CLLocationCoordinate2DMake(0, 0) zoom: 20]
    ;
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.myLocationEnabled = YES;
    self.view = mapView;
    
    // Creates a marker in the center of the map.
    marker = [[GMSMarker alloc] init];
    // Do any additional setup after loading the view from its nib.
}
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
  [mapView clear];
    
  //  (28.535516, 77.391026)

    CLLocation *currentLocation = [locations lastObject];
    [mapView animateToLocation:currentLocation.coordinate];
    marker.position = CLLocationCoordinate2DMake(28.535516, 77.391026);
    marker.icon=[UIImage imageNamed:@"ancher.png"] ;
    //marker.groundAnchor=CGPointMake(0.5,0.5);
    
    marker.map = mapView;
    
    
    
   
    GMSMutablePath *path = [GMSMutablePath path];
    [path addCoordinate:CLLocationCoordinate2DMake(@(28.535516).doubleValue,@(77.391026).doubleValue)];
    [path addCoordinate:CLLocationCoordinate2DMake(@(28.5452415).doubleValue,@(77.367947899).doubleValue)];
    
    GMSPolyline *rectangle = [GMSPolyline polylineWithPath:path];
    rectangle.strokeWidth = 2.f;
    rectangle.map = mapView;

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

@end
