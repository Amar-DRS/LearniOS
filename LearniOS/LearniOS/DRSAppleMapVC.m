//
//  DRSAppleMapVC.m
//  LearniOS
//
//  Created by Apple on 22/08/16.
//  Copyright © 2016 AmarDRS. All rights reserved.
//


/*
 
 [objMapView setMapType:MKMapTypeStandard]; // for Standard
 [objMapView setMapType:MKMapTypeSatellite]; // for Satellite
 [objMapView setMapType:MKMapTypeHybrid]; // for Hybrid
 - See more at: http://www.theappguruz.com/blog/mapkit-for-user-location-in-ios#sthash.Q7eN789c.dpuf
 
 - (IBAction)btnStandardTapped:(id)sender
 {
 [btnStandard setBackgroundColor:[UIColor greenColor]];
 [btnSatellite setBackgroundColor:[UIColor clearColor]];
 [btnHybrid setBackgroundColor:[UIColor clearColor]];
 [objMapView setMapType:MKMapTypeStandard];
 [self loadUserLocation];
 }
 - (IBAction)btnSatelliteTapped:(id)sender
 {
 [btnStandard setBackgroundColor:[UIColor clearColor]];
 [btnSatellite setBackgroundColor:[UIColor greenColor]];
 [btnHybrid setBackgroundColor:[UIColor clearColor]];
 [objMapView setMapType:MKMapTypeSatellite];
 [self loadUserLocation];
 }
 - (IBAction)btnHybridTapped:(id)sender
 {
 [btnStandard setBackgroundColor:[UIColor clearColor]];
 [btnSatellite setBackgroundColor:[UIColor clearColor]];
 [btnHybrid setBackgroundColor:[UIColor greenColor]];
 [objMapView setMapType:MKMapTypeHybrid];
 [self loadUserLocation];
 }
 
 */

#import "DRSAppleMapVC.h"

@interface DRSAppleMapVC ()
@property (weak, nonatomic) IBOutlet UIButton *getCurrentLocation;

@end

@implementation DRSAppleMapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Apple Map";
    locationManager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    locationManager.delegate = self;
    self.MapApple.delegate = self;
    self.MapApple.showsUserLocation = YES;

    // Do any additional setup after loading the view from its nib.
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

- (IBAction)getCurrentLocation:(id)sender {
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    if ([CLLocationManager locationServicesEnabled]) {
        [locationManager requestWhenInUseAuthorization];
        [locationManager requestAlwaysAuthorization];
        [locationManager startUpdatingLocation];
    } else {
        NSLog(@"Location services are not enabled");
    }

}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}
- (void) loadMapView
{
    CLLocationCoordinate2D objCoor2D = {.latitude = latitude_UserLocation, .longitude = longitude_UserLocation};
    MKCoordinateSpan objCoorSpan = {.latitudeDelta = 0.2, .longitudeDelta = 0.2};
    MKCoordinateRegion objMapRegion = {objCoor2D, objCoorSpan};
    [self.MapApple setRegion:objMapRegion];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    latitude_UserLocation = newLocation.coordinate.latitude;
    longitude_UserLocation = newLocation.coordinate.longitude;
   
    if (currentLocation != nil) {
        [self loadMapView];

        NSLog(@"longitudeLabelvalue %@", [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude]);
       NSLog(@"letitudeLabelvalue %@", [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude]);
    }
    
   
    // Stop Location Manager
   // [locationManager stopUpdatingLocation];

    // Reverse Geocoding
    NSLog(@"Resolving the Address");
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            NSLog(@"letitudeLabelvalue %@", [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                 placemark.subThoroughfare, placemark.thoroughfare,
                                 placemark.postalCode, placemark.locality,
                                 placemark.administrativeArea,
                                 placemark.country]);
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
}

