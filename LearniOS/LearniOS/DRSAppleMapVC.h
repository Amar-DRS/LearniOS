//
//  DRSAppleMapVC.h
//  LearniOS
//
//  Created by Apple on 22/08/16.
//  Copyright © 2016 AmarDRS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface DRSAppleMapVC : UIViewController<CLLocationManagerDelegate,MKMapViewDelegate>
{
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
    double latitude_UserLocation, longitude_UserLocation;


}
@property (weak, nonatomic) IBOutlet MKMapView *MapApple;
@property (nonatomic, retain) MKPolyline *routeLine;
@property (nonatomic, retain) MKPolylineView *routeLineView;
- (IBAction)getCurrentLocation:(id)sender;
-(void)LoadMapRoute;

@end
