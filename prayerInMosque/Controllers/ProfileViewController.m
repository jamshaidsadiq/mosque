//
//  ProfileViewController.m
//  SwiftBeans
//
//  Created by AHMAD ISHFAQ on 24/10/2014.
//  Copyright (c) 2014 AHMAD ISHFAQ. All rights reserved.
//

#import "ProfileViewController.h"
#import "CustomButton.h"
#import "AppColors.h"
#import "PKRevealController.h"
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

}

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
        
        
    }
    
    if (!(buttonIndex == [actionSheet cancelButtonIndex])) {
        
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


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
//        [self callService];
          
        break;
        }
            
    }
}



@end