- (CLLocationCoordinate2D)coordinateWithLocation:(NSDictionary*)location
{
    double latitude = [[location objectForKey:@"lat"] doubleValue];
    double longitude = [[location objectForKey:@"lng"] doubleValue];
    
    return CLLocationCoordinate2DMake(latitude, longitude);
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation   *)userLocation
{
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.005, 0.005);
    MKCoordinateRegion region = MKCoordinateRegionMake(userLocation.location.coordinate, span);
    
    [self.MapApple setRegion:region];
    
    [self.MapApple setCenterCoordinate:userLocation.coordinate animated:YES];
   // NSString *baseUrl = [NSString stringWithFormat:@"http://maps.googleapis.com/maps/api/directions/json?origin=%f,%f&destination=%@&sensor=true", self.MapApple.userLocation.location.coordinate.latitude,  self.MapApple.userLocation.location.coordinate.longitude, @"24.1620661,72.394131"];
    
    
    NSString *baseUrl=@"http://maps.googleapis.com/maps/api/directions/json?origin=23.030000,72.580000&destination=23.400000,72.750000&sensor=true";
    
    NSURL *url = [NSURL URLWithString:[baseUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
    NSLog(@"%@",url);
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        NSError *error = nil;
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        NSArray *routes = [result objectForKey:@"routes"];
        NSLog(@"%@",routes);
        
        NSDictionary *firstRoute = [routes objectAtIndex:0];
        
        NSDictionary *leg =  [[firstRoute objectForKey:@"legs"] objectAtIndex:0];
        
        NSDictionary *end_location = [leg objectForKey:@"end_location"];
        
        NSLog(@"dDDDDDD>>>>>>%@",leg);
        double latitude = [[end_location objectForKey:@"lat"] doubleValue];
        double longitude = [[end_location objectForKey:@"lng"] doubleValue];
        
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(latitude, longitude);
        
        MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
        point.coordinate = coordinate;
        point.title =  [leg objectForKey:@"end_address"];
        point.subtitle = @"I'm here!!!";
        
        [self.MapApple addAnnotation:point];
        
        NSArray *steps = [leg objectForKey:@"steps"];
        
        int stepIndex = 0;
        
        CLLocationCoordinate2D stepCoordinates[1  + [steps count] + 1];
        
        stepCoordinates[stepIndex] = userLocation.coordinate;
        
        for (NSDictionary *step in steps) {
            
            NSDictionary *start_location = [step objectForKey:@"start_location"];
            stepCoordinates[++stepIndex] = [self coordinateWithLocation:start_location];
            
            if ([steps count] == stepIndex){
                NSDictionary *end_location = [step objectForKey:@"end_location"];
                stepCoordinates[++stepIndex] = [self coordinateWithLocation:end_location];
            }
        }
        
        MKPolyline *polyLine = [MKPolyline polylineWithCoordinates:stepCoordinates count:1 + stepIndex];
        [self.MapApple addOverlay:polyLine];
        
        CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake((userLocation.location.coordinate.latitude + coordinate.latitude)/2, (userLocation.location.coordinate.longitude + coordinate.longitude)/2);
        
    }];
}
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay
{
    MKPolylineView *polylineView = [[MKPolylineView alloc] initWithPolyline:overlay];
    polylineView.strokeColor = [UIColor colorWithRed:204/255. green:45/255. blue:70/255. alpha:1.0];
    polylineView.lineWidth = 1;
    
    return polylineView;
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    static NSString *annotaionIdentifier=@"annotationIdentifier";
    MKPinAnnotationView *aView=(MKPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:annotaionIdentifier ];
    if (aView==nil) {
        
        aView=[[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:annotaionIdentifier];
        aView.pinColor = MKPinAnnotationColorRed;
        aView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        //        aView.image=[UIImage imageNamed:@"arrow"];
        aView.animatesDrop=TRUE;
        aView.canShowCallout = YES;
        aView.calloutOffset = CGPointMake(-5, 5);
    }
    
    return aView;
}
@end
