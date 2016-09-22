//
//  TRNetManager.m
//  DaDaCook
//
//  Created by tarena on 16/8/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRNetManager.h"
#import "TRRequestPath.h"

@implementation TRNetManager
+ (id)getFocusListCompletionHandler:(void (^)(TRUFocusListModel *, NSError *))completionHandler{
    return [self POST:kUFocusListPath parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([TRUFocusListModel parse:responseObj], error);
    }];
}

+ (id)getActivityCompletionHandler:(void (^)(TRActivityModel *, NSError *))completionHandler{
    return [self POST:kHomeActivityPath parameters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([TRActivityModel parse:responseObj], error);
    }];
}

+ (id)getHomePageInPage:(NSInteger)page completionHandler:(void (^)(TRHomePageModel *, NSError *))completionHandler{
    return [self POST:kHomePageListPath parameters:@{@"page": @(page), @"radius": @5000} completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([TRHomePageModel parse:responseObj], error);
    }];
}

+ (id)getUKitchenDetail:(NSInteger)kitchenId completionHandler:(void (^)(TRDetailModel *, NSError *))completionHandler{
    return [self POST:kUKitchenDetailPath parameters:@{@"kitchen_id": @(kitchenId)} completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([TRDetailModel parse:responseObj], error);
    }];
}

+ (id)getUKitchenDetailTags:(NSInteger)kitchenId completionHandler:(void (^)(TRDetailTagsModel *, NSError *))completionHandler{
    return [self POST:kUKitchenDetailTagsPath parameters:@{@"kitchen_id": @(kitchenId)} completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([TRDetailTagsModel parse:responseObj], error);
    }];
}

+ (id)getUKitchenDishList:(NSInteger)kitchenId completionHandler:(void (^)(TRDishListModel *, NSError *))completionHandler{
    return [self POST:kUKitchenDishListPath parameters:@{@"kitchen_id": @(kitchenId)} completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([TRDishListModel parse:responseObj], error);
    }];
}


+ (id)getUKitchenLastComment:(NSInteger)kitchenId completionHandler:(void (^)(TRLastCommentModel *, NSError *))completionHandler{
    return [self POST:kUKitchenLastCommentPath parameters:@{@"kitchen_id": @(kitchenId)} completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([TRLastCommentModel parse:responseObj], error);
    }];
}





@end
