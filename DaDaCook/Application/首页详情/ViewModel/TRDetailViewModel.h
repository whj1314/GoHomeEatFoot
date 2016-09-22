//
//  TRDetailViewModel.h
//  DaDaCook
//
//  Created by tarena on 16/8/24.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TRNetManager.h"

@import CoreLocation;

@interface TRDetailViewModel : BaseViewModel
- (instancetype)initWithKitchenId:(NSInteger)kitchenId;
@property (nonatomic, readonly) NSInteger kitchenId;



/***********  其他菜品 ***************/
@property (nonatomic) TRDishListModel *dishListModel;

@property (nonatomic, readonly) NSInteger dishNumber;
- (NSURL *)dishIconURLForRow:(NSInteger)row;
- (NSString *)dishTitleForRow:(NSInteger)row;
- (NSString *)dishDetailForRow:(NSInteger)row;
- (NSString *)dishPriceForRow:(NSInteger)row;

/**********  推荐菜品   ************/
@property (nonatomic) NSInteger recommendNumber;
- (NSURL *)recommendIconURLForRow:(NSInteger)row;
- (NSString *)recommendTitleForRow:(NSInteger)row;
- (NSString *)recommendDetailForRow:(NSInteger)row;
- (NSString *)recommendPriceForRow:(NSInteger)row;
- (NSString *)recommendDescForRow:(NSInteger)row;


/*********** 商家标签-评论部分  *************/
@property (nonatomic) TRDetailTagsModel *detailTagsModel;


@property (nonatomic, readonly) NSInteger commentTagNumber;
- (NSString *)commentTagForRow:(NSInteger)row;
@property (nonatomic, readonly) NSInteger totalCommentNumber;
/************ 商家标签-授权部分   ************/

@property (nonatomic, readonly) NSInteger authNumber;
- (NSString *)authNameForRow:(NSInteger)row;
- (NSURL *)authIconURLForRow:(NSInteger)row;


/***********  商家详情  **************/
@property (nonatomic) TRDetailModel *detailModel;
@property (nonatomic, readonly) NSString *address;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) NSString *distance;

@property (nonatomic, readonly) NSString *cookerName;
@property (nonatomic, readonly) NSURL *cookerIconURL;

@end







