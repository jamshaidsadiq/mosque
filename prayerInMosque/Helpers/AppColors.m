//
//  AppColors.m
//  Pusher
//
//  Created by AHMAD ISHFAQ on 09/10/2014.
//  Copyright (c) 2014 AHMAD ISHFAQ. All rights reserved.
//

#import "AppColors.h"

@implementation UIColor (MyColors)

+ (UIColor *)navBarColor
{
    return [UIColor colorWithRed:166.0/255.0 green:224/255.0 blue:164/255.0 alpha:1.0];
    
}


+ (UIColor *)viewbackGroundColor
{
   return [UIColor colorWithRed:247.0/255.0f green:247.0/255.0f blue:247.0/255.0f alpha:1.0f];
}

+ (UIColor *) mapListSelectedButtonBackgroundColor
{
return [UIColor colorWithRed:73.0/255.0f green:143.0/255.0f blue:152.0/255.0f alpha:1.0f];
}
+ (UIColor *) mapListUnSelectedButtonBackgroundColor
{
    return [UIColor colorWithRed:110/255.0f green:184/255.0f blue:194/255.0f alpha:1.0f];
}
+ (UIColor *) mapListUnSelectedButtonTextColor
{
    return [UIColor colorWithRed:80.0/255.0f green:151.0/255.0f blue:160.0/255.0f alpha:1.0f];
}

+ (UIColor *) favouriteCellBackGroundColor
{
    return [UIColor colorWithRed:236/255.0f green:236/255.0f blue:236/255.0f alpha:1.0f];
}
+ (UIColor *) cellSeperatorColor
{
    return [UIColor colorWithRed:220/255.0f green:220/255.0f blue:220/255.0f alpha:1.0f];
}

+ (UIColor *) menuSelectedColor
{
    return [UIColor colorWithRed:73/255.0f green:143/255.0f blue:152/255.0f alpha:1.0f];
}
+ (UIColor *) menuUnSelectedColor
{
    return [UIColor colorWithRed:110/255.0f green:184/255.0f blue:194/255.0f alpha:1.0f];
}

+ (UIColor *) menuUnSelectedTextColor
{
     return [UIColor colorWithRed:73/255.0f green:143/255.0f blue:152/255.0f alpha:1.0f];
}

+ (UIColor *) disabledCupColor
{
    return [UIColor colorWithRed:218/255.0f green:217/255.0f blue:216/255.0f alpha:1.0f];
}
+ (UIColor *) enabledCupColor
{
    return [UIColor colorWithRed:71/255.0f green:66/255.0f blue:62/255.0f alpha:1.0f];
}

@end
