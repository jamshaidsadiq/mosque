//
//  ViewController.m
//  prayerInMosque
//
//  Created by Humza Shahid on 03/05/2016.
//  Copyright © 2016 Humza Shahid. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "ViewHelper.h"
#import "LoginViewController.h"
#import "SignUpViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *overLayView1;
@property (weak, nonatomic) IBOutlet UITextField *textFamilyCode;
@property (weak, nonatomic) IBOutlet UIButton *buttonSignin;
@property (weak, nonatomic) IBOutlet UIView *overLayView2;
@property (weak, nonatomic) IBOutlet UIButton *buttonLoginWithemail;
@property (weak, nonatomic) IBOutlet UIButton *buttonSignup;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    }

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
    [ViewHelper roundCornerButton:self.buttonSignin];
    [ViewHelper roundCornerView:self.overLayView1];
    [ViewHelper roundCornerTextField:self.textFamilyCode];
    [ViewHelper addLeftViewTextField:self.textFamilyCode];
    [ViewHelper roundCornerButton:self.buttonLoginWithemail];
    [ViewHelper roundCornerView:self.overLayView2];
    [ViewHelper roundCornerButton:self.buttonSignup];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonPressed:(id)sender {
    
    [(AppDelegate *)[[UIApplication sharedApplication] delegate] initializePkRevealController];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
    
}

- (IBAction)signIn:(id)sender {
    
    LoginViewController *loginVc = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    
    [self.navigationController pushViewController:loginVc animated:YES];
    
}

- (IBAction)signup:(id)sender {
    
    SignUpViewController *signupVc = [self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    
    [self.navigationController pushViewController:signupVc animated:YES];
    
}



/////// Text Field Delegate Start

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [ViewHelper animateTextFieldUp:YES viewToMove:self.view DistanceToMove:150 AnimationDuration:0.3];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
   [ViewHelper animateTextFieldUp:NO viewToMove:self.view DistanceToMove:150 AnimationDuration:0.3];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}



/////// Text Field Delegate End

@end
