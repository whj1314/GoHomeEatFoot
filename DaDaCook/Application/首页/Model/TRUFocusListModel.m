//
//  TRUFocusListModel.m
//  DaDaCook
//
//  Created by tarena on 16/8/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRUFocusListModel.h"

@implementation TRUFocusListModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"list": @"data.list"};
}

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list": [TRUFocusListListModel class]};
}
@end

@implementation TRUFocusListListModel

@end


