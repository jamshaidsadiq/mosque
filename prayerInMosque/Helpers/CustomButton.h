//
//  CustomButton.h
//  Grassp
//
//  Created by AHMAD ISHFAQ on 21/11/2013.
//  Copyright (c) 2013 Ahmad Ishfaq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import "ModelLocator.h"
@interface CustomButton : NSObject{
}
+(CustomButton *)sharedMySingleton;
//@property (strong,nonatomic) ModelLocator * model;
-(UIButton *) buttonCreateWhite :(UIButton *) whiteButton;
-(UIButton *) buttonCreateGreen :(UIButton *) GreenButton;
-(UIButton *) buttonCreateWhiteBig:(UIButton *)whiteButton;
-(UIButton *) buttondisable:(UIButton *)whiteButton;
-(UIButton *) greenColourful:(UIButton *)Button;
-(UIButton *) redColourful:(UIButton *)Button;
-(UIButton *) yellowColourful:(UIButton *)Button;
-(UIButton *) facebook:(UIButton *)Button;
-(UIButton *) twitter:(UIButton *)Button;
-(UIView *) shadow:(UIView *)View :(CGSize) size;
-(UIView *) topBorder:(UIView *)textField;
-(UIView *)bottomBorder:(UIView *)textfield;
-(UIButton *) backDown:(UIButton *) backButton;
-(UIView *) leftBorderwithTop:(UIView *)View :(UIColor *)color;
-(UIView *) rightBorderwithBottom:(UIView *)View :(UIColor *)color;
-(UIButton *) greenNew:(UIButton *)Button;
-(UIButton *) whiteNew:(UIButton *)Button;
-(UILabel *) changecolor:(UILabel *) Label;
-(UIButton *) disabledNew:(UIButton *)Button;
-(UIButton *) greenDark:(UIButton *)Button;
-(UIButton *) facebookNew:(UIButton *) Button;
-(UITextField *) leftSpaceTextField :(UITextField *) textField :(float) width;
-(UILabel *) createIconOnLabel:(NSString *) string :(UILabel *) label :(float) fontSize;
-(UIView *)bottomBorder:(UIView *)textfield spaceFromleft:(CGFloat) spaceFromleft :(UIColor *) color;
-(UIView *)bottomBorder:(UIView *)textfield spaceFromleft:(CGFloat) spaceFromleft borderColor:(UIColor *) color lineWidth:(CGFloat) width lineHeight:(CGFloat) height lineOpacity:(CGFloat) opacity;
-(UITextField *) rightSpaceTextField :(UITextField *) textField :(float) width;
-(UILabel *) createIconOnLabel :(NSString *) string :(UILabel *) label sizeOfIcon:(float) fontSize colorOfIcon:(UIColor *) color;
-(UIButton *) createIconOnButton :(NSString *) string :(UIButton *) button sizeOfIcon:(float) fontSize colorOfIcon:(UIColor *) color;
-(UIView *) rightBorder :(UIView *) view :(UIColor *) color : (CGFloat) opacity;
- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock;
-(NSString *) checkforNullvalue:(NSString *) string;
-(UIView *) leftBorder :(UIView *) view :(UIColor *) color : (CGFloat) opacity;
- (void) animateTextField: (UITextField*) textField up: (BOOL) up  viewToMove: (UIView *) view DistanceToMove:(int)distance AnimationDuration:(float) duration;
-(void) adGradientToAnyView:(id) view FirstGradienColor:(UIColor *) firstColor SecondGradienColor:(UIColor *) secondColor;

//-(void) FontToAnyView :(id) view FontName:(NSString *) fontName FontSize:(float) fontSize;
@end
