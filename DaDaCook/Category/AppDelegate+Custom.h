//
//  AppDelegate+Custom.h
//  GameLive
//
//  Created by tarena on 16/8/1.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Custom)
- (void)configSystem:(NSDictionary *)options;
@property (nonatomic, readonly, getter=isOnline) BOOL online;
@end
