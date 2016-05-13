//
//  CustomButton.m
//  Grassp
//
//  Created by AHMAD ISHFAQ on 21/11/2013.
//  Copyright (c) 2013 Ahmad Ishfaq. All rights reserved.
//

#import "CustomButton.h"
#import "FontAwesomeKit.h"
@implementation CustomButton

static  CustomButton * _sharedMySingleton = nil;

+(CustomButton*)sharedMySingleton
{
    @synchronized([CustomButton class])
    {
        if (!_sharedMySingleton)
           _sharedMySingleton=[[self alloc] init];

        return _sharedMySingleton;
    }
    return nil;
}

+(id)alloc { @synchronized([CustomButton class])
    {
    NSAssert(_sharedMySingleton == nil, @"Attempted to allocate a second instance of a singleton."); _sharedMySingleton = [super alloc];
    return _sharedMySingleton; }
    
    return nil;
}


-(id)init {
    self = [super init];
    if (self != nil) { // initialize stuff here
    }
    //self.model=[ModelLocator getInstance];
    return self;
}
-(UIButton *) buttonCreateWhite :(UIButton *) whiteButton
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = whiteButton.bounds;
    CALayer *leftBorder = [CALayer layer];
    leftBorder.opacity=0.7f;
    leftBorder.frame = CGRectMake(0.0f, 0.0f,1.0f, whiteButton.frame.size.height);
    leftBorder.backgroundColor = [UIColor colorWithRed:88/255.0f green:88/255.0f blue:88/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:leftBorder];
    [whiteButton.layer addSublayer:gradient];
    [whiteButton setBackgroundImage:[UIImage imageNamed:@"btn2.png"] forState:UIControlStateNormal];
    [whiteButton setBackgroundImage:[UIImage imageNamed:@"btn2.png"] forState:UIControlStateHighlighted];
    [whiteButton setTitleColor:[UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0f] forState:UIControlStateNormal];
    return whiteButton;
}

-(UIButton *) buttonCreateGreen :(UIButton *) GreenButton
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    [GreenButton setBackgroundImage:[UIImage imageNamed:@"greenLine.png"] forState:UIControlStateNormal];
    CALayer *leftBorder = [CALayer layer];
    leftBorder.opacity=0.7f;
    leftBorder.frame = CGRectMake(0.0f, 0.0f,0.5f, GreenButton.frame.size.height);
    leftBorder.backgroundColor = [UIColor colorWithRed:135/255.0f green:175/255.0f blue:115/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:leftBorder];
    CALayer *rightBorder = [CALayer layer];
    rightBorder.opacity=0.7f;
    rightBorder.frame = CGRectMake(GreenButton.bounds.size.width, 0, 1, GreenButton.frame.size.height);
    rightBorder.backgroundColor = [UIColor colorWithRed:18/255.0f green:30/255.0f blue:12/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:rightBorder];
    [GreenButton.layer addSublayer:gradient];
    [GreenButton bringSubviewToFront:GreenButton.titleLabel];
    return GreenButton;
}

