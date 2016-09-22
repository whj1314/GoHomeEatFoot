//
//  Constants.h
//  GameLive
//
//  Created by tarena on 16/8/1.
//  Copyright © 2016年 tarena. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

#import "AppDelegate.h"
/********** 快捷获取当前进程的代理对象指针 ************/
#define kAppDelegate  ((AppDelegate *)[UIApplication sharedApplication].delegate)

/*******    屏幕的宽高   *********/
#define kScreenW    ([UIScreen mainScreen].bounds.size.width)
#define kScreenH    ([UIScreen mainScreen].bounds.size.height)

/********   快速三原色定制颜色   *********/
#define kRGBA(r, g, b, a) ([UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a])

/********* 去掉Cell分割线的左边距   *************/
#define kRemoveLeftSeparator(cell) \
cell.separatorInset = UIEdgeInsetsZero;\
cell.layoutMargins = UIEdgeInsetsZero;\
cell.preservesSuperviewLayoutMargins = NO;\

//登录状态发生变化时的通知
#define kLoginStateChangedNotification  @"kLoginStateChangedNotification"

//保存登录密码
#define kSavePwd(pwd) [YYKeychain setPassword:pwd forService:@"GameLive" account:@"account"];
//是否已登录
#define kIsLogin ([YYKeychain getPasswordForService:@"GameLive" account:@"account"] != nil)
//退出登录
#define kLogout [YYKeychain deletePasswordForService:@"GameLive" account:@"account"];


/*********** NSUserDefaults keys **************/
/** 保存当前经度 */
#define kCurrentLongitudeKey @"kCurrentLongitudeKey"
/** 保存当前纬度 */
#define kCurrentLatitudeKey @"kCurrentLatitudeKey"


#endif /* Constants_h */
