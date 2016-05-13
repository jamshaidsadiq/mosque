//
//  HeroTableViewCell.h
//  prayerInMosque
//
//  Created by Muhammad Jamshaid on 5/9/16.
//  Copyright © 2016 Humza Shahid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblPoints;
@property (weak, nonatomic) IBOutlet UILabel *lblMonth;
@property (weak, nonatomic) IBOutlet UIImageView *userPhoto;

@end