-(UIButton *) buttonCreateWhiteBig:(UIButton *)whiteButton
{
    [whiteButton setBackgroundImage:[UIImage imageNamed:@"whiteBigButton.png"] forState:UIControlStateNormal];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = whiteButton.bounds;
    CALayer *leftBorder = [CALayer layer];
    leftBorder.opacity=0.7f;
    leftBorder.frame = CGRectMake(0.0f, 0.0f,1.0f, whiteButton.frame.size.height);
    leftBorder.backgroundColor = [UIColor colorWithRed:104/255.0f green:104/255.0f blue:104/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:leftBorder];
    CALayer *rightBorder = [CALayer layer];
    rightBorder.opacity=0.7f;
    rightBorder.frame = CGRectMake(whiteButton.bounds.size.width, 0, 1, whiteButton.frame.size.height);
    rightBorder.backgroundColor = [UIColor colorWithRed:222/255.0f green:222/255.0f blue:222/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:rightBorder];
    if ([whiteButton.titleLabel.text isEqualToString:@"CANCEL"]) {
        CALayer *topBorder = [CALayer layer];
        topBorder.opacity=0.7f;
        topBorder.frame = CGRectMake(0, 0, whiteButton.frame.size.width, 3.0f);
        topBorder.backgroundColor = [UIColor colorWithRed:104/255.0f green:104/255.0f blue:104/255.0f alpha:1.0f].CGColor;
        [gradient addSublayer:rightBorder];
    }
    [whiteButton.layer addSublayer:gradient];
    
    return whiteButton;
}
-(UIButton *) buttondisable:(UIButton *)whiteButton
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = whiteButton.bounds;
    gradient.colors=[NSArray arrayWithObjects:
                     (id)[UIColor colorWithRed:93/255.0f green:93/255.0f blue:93/255.0f alpha:1.0f].CGColor,
                     (id)[UIColor colorWithRed:60/255.0f green:60/255.0f blue:60/255.0f alpha:1.0f].CGColor,
                     nil];
    CALayer *BottomBorder = [CALayer layer];
    BottomBorder.frame = CGRectMake(0.0f,whiteButton.frame.size.height-1, whiteButton.frame.size.width, 1.0f);
    BottomBorder.backgroundColor = [UIColor colorWithRed:130/255.0f green:130/255.0f blue:130/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:BottomBorder];
    CALayer *TopBorder = [CALayer layer];
    TopBorder.opacity=0.7f;
    TopBorder.frame = CGRectMake(0.0f, 0.0f, whiteButton.frame.size.width, 1.0f);
    TopBorder.backgroundColor = [UIColor colorWithRed:34/255.0f green:34/255.0f blue:34/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:TopBorder];
    [whiteButton.layer addSublayer:gradient];
    [whiteButton bringSubviewToFront:whiteButton.titleLabel];
    [whiteButton setTitleColor:[UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0F] forState:UIControlStateDisabled];
    [whiteButton.titleLabel setShadowColor:[UIColor colorWithRed:160/255.0f green:160/255.0f blue:160/255.0f alpha:1.0f]];
    CALayer *leftBorder = [CALayer layer];
    leftBorder.opacity=0.7f;
    leftBorder.frame = CGRectMake(0.0f, 0.0f,1.0f, whiteButton.frame.size.height-1);
    leftBorder.backgroundColor = [UIColor colorWithRed:34/255.0f green:34/255.0f blue:34/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:leftBorder];
    CALayer *rightBorder = [CALayer layer];
    rightBorder.opacity=0.7f;
    rightBorder.frame = CGRectMake(whiteButton.bounds.size.width-1, 0, 1, whiteButton.frame.size.height);
    rightBorder.backgroundColor = [UIColor colorWithRed:130/255.0f green:130/255.0f blue:130/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:rightBorder];
    whiteButton.layer.cornerRadius=3.0f;
    whiteButton.layer.masksToBounds=YES;
    return whiteButton;
}

