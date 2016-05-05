//
//  MosqueDetailViewController.m
//  prayerInMosque
//
//  Created by Muhammad Jamshaid on 5/4/16.
//  Copyright © 2016 Humza Shahid. All rights reserved.
//

#import "MosqueDetailViewController.h"
#import "MosqueImageTableViewCell.h"
#import "AppColors.h"
#import "HeaderTableViewCell.h"
#import "DescriptionTableViewCell.h"
#import "PrayerTimeTableViewCell.h"
#import "MosqueAddressTableViewCell.h"
#import "ImamTableViewCell.h"

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)


@interface MosqueDetailViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    NSArray *images;
    MosqueImageTableViewCell *imgCell;
    
    
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation MosqueDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor navColor];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    images = [NSArray arrayWithObjects:@"mosaue1", @"mosque2",nil];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self imageScroll];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)imageScroll
{
    static NSString *simpleTableIdentifier = @"MosqueImageTableViewCell";
    imgCell = [self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    NSInteger numberOfViews = [images count];
    imgCell.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH *numberOfViews,SCREEN_WIDTH-1);
    for (int i = 0; i < numberOfViews; i++) {
        
        CGFloat xOrigin = i * [[[UIApplication sharedApplication] delegate] window].frame.size.width;
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(xOrigin, 0,SCREEN_WIDTH,SCREEN_WIDTH-1)];
        [image setImage:[UIImage imageNamed:[images objectAtIndex:i]]];

        [imgCell.scrollView addSubview:image];
        
        
        
    }
    [imgCell.contentView bringSubviewToFront:imgCell.pageControll];
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat pageWidth = imgCell.scrollView.frame.size.width;
    int page = floor((imgCell.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    imgCell.pageControll.currentPage = page;
    if( [imgCell.scrollView isDragging])
    {
        CGFloat pageWidth = imgCell.scrollView.frame.size.width;
        int page = floor((imgCell.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        imgCell.pageControll.currentPage = page;
    }
}




/////// table view delegate start////////

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0)
    {
        return 1;
        
    }else if(section == 1){
        return 1;
    }else if(section == 2){
        return 1;
    }else if(section == 3){
        return 1;
    }
    else
    {
      return 1;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0)
    {
    imgCell.pageControll.numberOfPages = [images count];
    return imgCell;
    }else if(indexPath.section==1){
        return [self createAddressCell:indexPath];

    }else if(indexPath.section==2){
        return [self basicCellAtIndexPath:indexPath];
        
    }
    else if(indexPath.section==3)
    {
        PrayerTimeTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"PrayerTimeTableViewCell" forIndexPath:indexPath];
        return cell;
    }else{
        
        ImamTableViewCell *cell      = [self.tableView dequeueReusableCellWithIdentifier:@"ImamTableViewCell" forIndexPath:indexPath];
        return cell;

    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0){
        return SCREEN_WIDTH;
    }else if(indexPath.section==2){
        
          return [self heightForBasicCellAtIndexPath:indexPath];
        
    }
    else if(indexPath.section==2)
    {
        return 150.0f;
    }else{
        return 123.0f;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(section==0)
    {
        return nil;
    }else{
        
        HeaderTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"HeaderTableViewCell"];
        
        switch (section) {
            case 1:
                cell.title.text = @"Address";
                break;
            case 2:
                cell.title.text = @"Description";
                break;
            case 3:
                cell.title.text = @"Prayer Time";
                break;
            case 4:
                cell.title.text = @"Imam";
                break;
           
        }
        return cell;
        
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 0;
    } else {
        return 44.0f;
    }
}




/////// table view delegate end////////


-(MosqueAddressTableViewCell *)createAddressCell:(NSIndexPath *)indexPath {
    MosqueAddressTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"MosqueAddressTableViewCell" forIndexPath:indexPath];
    
    [cell.lblAddress setAdjustsFontSizeToFitWidth:YES];
    
    return cell;

    
}


- (DescriptionTableViewCell *)basicCellAtIndexPath:(NSIndexPath *)indexPath {
    DescriptionTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"DescriptionTableViewCell" forIndexPath:indexPath];
    [self configureBasicCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureBasicCell:(DescriptionTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    
    NSString *desc = @"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.";
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:desc];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:10];
    [attrString addAttribute:NSParagraphStyleAttributeName
                       value:style
                       range:NSMakeRange(0, desc.length)];
    cell.lblDescription.attributedText = attrString;
    
    
   
}
- (CGFloat)heightForBasicCellAtIndexPath:(NSIndexPath *)indexPath {
    static DescriptionTableViewCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [self.tableView dequeueReusableCellWithIdentifier:@"DescriptionTableViewCell"];
        
        
        NSInteger width = [[[UIApplication sharedApplication] delegate] window].frame.size.width-46;
        
        // Width constraint
        [sizingCell.lblDescription addConstraint:[NSLayoutConstraint constraintWithItem:sizingCell.lblDescription
                                                                              attribute:NSLayoutAttributeWidth
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:nil
                                                                              attribute: NSLayoutAttributeNotAnAttribute
                                                                             multiplier:1
                                                                               constant:width]];
    });
    
    [self configureBasicCell:sizingCell atIndexPath:indexPath];
    return [self calculateHeightForConfiguredSizingCell:sizingCell];
}

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell {
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height + 1.0f; // Add 1.0f for the cell separator height
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
