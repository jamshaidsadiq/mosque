//
//  AppDelegate.m
//  prayerInMosque
//
//  Created by Humza Shahid on 03/05/2016.
//  Copyright © 2016 Humza Shahid. All rights reserved.
//

#import "AppDelegate.h"
#import <PKRevealController/PKRevealController.h>
#import "LeftMenuViewController.h"
#import "HomeViewController.h"
@interface AppDelegate () <PKRevealing>

#pragma mark - Properties
@property (nonatomic, strong, readwrite) PKRevealController *revealController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
     self.window.backgroundColor = [UIColor whiteColor];
    self.locationManager = [[CLLocationManager alloc] init];
    if(NSFoundationVersionNumber > NSFoundationVersionNumber_iOS_7_1)
    {
        if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [self.locationManager requestWhenInUseAuthorization];
        }
    }
    self.locationManager.delegate  = (id)self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    
      return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations
{
    
    //usermodel.deviceToken=@"<9b3400a1 d36f9833 c1938397 e8bf91b4 ba04223e 479f855b d17309ef 6b3f063a>";
   // CLLocation * updatedLocation=[locations lastObject];
//        NSLog(@"Delegate Called Latitude is: %f" , updatedLocation.coordinate.latitude);
//        NSLog(@"Delegate Called Longitude is: %f" , updatedLocation.coordinate.longitude);
    
}

-(void)initializePkRevealController
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    LeftMenuViewController * leftController = [[UIStoryboard storyboardWithName:@"Views" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"LeftMenuViewController"];
    
     // Step 1: Create your controllers.
    HomeViewController * homeController = [[UIStoryboard storyboardWithName:@"Views" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"HomeViewController"];
    UINavigationController * frontNavController = [[UINavigationController alloc] initWithRootViewController:homeController];
    
    // Step 2: Instantiate.
    self.revealController = [PKRevealController revealControllerWithFrontViewController:frontNavController
                                                                     leftViewController:leftController
                                                                    rightViewController:nil];
    // Step 3: Configure.
    self.revealController.delegate = self;
    self.revealController.animationDuration = .25;
    
    // Step 4: Apply.
    self.window.rootViewController = self.revealController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
  
}

@end
