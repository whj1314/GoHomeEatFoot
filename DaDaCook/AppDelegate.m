//
//  AppDelegate.m
//  DaDaCook
//
//  Created by tarena on 16/8/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "TRNetManager.h"

@import CoreLocation;

@interface AppDelegate ()<CLLocationManagerDelegate>
@property (nonatomic) CLLocationManager *locationManager;
@end
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self configSystem:launchOptions];
    [self.locationManager startUpdatingLocation];
    self.window.backgroundColor = [UIColor whiteColor];
    return YES;
}

- (CLLocationManager *)locationManager{
    if (!_locationManager) {
        _locationManager = [CLLocationManager new];
        _locationManager.delegate = self;
        if([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]){
            [_locationManager requestWhenInUseAuthorization];
        }
    }
    return _locationManager;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    if (locations.count > 0) {
        CLLocation *location = locations.firstObject;
        CLLocationCoordinate2D coordinate = location.coordinate;
        //如果是模拟器,强制指定当前位置是北京
        //因为城市不对，会导致无法刷新出附近的活动和广告等信息的情况
        if ([UIDevice currentDevice].isSimulator) {
            coordinate = CLLocationCoordinate2DMake(39.87639024522569, 116.4651410590278);
        }
        
        [[NSUserDefaults standardUserDefaults] setDouble:coordinate.latitude forKey:kCurrentLatitudeKey];
        [[NSUserDefaults standardUserDefaults] setDouble:coordinate.longitude forKey:kCurrentLongitudeKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        DDLogInfo(@"%@", location);
        [manager stopUpdatingLocation];
        manager = nil;
    }
}

@end