-(UIButton *) greenColourful:(UIButton *)Button
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = Button.bounds;
    gradient.colors=[NSArray arrayWithObjects:
                      (id)[UIColor colorWithRed:63/255.0f green:227/255.0f blue:31/255.0f alpha:1.0f].CGColor,
                      (id)[UIColor colorWithRed:36/255.0f green:184/255.0f blue:9/255.0f alpha:1.0f].CGColor,
                      nil];
    CALayer *BottomBorder = [CALayer layer];
    BottomBorder.frame = CGRectMake(0.0f,Button.frame.size.height-1, Button.frame.size.width, 1.0f);
    BottomBorder.backgroundColor = [UIColor colorWithRed:111/255.0f green:214/255.0f blue:90/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:BottomBorder];
    CALayer *TopBorder = [CALayer layer];
    TopBorder.opacity=0.7f;
    TopBorder.frame = CGRectMake(0.0f, 0.0f, Button.frame.size.width, 1.0f);
    TopBorder.backgroundColor = [UIColor colorWithRed:30/255.0f green:97/255.0f blue:17/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:TopBorder];
    CALayer *leftBorder = [CALayer layer];
    leftBorder.opacity=0.7f;
    leftBorder.frame = CGRectMake(0.0f, 0.0f,1.0f, Button.frame.size.height-1);
    leftBorder.backgroundColor = [UIColor colorWithRed:30/255.0f green:97/255.0f blue:17/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:leftBorder];
    CALayer *rightBorder = [CALayer layer];
    rightBorder.opacity=0.7f;
    rightBorder.frame = CGRectMake(Button.bounds.size.width-1, 0, 1, Button.frame.size.height);
    rightBorder.backgroundColor = [UIColor colorWithRed:111/255.0f green:214/255.0f blue:90/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:rightBorder];
    [Button.layer addSublayer:gradient];
    [Button bringSubviewToFront:Button.titleLabel];
    Button.layer.cornerRadius=3.0f;
    Button.layer.masksToBounds=YES;
    return Button;
}
-(UIButton *) redColourful:(UIButton *)Button
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = Button.bounds;
    gradient.colors=[NSArray arrayWithObjects:
                      (id)[UIColor colorWithRed:228/255.0f green:11/255.0f blue:30/255.0f alpha:1.0f].CGColor,
                      (id)[UIColor colorWithRed:185/255.0f green:0/255.0f blue:8/255.0f alpha:1.0f].CGColor,
                      nil];
    CALayer *BottomBorder = [CALayer layer];
    BottomBorder.frame = CGRectMake(0.0f,Button.frame.size.height-1, Button.frame.size.width, 1.0f);
    BottomBorder.backgroundColor = [UIColor colorWithRed:212/255.0f green:85/255.0f blue:89/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:BottomBorder];
    CALayer *TopBorder = [CALayer layer];
    TopBorder.opacity=1.0f;
    TopBorder.frame = CGRectMake(0.0f, 0.0f, Button.frame.size.width, 1.0f);
    TopBorder.backgroundColor = [UIColor colorWithRed:80/255.0f green:11/255.0f blue:14/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:TopBorder];
    CALayer *leftBorder = [CALayer layer];
    leftBorder.opacity=0.7f;
    leftBorder.frame = CGRectMake(0.0f, 0.0f,1.0f, Button.frame.size.height-1);
    leftBorder.backgroundColor = [UIColor colorWithRed:80/255.0f green:11/255.0f blue:14/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:leftBorder];
    CALayer *rightBorder = [CALayer layer];
    rightBorder.opacity=0.7f;
    rightBorder.frame = CGRectMake(Button.bounds.size.width-1, 0, 1, Button.frame.size.height);
    rightBorder.backgroundColor = [UIColor colorWithRed:212/255.0f green:85/255.0f blue:89/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:rightBorder];
    [Button.layer addSublayer:gradient];
    [Button bringSubviewToFront:Button.titleLabel];
    return Button;
}

-(UIButton *) yellowColourful:(UIButton *)Button
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = Button.bounds;
    gradient.colors=[NSArray arrayWithObjects:
                      (id)[UIColor colorWithRed:231/255.0f green:211/255.0f blue:0/255.0f alpha:1.0f].CGColor,
                      (id)[UIColor colorWithRed:192/255.0f green:171/255.0f blue:2/255.0f alpha:1.0f].CGColor,
                      nil];
    CALayer *BottomBorder = [CALayer layer];
    BottomBorder.frame = CGRectMake(0.0f,Button.frame.size.height-1, Button.frame.size.width, 1.0f);
    BottomBorder.backgroundColor = [UIColor colorWithRed:218/255.0f green:204/255.0f blue:108/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:BottomBorder];
    CALayer *TopBorder = [CALayer layer];
    TopBorder.opacity=1.0f;
    TopBorder.frame = CGRectMake(0.0f, 0.0f, Button.frame.size.width, 1.0f);
    TopBorder.backgroundColor = [UIColor colorWithRed:97/255.0f green:86/255.0f blue:17/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:TopBorder];
    CALayer *leftBorder = [CALayer layer];
    leftBorder.opacity=0.7f;
    leftBorder.frame = CGRectMake(0.0f, 0.0f,1.0f, Button.frame.size.height-1);
    leftBorder.backgroundColor = [UIColor colorWithRed:97/255.0f green:86/255.0f blue:17/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:leftBorder];
    CALayer *rightBorder = [CALayer layer];
    rightBorder.opacity=0.7f;
    rightBorder.frame = CGRectMake(Button.bounds.size.width-1, 0, 1, Button.frame.size.height);
    rightBorder.backgroundColor = [UIColor colorWithRed:218/255.0f green:204/255.0f blue:108/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:rightBorder];
    
    [Button.layer addSublayer:gradient];
    [Button bringSubviewToFront:Button.titleLabel];
    Button.layer.cornerRadius=3.0f;
    Button.layer.masksToBounds=YES;
    return Button;
}

