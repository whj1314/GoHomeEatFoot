//
//  TRKitchenMapViewController.m
//  DaDaCook
//
//  Created by tarena on 16/8/26.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRKitchenMapViewController.h"
#import <MapKit/MapKit.h>

@interface TRKitchenMapViewController ()<MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
//是否已经定位过, 防止移动时重新定位
@property (nonatomic) BOOL isLocation;
@end

@implementation TRKitchenMapViewController
- (IBAction)backBtnClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _isLocation = NO;
    MKPointAnnotation *annotation = [MKPointAnnotation new];
    annotation.coordinate = self.coordinate;
    [_mapView addAnnotation:annotation];
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    if (_isLocation == NO) {
        MKCoordinateSpan span = MKCoordinateSpanMake(.01, .01);
        MKCoordinateRegion region = MKCoordinateRegionMake(userLocation.location.coordinate, span);
        [mapView setRegion:region animated:YES];
        _isLocation = YES;
    }
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    static NSString *identify = @"annotation";
    MKAnnotationView *annoView = [mapView dequeueReusableAnnotationViewWithIdentifier:identify];
    if (annoView == nil) {
        annoView = [[MKAnnotationView alloc] initWithAnnotation:nil reuseIdentifier:identify];
        annoView.image = [UIImage imageNamed:@"地址"];
    }
    annoView.annotation = annotation;
    return annoView;
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

@end
