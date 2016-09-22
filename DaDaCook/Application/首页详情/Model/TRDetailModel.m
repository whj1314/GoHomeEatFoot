//
//  TRDetailModel.m
//  DaDaCook
//
//  Created by tarena on 16/8/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRDetailModel.h"

@implementation TRDetailModel

@end
@implementation TRDetailDataModel
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"auth_msg_list": [TRDetailDataAuthMsgListModel class]};
}
@end


@implementation TRDetailDataBusyInfoModel

@end

@implementation TRDetailDataAuthMsgListModel
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper{
    return @{@"desc": @"description"};
}
@end