-(UIButton *) facebook:(UIButton *)Button
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = Button.bounds;
    gradient.colors=[NSArray arrayWithObjects:
                      (id)[UIColor colorWithRed:28/255.0f green:90/255.0f blue:138/255.0f alpha:1.0f].CGColor,
                      (id)[UIColor colorWithRed:29/255.0f green:81/255.0f blue:136/255.0f alpha:1.0f].CGColor,
                      nil];
    CALayer *BottomBorder = [CALayer layer];
    BottomBorder.frame = CGRectMake(0.0f,Button.frame.size.height, Button.frame.size.width, 1.0f);
    BottomBorder.backgroundColor = [UIColor colorWithRed:14/255.0f green:31/255.0f blue:49/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:BottomBorder];
    CALayer *TopBorder = [CALayer layer];
    TopBorder.opacity=0.7f;
    TopBorder.frame = CGRectMake(0.0f, 0.0f, Button.frame.size.width, 1.0f);
    TopBorder.backgroundColor = [UIColor colorWithRed:108/255.0f green:156/255.0f blue:184/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:TopBorder];
    
    CALayer *leftBorder = [CALayer layer];
    leftBorder.opacity=0.7f;
    leftBorder.frame = CGRectMake(0.0f, 0.0f,1.0f, Button.frame.size.height-1);
    leftBorder.backgroundColor = [UIColor colorWithRed:108/255.0f green:156/255.0f blue:184/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:leftBorder];
    CALayer *rightBorder = [CALayer layer];
    rightBorder.opacity=0.7f;
    rightBorder.frame = CGRectMake(Button.bounds.size.width-1, 0, 1, Button.frame.size.height);
    rightBorder.backgroundColor = [UIColor colorWithRed:14/255.0f green:31/255.0f blue:49/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:rightBorder];
    [Button.layer addSublayer:gradient];
    [Button bringSubviewToFront:Button.titleLabel];
    return Button;
}
-(UIButton *) twitter:(UIButton *)Button
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = Button.bounds;
    gradient.colors=[NSArray arrayWithObjects:
                      (id)[UIColor colorWithRed:39/255.0f green:138/255.0f blue:219/255.0f alpha:1.0f].CGColor,
                      (id)[UIColor colorWithRed:84/255.0f green:165/255.0f blue:251/255.0f alpha:1.0f].CGColor,
                      nil];
    CALayer *BottomBorder = [CALayer layer];
    BottomBorder.frame = CGRectMake(0.0f,Button.frame.size.height, Button.frame.size.width, 1.0f);
    BottomBorder.backgroundColor = [UIColor colorWithRed:33/255.0f green:59/255.0f blue:87/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:BottomBorder];
    CALayer *TopBorder = [CALayer layer];
    TopBorder.opacity=0.7f;
    TopBorder.frame = CGRectMake(0.0f, 0.0f, Button.frame.size.width, 1.0f);
    TopBorder.backgroundColor = [UIColor colorWithRed:110/255.0f green:184/255.0f blue:232/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:TopBorder];
    CALayer *leftBorder = [CALayer layer];
    leftBorder.opacity=0.7f;
    leftBorder.frame = CGRectMake(0.0f, 0.0f,1.0f, Button.frame.size.height-1);
    leftBorder.backgroundColor = [UIColor colorWithRed:110/255.0f green:184/255.0f blue:232/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:leftBorder];
    CALayer *rightBorder = [CALayer layer];
    rightBorder.opacity=0.7f;
    rightBorder.frame = CGRectMake(Button.bounds.size.width-1, 0, 1, Button.frame.size.height);
    rightBorder.backgroundColor = [UIColor colorWithRed:33/255.0f green:59/255.0f blue:87/255.0f alpha:1.0f].CGColor;
    [gradient addSublayer:rightBorder];
    [Button.layer addSublayer:gradient];
    [Button bringSubviewToFront:Button.titleLabel];
    return Button;
}
-(UITextField *) topBorder:(UITextField *)textField
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = textField.bounds;
    CALayer *TopBorder = [CALayer layer];
    TopBorder.opacity=0.7f;
    TopBorder.frame = CGRectMake(0.0f, 0.0f, textField.frame.size.width, 1.0f);
    TopBorder.backgroundColor = [UIColor colorWithRed:180.0/255.0 green:180.0/255.0 blue:180.0/255.0 alpha:1.0].CGColor;
    [gradient addSublayer:TopBorder];
    [textField.layer addSublayer:gradient];
    return textField;
}

