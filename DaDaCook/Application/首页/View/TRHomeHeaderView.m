//
//  TRHomeHeaderView.m
//  DaDaCook
//
//  Created by tarena on 16/8/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRHomeHeaderView.h"

@implementation TRHomeHeaderView

#pragma mark - delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    if ([_dataSource respondsToSelector:@selector(numberOfAdInHomeHeaderView:)] ) {
        return [_dataSource numberOfAdInHomeHeaderView:self];
    }
    return 0;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIImageView alloc] initWithFrame:carousel.bounds];
        ((UIImageView *)view).image = [UIImage imageNamed:@"default_kitchenpic"];
    }
    if ([_dataSource respondsToSelector:@selector(homeHeaderView:iconURLAtIndex:)]) {
        [((UIImageView *)view) setImageWithURL:[_dataSource homeHeaderView:self iconURLAtIndex:index] placeholder:[UIImage imageNamed:@"default_kitchenpic"]];
    }
    return view;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _pc.currentPage = carousel.currentItemIndex;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    if ([_delegate respondsToSelector:@selector(homeHeaderView:didSelectedItemAtIndex:)]) {
        [_delegate homeHeaderView:self didSelectedItemAtIndex:index];
    }
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}

#pragma mark - method
- (void)reloadData{
    if ([_dataSource respondsToSelector:@selector(numberOfAdInHomeHeaderView:)] ) {
        self.pc.numberOfPages = [_dataSource numberOfAdInHomeHeaderView:self];
    }
    [self.ic reloadData];
    
    //活动视图部分
    [self.topControls enumerateObjectsUsingBlock:^(UIControl * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *imgView = [obj viewWithTag:401];
        if ([_dataSource respondsToSelector:@selector(homeHeaderView:activityTopIconURLAtIndex:)]) {
            [imgView setImageWithURL:[_dataSource homeHeaderView:self activityTopIconURLAtIndex:idx] placeholder:[UIImage imageNamed:@"无信号"]];
        }
        
        UILabel *label = [obj viewWithTag:402];
        label.text = nil;
        if ([_dataSource respondsToSelector:@selector(homeHeaderView:activityTopTitleAtIndex:)]) {
            label.text = [_dataSource homeHeaderView:self activityTopTitleAtIndex:idx];
        }
        [obj bk_addEventHandler:^(id sender) {
            if ([_delegate respondsToSelector:@selector(homeHeaderView:didSelectedItemInActivityTopAtIndex:)]) {
                [_delegate homeHeaderView:self didSelectedItemInActivityTopAtIndex:idx];
            }
        } forControlEvents:UIControlEventTouchUpInside];
    }];
    
    [self.bottomBtns enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([_dataSource respondsToSelector:@selector(homeHeaderView:activityBottomIconURLAtIndex:)]) {
            NSURL *iconURL = [_dataSource homeHeaderView:self activityBottomIconURLAtIndex:idx];
            [obj setBackgroundImageWithURL:iconURL forState:UIControlStateNormal placeholder:[UIImage imageNamed:@"无信号"]];
        }
        [obj bk_addEventHandler:^(id sender) {
            if ([_delegate respondsToSelector:@selector(homeHeaderView:didSelectedItemInActivityBottomAtIndex:)]) {
                [_delegate homeHeaderView:self didSelectedItemInActivityBottomAtIndex:idx];
            }
        } forControlEvents:UIControlEventTouchUpInside];
    }];
    
    
}

#pragma mark - lazy
//重写get方法
- (UIPageControl *)pc{
    if (!_pc) {
        _pc = [self viewWithTag:200];
    }
    return _pc;
}
- (iCarousel *)ic{
    if (!_ic) {
        _ic = [self viewWithTag:100];
    }
    return _ic;
}
//注意!!! xib上的控件初始化的时候会自动进入下方方法 而不是 initWith***** 之类的
//initWithCoder除外, 这是所有xib方式的视图都会执行的初始化方法!!!
- (void)awakeFromNib{
    self.ic.delegate = self;
    self.ic.dataSource = self;
    _ic.scrollSpeed = .3;
    [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
        [_ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
    } repeats:YES];
}

- (NSArray<UIButton *> *)bottomBtns{
    if (!_bottomBtns) {
        _bottomBtns = @[[self viewWithTag:3001], [self viewWithTag:3002]];
    }
    return _bottomBtns;
}

- (NSArray<UIControl *> *)topControls{
    if (!_topControls) {
        _topControls = @[[self viewWithTag:4001], [self viewWithTag:4002], [self viewWithTag:4003], [self viewWithTag:4004]];
    }
    return _topControls;
}

@end
