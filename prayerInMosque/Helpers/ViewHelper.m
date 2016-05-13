//
//  ViewHelper.m
//  prayerInMosque
//
//  Created by Muhammad Jamshaid on 5/3/16.
//  Copyright © 2016 Humza Shahid. All rights reserved.
//

#import "ViewHelper.h"

@implementation ViewHelper

+(void)addLeftViewTextField:(UITextField *)textField
{
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 17, 20)];
    textField.leftView = paddingView;
    textField.leftViewMode = UITextFieldViewModeAlways;
}

+(void)roundCornerView:(UIView *)view
{
    view.layer.cornerRadius = 5;
    view.layer.masksToBounds = YES;
}

+(void)roundCornerButton:(UIButton *)button
{
    button.layer.cornerRadius = 5;
    button.layer.masksToBounds = YES;
}

+(void)roundCornerTextField:(UITextField *)textField
{
    textField.layer.cornerRadius = 5;
    textField.layer.masksToBounds = YES;
}

+(void)addButtonSeparator:(UIButton *)button
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = button.bounds;
    CALayer *leftBorder = [CALayer layer];
    leftBorder.opacity=0.7f;
    leftBorder.frame = CGRectMake(0.0f, 10.0f,5.0f, 17);
    //leftBorder.backgroundColor = [UIColor colorWithRed:191/255.0f green:191/255.0f blue:191/255.0f alpha:1.0f].CGColor;
    leftBorder.backgroundColor = [UIColor redColor].CGColor;
    [gradient addSublayer:leftBorder];
    [button.layer addSublayer:gradient];
}


+(void) animateTextFieldUp:(BOOL)up viewToMove:(UIView *)view DistanceToMove:(int)distance AnimationDuration:(float) duration
{
    const int movementDistance = distance;
    const float movementDuration = duration;
    int movement = (up ? -movementDistance : movementDistance);
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    view.frame = CGRectOffset(view.frame, 0, movement);
    [UIView commitAnimations];
}

@end
