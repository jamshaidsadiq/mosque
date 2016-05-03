//
//  SignUpViewController.m
//  prayerInMosque
//
//  Created by Muhammad Jamshaid on 5/3/16.
//  Copyright © 2016 Humza Shahid. All rights reserved.
//

#import "SignUpViewController.h"
#import "ViewHelper.h"

@interface SignUpViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *overLayView1;
@property (weak, nonatomic) IBOutlet UITextField *textEmail;
@property (weak, nonatomic) IBOutlet UITextField *textPassword;
@property (weak, nonatomic) IBOutlet UIButton *buttonSignIn;
@property (weak, nonatomic) IBOutlet UIButton *buttonFacebook;
@property (weak, nonatomic) IBOutlet UIButton *buttonSignup;
@property (weak, nonatomic) IBOutlet UIView *overLayView2;
@property (weak, nonatomic) IBOutlet UITextField *textFullName;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self updateDesign];
}

-(void)updateDesign
{
    [ViewHelper roundCornerButton:self.buttonSignIn];
    [ViewHelper roundCornerView:self.overLayView1];
    [ViewHelper roundCornerTextField:self.textEmail];
    [ViewHelper roundCornerTextField:self.textPassword];
    [ViewHelper addLeftViewTextField:self.textEmail];
    [ViewHelper addLeftViewTextField:self.textPassword];
    [ViewHelper roundCornerButton:self.buttonSignup];
    [ViewHelper roundCornerView:self.overLayView2];
    [ViewHelper roundCornerButton:self.buttonSignup];
    [ViewHelper roundCornerButton:self.buttonFacebook];
    
    [ViewHelper roundCornerTextField:self.textFullName];
    [ViewHelper addLeftViewTextField:self.textFullName];
    
    self.textPassword.secureTextEntry = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)signInButtonPressed:(id)sender {
}
- (IBAction)back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
