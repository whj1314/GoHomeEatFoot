//
//  TRLastCommentModel.h
//  DaDaCook
//
//  Created by tarena on 16/8/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TRLastCommentDataModel,TRLastCommentDataListModel,TRLastCommentDataListPraiseModel,TRLastCommentDataListOrderTagModel,TRLastCommentDataListExpressTagModel;
@interface TRLastCommentModel : NSObject

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) TRLastCommentDataModel *data;

@property (nonatomic, assign) NSInteger code;

@end
@interface TRLastCommentDataModel : NSObject

@property (nonatomic, assign) NSInteger cnt_avg;

@property (nonatomic, strong) NSArray<TRLastCommentDataListModel *> *list;

@property (nonatomic, assign) NSInteger cnt_all;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger cnt_good;

@property (nonatomic, assign) NSInteger cnt_withpic;

@property (nonatomic, assign) NSInteger cnt_withcontent;

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, assign) NSInteger totalPage;

@property (nonatomic, assign) NSInteger total;

@end

@interface TRLastCommentDataListModel : NSObject

@property (nonatomic, assign) NSInteger image_cnt;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, strong) NSArray<TRLastCommentDataListOrderTagModel *> *order_tag;

@property (nonatomic, assign) NSInteger is_myself;

@property (nonatomic, copy) NSString *create_time;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *order_no;

@property (nonatomic, assign) NSInteger sex;

@property (nonatomic, assign) NSInteger user_id;

@property (nonatomic, assign) NSInteger kitchen_id;

@property (nonatomic, assign) NSInteger sender_type;

@property (nonatomic, assign) NSInteger send_type;

@property (nonatomic, copy) NSString *avatar_url;

@property (nonatomic, assign) NSInteger order_id;

@property (nonatomic, copy) NSString *kitchen_name;

@property (nonatomic, strong) NSArray<TRLastCommentDataListExpressTagModel *> *express_tag;

@property (nonatomic, strong) NSArray *children;
//id
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger comment_id;

@property (nonatomic, copy) NSString *occupation;

@property (nonatomic, strong) NSArray *platform;

@property (nonatomic, copy) NSString *phone;

@property (nonatomic, assign) NSInteger star;

@property (nonatomic, assign) NSInteger express_star;

@property (nonatomic, copy) NSString *age;

@property (nonatomic, copy) NSString *thumbnail_image_url;

@property (nonatomic, strong) NSArray *awful;

@property (nonatomic, strong) NSArray<TRLastCommentDataListPraiseModel *> *praise;

@property (nonatomic, copy) NSString *express_type;

@property (nonatomic, copy) NSString *image_url;

@end

@interface TRLastCommentDataListPraiseModel : NSObject

@property (nonatomic, assign) NSInteger dish_id;

@property (nonatomic, copy) NSString *dish_name;

@property (nonatomic, assign) NSInteger is_praise;

@end

@interface TRLastCommentDataListOrderTagModel : NSObject

@property (nonatomic, copy) NSString *ordered_tag;

@end

@interface TRLastCommentDataListExpressTagModel : NSObject

@property (nonatomic, copy) NSString *distr_tag;

@end

