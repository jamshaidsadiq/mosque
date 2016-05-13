//
//  ProfileViewController.m
//  SwiftBeans
//
//  Created by AHMAD ISHFAQ on 24/10/2014.
//  Copyright (c) 2014 AHMAD ISHFAQ. All rights reserved.
//

#import "ProfileViewController.h"
#import "CustomButton.h"
//#import "UserModel.h"
#import "AppColors.h"
#import "PKRevealController.h"
//#import "WebServiceDelegates.h"
//#import "UIImageView+WebCache.h"
@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UIButton *imageButton;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *textFieldsCollection;

@end

@implementation ProfileViewController
{
//    UserModel * userModel;
//    BOOL newImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    userModel=[UserModel getInstance];
    [self designView];
   // [self populateView];
    
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


//-(void)setImageView
//{
//    self.activityIndicator.hidden=NO;
//    [self.activityIndicator startAnimating];
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
//    [[CustomButton sharedMySingleton] downloadImageWithURL:[NSURL URLWithString:userModel.picture_url] completionBlock:^(BOOL succeeded, UIImage *image) {
//        if (succeeded) {
//            [self.imageButton setBackgroundImage:image forState:UIControlStateNormal];
//            self.activityIndicator.hidden=YES;
//            [self.activityIndicator removeFromSuperview];
//            userModel.userImage=image;
//            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//        }
//    }];
//}
-(BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


-(IBAction)uploadPicture:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:(id)self
                                  cancelButtonTitle:@"Cancel"
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"Choose From Library",@"Take a Photo" ,nil];
    actionSheet.actionSheetStyle = UIBarStyleBlackTranslucent;
    [actionSheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        if ([UIImagePickerController isSourceTypeAvailable:
             UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController *imagePicker =
            [[UIImagePickerController alloc] init];
            imagePicker.delegate = (id)self;
            imagePicker.sourceType =
            UIImagePickerControllerSourceTypeCamera;
       
            imagePicker.allowsEditing = YES;
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
    }else if (buttonIndex == 0)
    {
        if ([UIImagePickerController isSourceTypeAvailable:
             UIImagePickerControllerSourceTypeSavedPhotosAlbum])
        {
            UIImagePickerController *imagePicker =
            [[UIImagePickerController alloc] init];
            imagePicker.delegate = (id)self;
            imagePicker.sourceType =
            UIImagePickerControllerSourceTypePhotoLibrary;

            imagePicker.allowsEditing = YES;
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
        /*UIImagePickerController * picker = [[UIImagePickerController alloc] init];
         picker.delegate = self;
         picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
         [self presentModalViewController:picker animated:YES];
         [picker release]; */
        
    }
    
    if (!(buttonIndex == [actionSheet cancelButtonIndex])) {
        //NSString *msg = nil;
        
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)logOut:(id)sender {
    
  [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:[[NSBundle mainBundle] bundleIdentifier]];
    
    [[[UIApplication sharedApplication] delegate] window].rootViewController=[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"start" ];
}


- (IBAction)menu:(id)sender {
    [self.revealController showViewController:self.revealController.leftViewController];
}
- (IBAction)editButton:(id)sender {
    
    UIButton * button=(UIButton *)sender;
    [self.view endEditing:YES];
    switch (button.tag) {
        case 0:
        {
            button.tag=1;
            [button setTitle:@"SAVE" forState:UIControlStateNormal];
            
            for (UITextField * fields in self.textFieldsCollection) {
                fields.textColor=[UIColor blackColor];
                fields.enabled=YES;
            }
        }
            break;
            
        default:
        {
//            [self callService];
          
        break;
        }
            
    }
}



@end