-(UIView *)bottomBorder:(UIView *)textfield spaceFromleft:(CGFloat) spaceFromleft borderColor:(UIColor *) color lineWidth:(CGFloat) width lineHeight:(CGFloat) height lineOpacity:(CGFloat) opacity
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = textfield.bounds;
    CALayer *BottomBorder = [CALayer layer];
    BottomBorder.frame = CGRectMake(spaceFromleft,textfield.frame.size.height-1, width, height);
    BottomBorder.backgroundColor = color.CGColor;
    gradient.opacity=opacity;
    [gradient addSublayer:BottomBorder];
    [textfield.layer addSublayer:gradient];
    return  textfield;
}

-(UIView *)bottomBorder:(UIView *)textfield spaceFromleft:(CGFloat) spaceFromleft :(UIColor *) color
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = textfield.bounds;
    CALayer *BottomBorder = [CALayer layer];
    BottomBorder.frame = CGRectMake(spaceFromleft,textfield.frame.size.height-1, textfield.frame.size.width, 1.0f);
    BottomBorder.backgroundColor = color.CGColor;
    [gradient addSublayer:BottomBorder];
    [textfield.layer addSublayer:gradient];
    return  textfield;
}
-(UIView *)bottomBorder:(UIView *)textfield
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = textfield.bounds;
    CALayer *BottomBorder = [CALayer layer];
    BottomBorder.frame = CGRectMake(0.0f,textfield.frame.size.height-1, textfield.frame.size.width, 1.0f);
    BottomBorder.backgroundColor = [UIColor grayColor].CGColor;
    [gradient addSublayer:BottomBorder];
    [textfield.layer addSublayer:gradient];
    return  textfield;
}
-(UIView *) shadow:(UIView *)View :(CGSize) size
{
    View.layer.shadowColor = [[UIColor blackColor] CGColor];
    View.layer.shadowOffset = size;
    View.layer.shadowOpacity = 0.8;
    View.layer.shadowRadius=2.5f;
    return View;
}
-(UIButton *) backDown:(UIButton *) backButton
{
    if ([[UIScreen mainScreen] bounds].size.height!=480) {
        backButton.frame=CGRectMake(backButton.frame.origin.x, backButton.frame.origin.y+60
                                    , backButton.frame.size.width, backButton.frame.size.height);
    }
    return backButton;
}

