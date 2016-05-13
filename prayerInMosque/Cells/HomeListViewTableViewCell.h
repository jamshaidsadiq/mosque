//
//  HomeListViewTableViewCell.h
//  prayerInMosque
//
//  Created by Muhammad Jamshaid on 5/12/16.
//  Copyright © 2016 Humza Shahid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeListViewTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *masjidPhoto;
@property (weak, nonatomic) IBOutlet UILabel *mosqueName;
@property (weak, nonatomic) IBOutlet UILabel *mosqueAddress;

@end
