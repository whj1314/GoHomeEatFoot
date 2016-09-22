//
//  TRUFocusListModel.h
//  DaDaCook
//
//  Created by tarena on 16/8/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TRUFocusListListModel;
@interface TRUFocusListModel : NSObject

@property (nonatomic, copy) NSString *msg;

//@property (nonatomic, strong) Data *data;

@property (nonatomic, assign) NSInteger code;

//@end
//@interface Data : NSObject

@property (nonatomic, strong) NSArray<TRUFocusListListModel *> *list;

@end

@interface TRUFocusListListModel : NSObject

@property (nonatomic, assign) NSInteger focus_id;

@property (nonatomic, copy) NSString *jump_url;

@property (nonatomic, copy) NSString *image_url;
//description
@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger position;

@property (nonatomic, assign) NSInteger action;

@end

