//
//  AppDelegate+Custom.m
//  GameLive
//
//  Created by tarena on 16/8/1.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AppDelegate+Custom.h"
#import <MLTransition.h>

@interface AppDelegate ()

@end

@implementation AppDelegate (Custom)

- (void)configSystem:(NSDictionary *)options{
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:YES];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    [UIImageView appearance].contentMode = UIViewContentModeScaleAspectFill;
    [UIImageView appearance].clipsToBounds = YES;
    
    /*********  添加日志功能   **********/
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
    /**********  修复自定义返回按钮后的手势滑动返回失效   ***********/
    [MLTransition validatePanBackWithMLTransitionGestureRecognizerType:MLTransitionGestureRecognizerTypeScreenEdgePan];
    
    /***********  所有通过AF发送的请求, 都会在电池条上出现菊花提示  ***********/
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    /***********  监听当前网络状态    *************/
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"%@", AFStringFromNetworkReachabilityStatus(status));
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    [self configGlobalUI];
}

/************** 配置全局的UI设置 *****************/
- (void)configGlobalUI{
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: kRGBA(235, 91, 51, 1)} forState:UIControlStateSelected];
}

- (BOOL)isOnline{
    return [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWWAN || [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWiFi;
}


- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
