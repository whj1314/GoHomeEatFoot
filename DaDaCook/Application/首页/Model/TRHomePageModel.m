//
//  TRHomePageModel.m
//  DaDaCook
//
//  Created by tarena on 16/8/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRHomePageModel.h"

@implementation TRHomePageModel

@end
@implementation TRHomePageDataModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list": [TRHomePageDataListModel class]};
}
@end


@implementation TRHomePageDataPrelocateModel

@end


@implementation TRHomePageDataListModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"recommend_dishes": [NSString class],
             @"recommend_dishes_detail": [TRHomePageDataListRDDModel class]};
}
@end


@implementation TRHomePageDataListRDDModel

@end


