//
//  TRHomeCell.h
//  DaDaCook
//
//  Created by tarena on 16/8/22.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@class TRHomeCell;
@protocol TRHomeCellDataSource <NSObject>
@optional
- (NSInteger)numberOfItemInCell:(TRHomeCell *)cell;
- (NSURL *)homeCell:(TRHomeCell *)cell iconForItemAtIndex:(NSInteger)index;

@end

@protocol TRHomeCellDelegate <NSObject>
- (void)clickItemInHomeCell:(TRHomeCell *)cell;
@end

@interface TRHomeCell : UITableViewCell<iCarouselDelegate, iCarouselDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *cookerIconIV;
@property (weak, nonatomic) IBOutlet iCarousel *ic;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *detailL;
@property (nonatomic) NSIndexPath *indexPath;
@property (weak, nonatomic) IBOutlet UIPageControl *pc;

@property (nonatomic, weak) id<TRHomeCellDataSource> dataSource;
@property (nonatomic, weak) id<TRHomeCellDelegate> delegate;


- (void)reloadData;
@end











