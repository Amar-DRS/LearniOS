//
//  DRSGoogleMapVCViewController.h
//  LearniOS
//
//  Created by Apple on 23/08/16.
//  Copyright © 2016 AmarDRS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>



@interface DRSGoogleMapVCViewController : UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager * locationManager;
    GMSMapView *mapView;
    GMSMarker *marker;
}
@end
