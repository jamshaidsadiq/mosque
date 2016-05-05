//
//  PrayerTimeTableViewCell.h
//  prayerInMosque
//
//  Created by Muhammad Jamshaid on 5/4/16.
//  Copyright © 2016 Humza Shahid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrayerTimeTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *lblTime;

@end