-(UIView *) leftBorderwithTop:(UIView *)View :(UIColor *)color
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = View.bounds;
    CALayer *TopBorder = [CALayer layer];
    TopBorder.opacity=0.7f;
    TopBorder.frame = CGRectMake(0.0f, 0.0f, View.frame.size.width, 1.0f);
    TopBorder.backgroundColor = color.CGColor;
    [gradient addSublayer:TopBorder];
    CALayer *leftBorder = [CALayer layer];
    leftBorder.opacity=0.7f;
    leftBorder.frame = CGRectMake(0.0f, 0.0f,1.0f, View.frame.size.height-1);
    leftBorder.backgroundColor = color.CGColor;
    [gradient addSublayer:leftBorder];
    [View.layer addSublayer:gradient];
    return View;
}
-(UIView *) leftBorder :(UIView *) view :(UIColor *) color : (CGFloat) opacity
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = view.bounds;
    CALayer *rightBorder = [CALayer layer];
    rightBorder.opacity=opacity;
    rightBorder.frame = CGRectMake(0.0f, 0.0f,1.0f, view.frame.size.height-1);
    rightBorder.backgroundColor = color.CGColor;
    [gradient addSublayer:rightBorder];
    [view.layer addSublayer:gradient];
    return view;
}
-(UIView *) rightBorder :(UIView *) view :(UIColor *) color : (CGFloat) opacity
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = view.bounds;
    CALayer *rightBorder = [CALayer layer];
    rightBorder.opacity=opacity;
    rightBorder.frame = CGRectMake(view.bounds.size.width-1, 0, 1, view.frame.size.height);
    rightBorder.backgroundColor = color.CGColor;
    [gradient addSublayer:rightBorder];
    [view.layer addSublayer:gradient];
    return view;
}
-(UIView *) rightBorderwithBottom:(UIView *)View :(UIColor *)color
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = View.bounds;
    CALayer *BottomBorder = [CALayer layer];
    BottomBorder.frame = CGRectMake(0.0f,View.frame.size.height-1, View.frame.size.width, 1.0f);
    BottomBorder.backgroundColor = color.CGColor;
    [gradient addSublayer:BottomBorder];
    CALayer *rightBorder = [CALayer layer];
    rightBorder.opacity=0.7f;
    rightBorder.frame = CGRectMake(View.bounds.size.width-1, 0, 1, View.frame.size.height);
    rightBorder.backgroundColor = color.CGColor;
    [gradient addSublayer:rightBorder];
    [View.layer addSublayer:gradient];
    return View;
}
-(UIButton *) greenNew:(UIButton *)Button
{
    [Button setBackgroundColor:[UIColor colorWithRed:102/255.0f green:204/255.0f blue:51/255.0 alpha:1.0f]];
    [Button setTitleColor:[UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0f] forState:UIControlStateHighlighted];
    [Button setTitleColor:[UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1.0f] forState:UIControlStateNormal];
    return Button;
}
-(UIButton *) whiteNew:(UIButton *)Button
{
    [Button setBackgroundColor:[UIColor whiteColor]];
    [Button setTitleColor:[UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0f] forState:UIControlStateNormal];
    [Button setTitleColor:[UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1.0f] forState:UIControlStateHighlighted];
    return Button;
}
-(UIButton *) disabledNew:(UIButton *)Button
{
    [Button setBackgroundColor:[UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1.0f]];
    [Button setTitleColor:[UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1.0f] forState:UIControlStateNormal];
    return  Button;
}
-(UILabel *) changecolor:(UILabel *) Label
{
    Label.textColor=[UIColor colorWithRed:204/255.0f green:255/255.0f blue:0/255.0f alpha:1.0f];
    return Label;
}
-(UIButton *) greenDark:(UIButton *)Button
{
    [Button setBackgroundColor:[UIColor colorWithRed:51/255.0f green:102/255.0f blue:0/255.0 alpha:1.0f]];
    [Button setTitleColor:[UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0f] forState:UIControlStateHighlighted];
    [Button setTitleColor:[UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1.0f] forState:UIControlStateNormal];
    return Button;
}
-(UIButton *) facebookNew:(UIButton *) Button
{
    [Button setBackgroundImage:[UIImage imageNamed:@"facebook.png"] forState:UIControlStateNormal];
    [Button setTitleColor:[UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0f] forState:UIControlStateHighlighted];
    [Button setTitleColor:[UIColor colorWithRed:238/255.0f green:238/255.0f blue:238/255.0f alpha:1.0f] forState:UIControlStateNormal];
    return Button;
}
-(UITextField *) rightSpaceTextField :(UITextField *) textField :(float) width
{
    UIView * rightView=[[UIView alloc]init];
    if (width==0) {
        [rightView setFrame:CGRectMake(0, 0, 25, 20)];
    }
    else
    {
        [rightView setFrame:CGRectMake(0, 0, width, 20)];
    }
    
    textField.rightView = rightView;
    textField.rightViewMode = UITextFieldViewModeAlways;
    //textField.textColor=[UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1.0f];
    return textField;
}
-(UITextField *) leftSpaceTextField :(UITextField *) textField :(float) width
{
    UIView * leftView=[[UIView alloc]init];
    if (width==0) {
        [leftView setFrame:CGRectMake(0, 0, 25, 20)];
    }
    else
    {
        [leftView setFrame:CGRectMake(0, 0, width, 20)];
    }
    
    textField.leftView = leftView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    //textField.textColor=[UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1.0f];
    return textField;
}

