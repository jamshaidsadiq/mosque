//
//  HomeViewController.m
//  prayerInMosque
//
//  Created by Humza Shahid on 03/05/2016.
//  Copyright © 2016 Humza Shahid. All rights reserved.
//

#import "HomeViewController.h"
#import <PKRevealController.h>
#import "AppColors.h"
#import "HomeListViewTableViewCell.h"
#import "ViewHelper.h"
#import <MapKit/MapKit.h>
#import "HomeMapViewTableViewCell.h"
#import "MosqueDetailViewController.h"


#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate,MKMapViewDelegate>
{
    BOOL is_mapView;
    HomeMapViewTableViewCell *mapCell;
}
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *buttonCheckin;

@end


@implementation HomeViewController

@synthesize segmentedControl,tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.barTintColor = [UIColor navBarColor];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    UIImage *image = [UIImage imageNamed:@"logo"];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:image];
    
    tableView.tableFooterView = [[UIView alloc] init];
    
    [ViewHelper roundCornerButton:self.buttonCheckin];
    
    is_mapView = true;
    
    [self createMapViewCell];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeView:(id)sender {
    
    is_mapView = !is_mapView;
    [tableView reloadData];
}


- (IBAction)openMenu:(id)sender {
    [self.navigationController.revealController showViewController:self.navigationController.revealController.leftViewController];
}

/////// table view delegate start////////

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (is_mapView) {
        return 1;
    }else{
        return 10;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (is_mapView) {
        
        return mapCell;
        
    }else{
    static NSString *simpleTableIdentifier = @"HomeListViewTableViewCell";
    
    HomeListViewTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[HomeListViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
       return cell;
        
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (is_mapView) {
    return SCREEN_HEIGHT-114;
    }else
    {
        return 83.0f;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(!is_mapView)
    {
        MosqueDetailViewController *mosqueDetail = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MosqueDetailViewController"];
        
        [self.navigationController pushViewController:mosqueDetail animated:YES];

    }
}

//////////////// table view delegate end //////////////////


-(void)createMapViewCell
{
    static NSString *simpleTableIdentifier = @"HomeMapViewTableViewCell";
    
    mapCell = [self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (mapCell == nil) {
        mapCell = [[HomeMapViewTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    mapCell.mapView.delegate = (id)self;
   
    [mapCell.mapView setMapType:MKMapTypeStandard];
    [mapCell.mapView setZoomEnabled:YES];
    [mapCell.mapView setScrollEnabled:YES];
    [mapCell.mapView setUserTrackingMode:MKUserTrackingModeFollow];
   
    
}


//////////////// Map view delegate start //////////////////

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    region.span.latitudeDelta = 10;
    region.span.longitudeDelta = 10;
    [mapCell.mapView setRegion:[mapCell.mapView regionThatFits:region] animated:NO];
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    
    point.coordinate = userLocation.coordinate;
    [mapCell.mapView addAnnotation:point];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
        static NSString * const identifier = @"MyCustomAnnotation";
        
        MKAnnotationView* annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (annotationView) {
            annotationView.annotation = annotation;
        } else {
            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation
                                                          reuseIdentifier:identifier];
        }
        
        // set your annotationView properties
        
        annotationView.image = [UIImage imageNamed:@"annotation"];
        annotationView.canShowCallout = YES;
        
        // if you add QuartzCore to your project, you can set shadows for your image, too
        //
        // [annotationView.layer setShadowColor:[UIColor blackColor].CGColor];
        // [annotationView.layer setShadowOpacity:1.0f];
        // [annotationView.layer setShadowRadius:5.0f];
        // [annotationView.layer setShadowOffset:CGSizeMake(0, 0)];
        // [annotationView setBackgroundColor:[UIColor whiteColor]];
        
        return annotationView;
    
}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    MosqueDetailViewController *mosqueDetail = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MosqueDetailViewController"];
    
    [self.navigationController pushViewController:mosqueDetail animated:YES];
  
    
}

@end
