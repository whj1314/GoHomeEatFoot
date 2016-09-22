//
//  TRDetailTagsModel.h
//  DaDaCook
//
//  Created by tarena on 16/8/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TRDetailTagsDataModel,TRDetailTagsDataAuthMsgListModel,TRDetailTagsDataCommentTagModel;
@interface TRDetailTagsModel : NSObject

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) TRDetailTagsDataModel *data;

@property (nonatomic, assign) NSInteger code;

@end
@interface TRDetailTagsDataModel : NSObject

@property (nonatomic, strong) NSArray<TRDetailTagsDataAuthMsgListModel *> *auth_msg_list;

@property (nonatomic, strong) NSArray<TRDetailTagsDataCommentTagModel *> *comment_tag;

@property (nonatomic, assign) NSInteger comment_num;

@end

@interface TRDetailTagsDataAuthMsgListModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *icon;
//description
@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *inner_description;

@property (nonatomic, assign) NSInteger type;

@end

@interface TRDetailTagsDataCommentTagModel : NSObject

@property (nonatomic, assign) NSInteger tag_count_content;

@property (nonatomic, copy) NSString *tag_name;

@property (nonatomic, assign) NSInteger tag_count_all;

@property (nonatomic, assign) NSInteger tag_type;

@property (nonatomic, assign) NSInteger tag_id;

@end

