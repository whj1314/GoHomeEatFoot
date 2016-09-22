//
//  TRNetManager.h
//  DaDaCook
//
//  Created by tarena on 16/8/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseNetworking.h"
#import "TRUFocusListModel.h"
#import "TRActivityModel.h"
#import "TRHomePageModel.h"
#import "TRDetailModel.h"
#import "TRDetailTagsModel.h"
#import "TRDishListModel.h"
#import "TRLastCommentModel.h"

@interface TRNetManager : BaseNetworking
/** 首页广告 */
+ (id)getFocusListCompletionHandler:(void(^)(TRUFocusListModel *model, NSError *error))completionHandler;
//首页活动
+ (id)getActivityCompletionHandler:(void(^)(TRActivityModel *model, NSError *error))completionHandler;

//首页内容
+ (id)getHomePageInPage:(NSInteger)page completionHandler:(void(^)(TRHomePageModel *model, NSError *error))completionHandler;

//详情
+ (id)getUKitchenDetail:(NSInteger)kitchenId completionHandler:(void(^)(TRDetailModel *model, NSError *error))completionHandler;

//详情页商家标签
+ (id)getUKitchenDetailTags:(NSInteger)kitchenId completionHandler:(void(^)(TRDetailTagsModel *model, NSError *error))completionHandler;

//详情页面-商家菜式列表
+ (id)getUKitchenDishList:(NSInteger)kitchenId completionHandler:(void(^)(TRDishListModel *model, NSError *error))completionHandler;

//详情页面-商家的最新评论
+ (id)getUKitchenLastComment:(NSInteger)kitchenId completionHandler:(void(^)(TRLastCommentModel *model, NSError *error))completionHandler;




@end
