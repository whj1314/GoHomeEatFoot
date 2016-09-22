//
//  TRHomeViewModel.h
//  DaDaCook
//
//  Created by tarena on 16/8/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "TRNetManager.h"

@interface TRHomeViewModel : BaseViewModel
/**********  头部广告滚动栏 ***************/
@property (nonatomic, readonly) NSInteger adNumber;
@property (nonatomic) NSArray<TRUFocusListListModel *> *focusList;

- (NSURL *)adIconURLAtIndex:(NSInteger)index;

/*********   活动栏    *****************/
@property (nonatomic) NSArray<TRActivityListModel *> *activityList;
- (NSURL *)activityIconURLAtIndex:(NSInteger)index;
- (NSString *)activityNameAtIndex:(NSInteger)index;


/*********   首页下方的列表内容   ********************/
@property (nonatomic) NSMutableArray<TRHomePageDataListModel *> *dataList;
@property (nonatomic, readonly) NSInteger rowNumber;

//题目
- (NSAttributedString *)titleForRow:(NSInteger)row;
//描述
- (NSAttributedString *)descForRow:(NSInteger)row;

- (NSURL *)cookerIconForRow:(NSInteger)row;

//某商家有多少个推荐菜
- (NSInteger)numberOfRecommendForRow:(NSInteger)row;
//每种推荐菜的图片地址
- (NSURL *)iconForRow:(NSInteger)row index:(NSInteger)index;

@property (nonatomic) NSInteger page;

- (NSInteger)kitchenIdForRow:(NSInteger)row;




@end












