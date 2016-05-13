//
//  FontClass.m
//  SwiftBeans
//
//  Created by AHMAD ISHFAQ on 16/10/2014.
//  Copyright (c) 2014 AHMAD ISHFAQ. All rights reserved.
//

#import "FontClass.h"

@implementation UIFont (MyColors)

+ (UIFont *) Montserrat :(float) size MakeBold:(BOOL) bold
{
    if (bold==YES) {
        return [UIFont fontWithName:@"Montserrat-Bold" size:size];
    }
   
    return [UIFont fontWithName:@"Montserrat-Regular" size:size];
    
}

+ (UIFont *) Lora :(float) size MakeBold:(BOOL) bold
{
    if (bold==YES) {
        return [UIFont fontWithName:@"Lora-Bold" size:size];
    }
    
    return [UIFont fontWithName:@"Lora-Italic" size:size];
}

+ (UIFont *) OpenSansRegular :(float) size
{
return [UIFont fontWithName:@"OpenSans_Regular" size:size];
}
@end
