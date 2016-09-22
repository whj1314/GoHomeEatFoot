//
//  TRDetailTagsModel.m
//  DaDaCook
//
//  Created by tarena on 16/8/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRDetailTagsModel.h"

@implementation TRDetailTagsModel

@end

@implementation TRDetailTagsDataModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"auth_msg_list": [TRDetailTagsDataAuthMsgListModel class],
             @"comment_tag": [TRDetailTagsDataCommentTagModel class]};
}
@end


@implementation TRDetailTagsDataAuthMsgListModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"desc": @"description"};
}
@end


@implementation TRDetailTagsDataCommentTagModel

@end


