//
//  LeftMenuViewController.m
//  prayerInMosque
//
//  Created by Humza Shahid on 03/05/2016.
//  Copyright © 2016 Humza Shahid. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "ProfileViewController.h"
#import "PKRevealController.h"
#import "AppColors.h"
#import "HadithViewController.h"
#import "HomeViewController.h"
@implementation LeftMenuViewController{
     NSArray *cellIdentifiers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // userModel=[UserModel getInstance];
    self.tableView.separatorColor=[UIColor clearColor];
    self.tableView.tableFooterView=[UIView new];
    self.tableView.backgroundColor=[UIColor clearColor];
    
    
}
-(void) viewWillAppear:(BOOL)animated{
    cellIdentifiers = [[NSArray alloc]initWithObjects:@"home",@"profile",@"invite",@"verse",@"quotes",@"about",nil];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.delegate = self;
    [self.tableView setAllowsSelection:YES];
}

#pragma mark - tableview delegates
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row==6) {
        return 175;
    }
    else{
        return 50;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row==6){
        UITableViewCell *cell;
        cell.contentView.backgroundColor=[UIColor clearColor];
        cell.backgroundColor=[UIColor clearColor];
        cell=[tableView dequeueReusableCellWithIdentifier:@"bottomCell"];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
        
    }
    else{
        UITableViewCell *cell;
        cell.contentView.backgroundColor=[UIColor clearColor];
        cell.backgroundColor=[UIColor clearColor];
        cell=[tableView dequeueReusableCellWithIdentifier:[cellIdentifiers objectAtIndex:indexPath.row]];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
}



- (IBAction)pushToController:(UIButton*)sender {
    if (sender.tag == 1){
        [self pushToHomeView];
    }else if (sender.tag == 3){
        [self pushToProfileView];
    }else if (sender.tag == 4){
        [self pushToHadithView];
    }
}
-(void) pushToHomeView{
    HomeViewController * controller=[[UIStoryboard storyboardWithName:@"Views" bundle:nil] instantiateViewControllerWithIdentifier:@"HomeViewController"];
    
    UINavigationController * navController=[[UINavigationController alloc] initWithRootViewController:controller];
    navController.navigationController.navigationBar.alpha=0.85;
    navController.navigationBar.barTintColor = [UIColor navBarColor];
    self.revealController.frontViewController = navController;
    [self.revealController showViewController:self.revealController.frontViewController];
}
-(void)pushToHadithView{
    HadithViewController * controller=[[UIStoryboard storyboardWithName:@"Views" bundle:nil] instantiateViewControllerWithIdentifier:@"HadithViewController"];
    
    UINavigationController * navController=[[UINavigationController alloc] initWithRootViewController:controller];
    navController.navigationController.navigationBar.alpha=0.85;
    navController.navigationBar.barTintColor = [UIColor navBarColor];
    self.revealController.frontViewController = navController;
    [self.revealController showViewController:self.revealController.frontViewController];
}
-(void) pushToProfileView{
    ProfileViewController * controller=[[UIStoryboard storyboardWithName:@"Views" bundle:nil] instantiateViewControllerWithIdentifier:@"ProfileViewController"];
    
    UINavigationController * navController=[[UINavigationController alloc] initWithRootViewController:controller];
    navController.navigationController.navigationBar.alpha=0.85;
    navController.navigationBar.barTintColor = [UIColor navBarColor];
    self.revealController.frontViewController = navController;
    [self.revealController showViewController:self.revealController.frontViewController];
}
@end
