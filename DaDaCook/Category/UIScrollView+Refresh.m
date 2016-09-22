//
//  UIScrollView+Refresh.m
//  TRProject
//
//  Created by tarena on 16/7/13.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "UIScrollView+Refresh.h"

@interface TRRefreshGifHeader : MJRefreshGifHeader
@end
@implementation TRRefreshGifHeader
- (void)placeSubviews
{
    [super placeSubviews];
    self.gifView.frame = self.bounds;
    //    self.gifView.superview.backgroundColor = [UIColor purpleColor];
    self.gifView.contentMode = UIViewContentModeTop;
    
    CGRect lbRect = self.stateLabel.frame;
    lbRect.origin.y += 20;
    self.stateLabel.frame = lbRect;
    self.stateLabel.font = [UIFont systemFontOfSize:12];
}
@end

@implementation UIScrollView (Refresh)

- (NSArray<UIImage *> *)animateImages{
    NSArray *imageNames = @[@"transition_00000", @"transition_00001", @"transition_00002", @"transition_00003", @"transition_00004", @"transition_00005", @"transition_00006", @"transition_00007", @"transition_00008", @"transition_00009", @"transition_00010",@"transition_00011"];
    NSMutableArray *images = [NSMutableArray new];
    [imageNames enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [images addObject:[UIImage imageNamed:obj]];
    }];
    return images.copy;
}
- (void)addHeaderRefresh:(void(^)())block{
    TRRefreshGifHeader *header = [TRRefreshGifHeader headerWithRefreshingBlock:block];
    // Hide the time
    header.lastUpdatedTimeLabel.hidden = YES;
    [header setTitle:@"小锅下灶·上门审核·健康认证·人保保险" forState:MJRefreshStateRefreshing];
    [header setTitle:@"小锅下灶·上门审核·健康认证·人保保险" forState:MJRefreshStateWillRefresh];
    [header setTitle:@"小锅下灶·上门审核·健康认证·人保保险" forState:MJRefreshStatePulling];
    [header setTitle:@"小锅下灶·上门审核·健康认证·人保保险" forState:MJRefreshStateIdle];
    header.stateLabel.textColor = kRGBA(249, 209, 88, 1);
    
    [header setImages:[self animateImages] forState:MJRefreshStateIdle];
    [header setImages:[self animateImages] forState:MJRefreshStatePulling];
    //[header setImages:[self animateImages] forState:MJRefreshStateRefreshing];
    self.mj_header = header;
}
- (void)addFooterRefresh:(void(^)())block{
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:block];
}
- (void)beginHeaderRefresh{
    [self.mj_header beginRefreshing];
}
- (void)endHeaderRefresh{
    [self.mj_header endRefreshing];
}

- (void)endFooterRefresh{
    [self.mj_footer endRefreshing];
}
@end








