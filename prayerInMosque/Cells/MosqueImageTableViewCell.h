//
//  MosqueImageTableViewCell.h
//  prayerInMosque
//
//  Created by Muhammad Jamshaid on 5/4/16.
//  Copyright © 2016 Humza Shahid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MosqueImageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControll;

@end
