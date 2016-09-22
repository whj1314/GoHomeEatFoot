//
//  TRHomePageModel.h
//  DaDaCook
//
//  Created by tarena on 16/8/16.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TRHomePageDataModel,TRHomePageDataPrelocateModel,TRHomePageDataListModel,TRHomePageDataListRDDModel;
@interface TRHomePageModel : NSObject

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) TRHomePageDataModel *data;

@property (nonatomic, assign) NSInteger code;

@end
@interface TRHomePageDataModel : NSObject

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger size;

@property (nonatomic, strong) NSArray *promotion_list;

@property (nonatomic, strong) TRHomePageDataPrelocateModel *prelocate;

@property (nonatomic, strong) NSArray<TRHomePageDataListModel *> *list;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, assign) NSInteger totalPage;

@end

@interface TRHomePageDataPrelocateModel : NSObject

@property (nonatomic, copy) NSString *city_id;

@property (nonatomic, copy) NSString *establish;

@end

@interface TRHomePageDataListModel : NSObject

@property (nonatomic, assign) NSInteger tmr_stock_empty;

@property (nonatomic, assign) NSInteger staple_price;

@property (nonatomic, strong) NSArray<NSString *> *recommend_dishes;

@property (nonatomic, assign) NSInteger is_auth;

@property (nonatomic, assign) NSInteger over_distr_radius;

@property (nonatomic, copy) NSString *notice;

@property (nonatomic, assign) NSInteger eat_num;

@property (nonatomic, copy) NSString *telephone;

@property (nonatomic, copy) NSString *native_place;

@property (nonatomic, assign) NSInteger tmr_overstock;

@property (nonatomic, assign) NSInteger is_door;

@property (nonatomic, copy) NSString *kitchen_image_url;

@property (nonatomic, assign) NSInteger business_start;

@property (nonatomic, assign) NSInteger is_open;

@property (nonatomic, assign) NSInteger is_new;

@property (nonatomic, assign) NSInteger health_cert;

@property (nonatomic, assign) NSInteger material_cert;

@property (nonatomic, copy) NSString *cover_image_url;

@property (nonatomic, copy) NSString *kitchen_address;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *cook_name;

@property (nonatomic, assign) NSInteger in_business;

@property (nonatomic, assign) NSInteger tod_open;

@property (nonatomic, copy) NSString *create_time;

@property (nonatomic, copy) NSString *auth_msg;

@property (nonatomic, copy) NSString *distance;

@property (nonatomic, assign) CGFloat star;

@property (nonatomic, strong) NSArray *discount_list;

@property (nonatomic, assign) NSInteger door_auth;

@property (nonatomic, assign) NSInteger tmr_in_business;

@property (nonatomic, assign) NSInteger tod_overstock;

@property (nonatomic, assign) NSInteger tod_stock_empty;

@property (nonatomic, assign) NSInteger business_end;

@property (nonatomic, strong) NSArray<TRHomePageDataListRDDModel *> *recommend_dishes_detail;

@property (nonatomic, strong) NSArray *activity;

@property (nonatomic, copy) NSString *kitchen_name;

@property (nonatomic, copy) NSString *city_name;

@property (nonatomic, assign) NSInteger tmr_open;

@property (nonatomic, assign) NSInteger avg_price;

@property (nonatomic, assign) NSInteger kitchen_id;

@property (nonatomic, assign) NSInteger approve_num;

@property (nonatomic, assign) NSInteger distr_radius;

@property (nonatomic, copy) NSString *district_name;

@property (nonatomic, assign) NSInteger is_distr;

@property (nonatomic, assign) NSInteger is_refectory;

@property (nonatomic, copy) NSString *month_sale;

@property (nonatomic, assign) NSInteger is_check;

@property (nonatomic, copy) NSString *cook_image_url;

@end
//推荐菜品
@interface TRHomePageDataListRDDModel : NSObject

@property (nonatomic, assign) NSInteger dish_price;

@property (nonatomic, assign) NSInteger dish_id;

@property (nonatomic, copy) NSString *dish_image_url;

@property (nonatomic, copy) NSString *dish_name;

@end

