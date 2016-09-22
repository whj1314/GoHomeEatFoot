//
//  TRDetailModel.h
//  DaDaCook
//
//  Created by tarena on 16/8/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TRDetailDataModel,TRDetailDataBusyInfoModel,TRDetailDataAuthMsgListModel;
@interface TRDetailModel : NSObject

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) TRDetailDataModel *data;

@property (nonatomic, assign) NSInteger code;

@end
@interface TRDetailDataModel : NSObject

@property (nonatomic, assign) NSInteger is_distr;

@property (nonatomic, assign) NSInteger distr_price;

@property (nonatomic, copy) NSString *insure_msg;

@property (nonatomic, copy) NSString *latitude;

@property (nonatomic, copy) NSString *business_start;

@property (nonatomic, assign) NSInteger native_place_city;

@property (nonatomic, assign) NSInteger is_auth;

@property (nonatomic, strong) NSArray *discount_list;

@property (nonatomic, assign) NSInteger tod_open;

@property (nonatomic, copy) NSString *cook_image_url;

@property (nonatomic, assign) NSInteger health_cert;

@property (nonatomic, assign) NSInteger is_liked;

@property (nonatomic, strong) TRDetailDataBusyInfoModel *busy_info;

@property (nonatomic, assign) NSInteger material_cert;

@property (nonatomic, copy) NSString *notice;

@property (nonatomic, copy) NSString *broadcast;

@property (nonatomic, copy) NSString *longitude;

@property (nonatomic, copy) NSString *native_place;

@property (nonatomic, assign) NSInteger is_collected;

@property (nonatomic, assign) NSInteger is_new;

@property (nonatomic, copy) NSString *cook_name;

@property (nonatomic, copy) NSString *address;

@property (nonatomic, copy) NSString *hobbies;

@property (nonatomic, assign) NSInteger kitchen_id;

@property (nonatomic, copy) NSString *tel_msg;

@property (nonatomic, strong) NSArray<TRDetailDataAuthMsgListModel *> *auth_msg_list;

@property (nonatomic, assign) NSInteger eat_num;

@property (nonatomic, assign) CGFloat star;

@property (nonatomic, assign) NSInteger insure;

@property (nonatomic, assign) NSInteger door_auth;

@property (nonatomic, copy) NSString *kitchen_name;

@property (nonatomic, assign) NSInteger in_business;

@property (nonatomic, copy) NSString *business_end;

@property (nonatomic, assign) NSInteger is_door;

@property (nonatomic, copy) NSString *distr_radius;

@property (nonatomic, assign) NSInteger staple_price;

@property (nonatomic, assign) NSInteger like_num;

@property (nonatomic, assign) NSInteger tmr_in_business;

@property (nonatomic, copy) NSString *create_time;

@property (nonatomic, copy) NSString *kitchen_image_url;

@property (nonatomic, assign) NSInteger tod_overstock;

@property (nonatomic, copy) NSString *distance;

@property (nonatomic, assign) NSInteger tmr_overstock;

@property (nonatomic, assign) NSInteger over_distr_radius;

@property (nonatomic, assign) NSInteger comment_star_amt;

@property (nonatomic, assign) NSInteger box_fee;

@property (nonatomic, assign) NSInteger hold_num;

@property (nonatomic, copy) NSString *age;

@property (nonatomic, assign) NSInteger is_open;

@property (nonatomic, copy) NSString *telephone;

@property (nonatomic, copy) NSString *package_desc;

@property (nonatomic, copy) NSString *house_number;

@property (nonatomic, copy) NSString *distr_msg;

@property (nonatomic, assign) NSInteger collect_amount;

@property (nonatomic, copy) NSString *phone;

@property (nonatomic, assign) NSInteger comment_num;

@property (nonatomic, assign) NSInteger comment_amt;

@property (nonatomic, assign) NSInteger tmr_open;

@property (nonatomic, assign) NSInteger is_refectory;

@end

@interface TRDetailDataBusyInfoModel : NSObject

@property (nonatomic, assign) NSInteger is_busy;

@property (nonatomic, copy) NSString *busy_msg;

@end

@interface TRDetailDataAuthMsgListModel : NSObject

@property (nonatomic, copy) NSString *title;
//description
@property (nonatomic, copy) NSString *desc;

@end

