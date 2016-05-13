//
//  MyPointsViewController.m
//  prayerInMosque
//
//  Created by Muhammad Jamshaid on 5/6/16.
//  Copyright © 2016 Humza Shahid. All rights reserved.
//

#import "MyPointsViewController.h"
#import "ViewHelper.h"
#import "AppColors.h"

@interface MyPointsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *pointsButtons;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MyPointsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor navBarColor];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
    
   
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    
    UIButton *btnTapped = sender;
    for (UIButton * btn in self.pointsButtons) {
        
        [btn setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }
    
    [btnTapped setBackgroundColor:[UIColor whiteColor]];
    [btnTapped setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

}

/////// table view delegate start////////

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = @"My Points: 1000";
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
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
