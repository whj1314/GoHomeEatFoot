//
//  TRActivityModel.h
//  DaDaCook
//
//  Created by tarena on 16/8/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "BaseViewModel.h"

@class TRActivityListModel;
@interface TRActivityModel : NSObject

@property (nonatomic, copy) NSString *msg;

//@property (nonatomic, strong) Data *data;
@property (nonatomic, assign) NSInteger code;
//@end
//@interface Data : NSObject
@property (nonatomic, strong) NSArray<TRActivityListModel *> *list;

@end

@interface TRActivityListModel : NSObject
//id
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger showDot;

@property (nonatomic, assign) NSInteger dotType;

@property (nonatomic, copy) NSString *dotVersion;

@property (nonatomic, copy) NSString *dotMsg;

@property (nonatomic, copy) NSString *imageUrl;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger action;

@property (nonatomic, copy) NSString *jumpUrl;

@property (nonatomic, assign) NSInteger cityId;

@property (nonatomic, copy) NSString *content;

@end