-(UIButton *) createIconOnButton :(NSString *) string :(UIButton *) button sizeOfIcon:(float) fontSize colorOfIcon:(UIColor *) color
{
    [button setTitle:string forState:UIControlStateNormal];

    if (fontSize==0)
    {
        [button.titleLabel setFont:[FontAwesomeKit fontWithSize:18]];
    }
    else
    {
        [button.titleLabel setFont:[FontAwesomeKit fontWithSize:fontSize]];
    }

    [button setTitleColor:color forState:UIControlStateNormal];
    return  button;
}

-(UILabel *) createIconOnLabel :(NSString *) string :(UILabel *) label sizeOfIcon:(float) fontSize colorOfIcon:(UIColor *) color
{
    
    [label setText:string];
    if (fontSize==0)
    {
        [label setFont:[FontAwesomeKit fontWithSize:18]];
    }
    else
    {
        [label setFont:[FontAwesomeKit fontWithSize:fontSize]];
    }
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setTextColor:color];
    return  label;
}
-(UILabel *) createIconOnLabel:(NSString *) string :(UILabel *) label :(float) fontSize
{

//[label setText:string];
//    if (fontSize==0)
//    {
//        [label setFont:[FontAwesomeKit fontWithSize:18]];
//    }
//    else
//    {
//    [label setFont:[FontAwesomeKit fontWithSize:fontSize]];
//    }
//[label setFont:[FontAwesomeKit fontWithSize:18]];
//[label setTextAlignment:NSTextAlignmentCenter];
//[label setTextColor:[UIColor colorWithRed:[self.model.iconColor[0] floatValue]/255.0 green:[self.model.iconColor[1] floatValue]/255.0 blue:[self.model.iconColor[2] floatValue]/255.0 alpha:1.0]];
//    return  label;
    return nil;
}

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data1, NSError *error) {
                               if ( !error )
                               {
                                   UIImage *image = [[UIImage alloc] initWithData:data1];
                                   completionBlock(YES,image);
                               } else{
                                   completionBlock(NO,nil);
                               }
                           }];
}

-(NSString *) checkforNullvalue:(NSString *) string
{
    if ([string isEqualToString:@"<null>"]||[string  isEqualToString:@"(null)"] ||[string  isEqualToString:@"0000-00-00"] || [string  isEqualToString:@"0"] || string.length==0 ||
        string==nil ||[string isKindOfClass:[NSNull class]]) {
        string =@"";
    }
    return string ;
}
- (void) animateTextField: (UITextField*) textField up: (BOOL) up  viewToMove: (UIView *) view DistanceToMove:(int)distance AnimationDuration:(float) duration
{
    const int movementDistance = distance; // tweak as needed
    const float movementDuration = duration; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    view.frame = CGRectOffset(view.frame, 0, movement);
    [UIView commitAnimations];
}

-(void) adGradientToAnyView:(id) view FirstGradienColor:(UIColor *) firstColor SecondGradienColor:(UIColor *) secondColor
{
    UIView * myView=view;
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = myView.bounds;
    gradient.colors=[NSArray arrayWithObjects:
                     (id)firstColor.CGColor,
                     (id)secondColor.CGColor,
                     nil];
    [myView.layer addSublayer:gradient];
    
    if ([view isKindOfClass:[UIButton class]]) {
        UIButton * button=view;
        [button bringSubviewToFront:button.titleLabel];
    }
    
}
//-(void) FontToAnyView :(id) view FontName:(NSString *) fontName FontSize:(float) fontSize
//{
//    if ([view isKindOfClass:[UITextField class]]) {
//        UITextField * field=(UITextField *)view;
//        [field setFont:[UIFont fontWithName:fontName size:fontSize]];
//    }
//    else if ([view isKindOfClass:[UIButton class]])
//    {
//        UIButton * button=(UIButton *) view;
//        [button .titleLabel setFont:[UIFont fontWithName:fontName size:fontSize]];
//    }
//    else if ([view isKindOfClass:[UITextView class]])
//    {
//        UITextView * textView=(UITextView *) view;
//        [textView setFont:[UIFont fontWithName:fontName size:fontSize]];
//    }
//}
@end
