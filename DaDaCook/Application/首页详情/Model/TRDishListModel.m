//
//  TRDishListModel.m
//  DaDaCook
//
//  Created by tarena on 16/8/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRDishListModel.h"

@implementation TRDishListModel

@end
@implementation TRDishListDataModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"recommends": [TRDishListDataRecommendsModel class],
             @"common_dishes": [TRDishListDataRecommendsModel class]};
}
@end


@implementation TRDishListDataRecommendsModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"desc": @"description"};
}
@end

