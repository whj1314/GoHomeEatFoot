//
//  TRLastCommentModel.m
//  DaDaCook
//
//  Created by tarena on 16/8/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRLastCommentModel.h"

@implementation TRLastCommentModel

@end
@implementation TRLastCommentDataModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"list": [TRLastCommentDataListModel class]};
}
@end


@implementation TRLastCommentDataListModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"order_tag": [TRLastCommentDataListOrderTagModel class],
             @"express_tag": [TRLastCommentDataListExpressTagModel class],
             @"praise": [TRLastCommentDataListPraiseModel class]};
}
@end


@implementation TRLastCommentDataListPraiseModel

@end


@implementation TRLastCommentDataListOrderTagModel

@end


@implementation TRLastCommentDataListExpressTagModel

@end


