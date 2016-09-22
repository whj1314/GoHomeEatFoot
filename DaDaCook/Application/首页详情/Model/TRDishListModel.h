//
//  TRDishListModel.h
//  DaDaCook
//
//  Created by tarena on 16/8/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TRDishListDataModel,TRDishListDataRecommendsModel;
@interface TRDishListModel : NSObject

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) TRDishListDataModel *data;

@property (nonatomic, assign) NSInteger code;


@end
@interface TRDishListDataModel : NSObject

@property (nonatomic, copy) NSString *pkg_description;

@property (nonatomic, strong) NSArray *pkg_tags;

@property (nonatomic, strong) NSArray *packages;

@property (nonatomic, copy) NSString *cook_name;

@property (nonatomic, strong) NSArray *set_meal;

@property (nonatomic, strong) NSArray<TRDishListDataRecommendsModel *> *recommends;

@property (nonatomic, strong) NSArray<TRDishListDataRecommendsModel *> *common_dishes;

@end

@interface TRDishListDataRecommendsModel : NSObject

@property (nonatomic, copy) NSString *image_url;
//description
@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger new_dish;

@property (nonatomic, assign) NSInteger dish_id;

@property (nonatomic, assign) NSInteger set_meal;

@property (nonatomic, assign) NSInteger volume;

@property (nonatomic, strong) NSArray *tags;

@property (nonatomic, assign) NSInteger eat_num;

@property (nonatomic, assign) NSInteger taste;

@property (nonatomic, copy) NSString *kitchen_id;

@property (nonatomic, assign) NSInteger stock;

@property (nonatomic, assign) NSInteger tmr_stock;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger staple_type;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *toast;

@property (nonatomic, assign) NSInteger tmr_only;

@property (nonatomic, assign) NSInteger is_recommend;

@property (nonatomic, assign) NSInteger has_staple;

@property (nonatomic, assign) NSInteger staple_num;

@property (nonatomic, assign) NSInteger staple_price;

@property (nonatomic, copy) NSString *thumbnail_image_url;

@property (nonatomic, assign) NSInteger price;

@property (nonatomic, copy) NSString *staple_name;

@property (nonatomic, assign) NSInteger is_shelves;

@end


