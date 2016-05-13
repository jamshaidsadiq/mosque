//
//  FontClass.h
//  SwiftBeans
//
//  Created by AHMAD ISHFAQ on 16/10/2014.
//  Copyright (c) 2014 AHMAD ISHFAQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (MyColors)

+ (UIFont *) Montserrat :(float) size MakeBold:(BOOL) bold;
+ (UIFont *) Lora :(float) size MakeBold:(BOOL) bold;
+ (UIFont *) OpenSansRegular :(float) size;

@end