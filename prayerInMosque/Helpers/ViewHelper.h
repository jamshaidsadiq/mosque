//
//  ViewHelper.h
//  prayerInMosque
//
//  Created by Muhammad Jamshaid on 5/3/16.
//  Copyright © 2016 Humza Shahid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ViewHelper : NSObject
+(void)addLeftViewTextField:(UITextField *)textField;
+(void)roundCornerView:(UIView *)textField;
+(void)roundCornerButton:(UIButton *)button;
+(void)roundCornerTextField:(UITextField *)textField;
+(void) animateTextFieldUp:(BOOL)up viewToMove:(UIView *)view DistanceToMove:(int)distance AnimationDuration:(float) duration;
@end
