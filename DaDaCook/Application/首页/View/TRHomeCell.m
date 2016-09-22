//
//  TRHomeCell.m
//  DaDaCook
//
//  Created by tarena on 16/8/22.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRHomeCell.h"

@implementation TRHomeCell
#pragma mark - ic Delegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    if ([_dataSource respondsToSelector:@selector(numberOfItemInCell:)]) {
        return [_dataSource numberOfItemInCell:self];
    }
    return 0;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIImageView alloc] initWithFrame:carousel.bounds];
    }
    NSURL *url = nil;
    if ([_dataSource respondsToSelector:@selector(homeCell:iconForItemAtIndex:)]) {
        url = [_dataSource homeCell:self iconForItemAtIndex:index];
    }
    [((UIImageView *)view) setImageWithURL:url placeholder:[UIImage imageNamed:@"default_kitchenpic"]];
    
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    if ([_delegate respondsToSelector:@selector(clickItemInHomeCell:)]) {
        [_delegate clickItemInHomeCell:self];
    }
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    _pc.currentPage = carousel.currentItemIndex;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}

#pragma mark - life
- (void)awakeFromNib {
    self.ic.delegate = self;
    self.ic.dataSource = self;
    
    _ic.scrollSpeed = .2;
    
}
- (void)reloadData{
    [self.ic reloadData];
    if ([_dataSource respondsToSelector:@selector(numberOfItemInCell:)]) {
        _pc.numberOfPages = [_dataSource numberOfItemInCell:self];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
