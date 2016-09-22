//
//  TRHomeHeaderView.h
//  DaDaCook
//
//  Created by tarena on 16/8/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@class TRHomeHeaderView;

@protocol TRHomeHeaderViewDataSource <NSObject>
/**有多少个*/
- (NSInteger)numberOfAdInHomeHeaderView:(TRHomeHeaderView *)homeHeaderView;
/** 每个图片的URL地址 */
- (NSURL *)homeHeaderView:(TRHomeHeaderView *)homeHeaderView iconURLAtIndex:(NSInteger)index;

/** 活动视图的上半部分 */
- (NSURL *)homeHeaderView:(TRHomeHeaderView *)homeHeaderView activityTopIconURLAtIndex:(NSInteger)index;
- (NSString *)homeHeaderView:(TRHomeHeaderView *)homeHeaderView activityTopTitleAtIndex:(NSInteger)index;

/** 活动视图的下半部分 */
- (NSURL *)homeHeaderView:(TRHomeHeaderView *)homeHeaderView activityBottomIconURLAtIndex:(NSInteger)index;
@end

@protocol TRHomeHeaderViewDelegate <NSObject>
@optional
/** 某一个图片被点击时 */
- (void)homeHeaderView:(TRHomeHeaderView *)homeHeaderView didSelectedItemAtIndex:(NSInteger)index;

/** 活动视图的上半部分 */
- (void)homeHeaderView:(TRHomeHeaderView *)homeHeaderView didSelectedItemInActivityTopAtIndex:(NSInteger)index;

/** 活动视图的下半部分 */
- (void)homeHeaderView:(TRHomeHeaderView *)homeHeaderView didSelectedItemInActivityBottomAtIndex:(NSInteger)index;

@end

@interface TRHomeHeaderView : UIView<iCarouselDelegate,iCarouselDataSource>

@property (nonatomic) iCarousel *ic;
@property (nonatomic) UIPageControl *pc;

@property (nonatomic, weak) id<TRHomeHeaderViewDelegate> delegate;
@property (nonatomic, weak) id<TRHomeHeaderViewDataSource> dataSource;

- (void)reloadData;

/************ 活动栏目的UI  **************/
/** 下方的两个按钮 */
@property (nonatomic) NSArray<UIButton *> *bottomBtns;
/** 上方的4个选项 */
@property (nonatomic) NSArray<UIControl *> *topControls;
@end









