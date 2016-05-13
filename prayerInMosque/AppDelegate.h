//
//  AppDelegate.h
//  prayerInMosque
//
//  Created by Humza Shahid on 03/05/2016.
//  Copyright © 2016 Humza Shahid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
-(void)initializePkRevealController;
@property (strong,nonatomic) CLLocationManager * locationManager;
@end

