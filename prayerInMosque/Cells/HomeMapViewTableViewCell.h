//
//  HomeMapViewTableViewCell.h
//  prayerInMosque
//
//  Created by Muhammad Jamshaid on 5/12/16.
//  Copyright © 2016 Humza Shahid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface HomeMapViewTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
