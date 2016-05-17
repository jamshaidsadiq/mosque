//
//  HadithViewController.m
//  prayerInMosque
//
//  Created by Humza Shahid on 17/05/2016.
//  Copyright © 2016 Humza Shahid. All rights reserved.
//

#import "HadithViewController.h"
#import "CustomButton.h"
#import "AppColors.h"
#import "PKRevealController.h"
@interface HadithViewController ()
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UIButton *imageButton;
@end

@implementation HadithViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self designView];
    
}

-(void) designView
{
    [[CustomButton sharedMySingleton] createIconOnButton:@"\uf0c9" : _menuButton sizeOfIcon:20.0f colorOfIcon:[UIColor whiteColor]];
    
    _menuButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.view.backgroundColor=[UIColor viewbackGroundColor];
    
    self.imageButton.layer.cornerRadius=35.0f;
    self.imageButton.layer.masksToBounds=YES;
    self.imageButton.layer.borderColor=[UIColor colorWithRed:179/255.0f green:179/255.0f blue:179/255.0f alpha:1.0f].CGColor;
    self.imageButton.layer.borderWidth=1.0f;
    
}

- (IBAction)menu:(id)sender {
    [self.revealController showViewController:self.revealController.leftViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
