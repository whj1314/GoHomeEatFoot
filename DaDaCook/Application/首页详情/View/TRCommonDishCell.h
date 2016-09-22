//
//  TRCommonDishCell.h
//  DaDaCook
//
//  Created by tarena on 16/8/24.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRCommonDishCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconIV;
@property (weak, nonatomic) IBOutlet UILabel *priceLb;
@property (weak, nonatomic) IBOutlet UILabel *detailLb;

@property (weak, nonatomic) IBOutlet UILabel *titleLb;

//cell上的加号点击后的回调
@property (nonatomic, copy) void(^addHandler)(UIButton *btn);






@end











