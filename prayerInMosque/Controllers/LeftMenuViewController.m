//
//  LeftMenuViewController.m
//  prayerInMosque
//
//  Created by Humza Shahid on 03/05/2016.
//  Copyright © 2016 Humza Shahid. All rights reserved.
//

#import "LeftMenuViewController.h"

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
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    cellIdentifiers=[[NSArray alloc]initWithObjects:@"home",@"profile",@"invite",@"about",nil];
}

#pragma mark - tableview delegates
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row==4) {
        return 175;
    }
    else{
        return 50;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row==4){
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



@end
