//
//  TRHomeViewModel.m
//  DaDaCook
//
//  Created by tarena on 16/8/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRHomeViewModel.h"

@implementation TRHomeViewModel
- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    
    NSInteger tmpPage = 1;
    if (requestMode == RequestModeMore) {
        tmpPage = _page + 1;
    }
    
    //总请求次数
    __block int total = 3;
    
    [TRNetManager getFocusListCompletionHandler:^(TRUFocusListModel *model, NSError *error) {
        total--;
        if (!error) {
            _focusList = model.list;
        }
        if (total == 0) { //所有请求都完毕了
            !completionHandler ?: completionHandler(error);
        }
    }];
    
    [TRNetManager getActivityCompletionHandler:^(TRActivityModel *model, NSError *error) {
        total--;
        if (!error) {
            _activityList = model.list;
        }
        if (total == 0) { //所有请求都完毕了
            !completionHandler ?: completionHandler(error);
        }
    }];
    
    [TRNetManager getHomePageInPage:tmpPage completionHandler:^(TRHomePageModel *model, NSError *error) {
        total--;
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
            [self.dataList addObjectsFromArray:model.data.list];
            _page = tmpPage;
        }
        if (total == 0) !completionHandler ?: completionHandler(error);
    }];
}


/**********  头部广告滚动栏 ***************/
- (NSInteger)adNumber{
    return _focusList.count;
}
- (NSURL *)adIconURLAtIndex:(NSInteger)index{
    return _focusList[index].image_url.yx_URL;
}


/*********   活动栏    *****************/
- (NSString *)activityNameAtIndex:(NSInteger)index{
    if (index + 1 > _activityList.count) {
        return nil;
    }
    return _activityList[index].title;
}
- (NSURL *)activityIconURLAtIndex:(NSInteger)index{
    if (index + 1 > _activityList.count) {
        return nil;
    }
    return _activityList[index].imageUrl.yx_URL;
}

- (NSMutableArray<TRHomePageDataListModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<TRHomePageDataListModel *> alloc] init];
    }
    return _dataList;
}


- (NSInteger)rowNumber{
    return _dataList.count;
}

- (NSURL *)cookerIconForRow:(NSInteger)row{
    return _dataList[row].cook_image_url.yx_URL;
}

- (NSAttributedString *)titleForRow:(NSInteger)row{
    NSAttributedString *nameStr = [[NSAttributedString alloc] initWithString:[_dataList[row].kitchen_name stringByAppendingString:@"  "] attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]}];
    NSString *address = [NSString stringWithFormat:@" %@ %@ ", _dataList[row].distance, _dataList[row].kitchen_address];
    NSAttributedString *addressStr = [[NSAttributedString alloc] initWithString:address attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:11], NSForegroundColorAttributeName: [UIColor grayColor], NSBackgroundColorAttributeName: [UIColor lightGrayColor]}];
    NSMutableAttributedString *str = [NSMutableAttributedString new];
    [str appendAttributedString:nameStr];
    [str appendAttributedString:addressStr];
    return str.copy;
}

- (NSAttributedString *)descForRow:(NSInteger)row{
    NSString *salePerM = [NSString stringWithFormat:@"月售%ld单", _dataList[row].business_end];
    NSAttributedString *salePerMAttr = [[NSAttributedString alloc] initWithString:salePerM attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13], NSForegroundColorAttributeName:[UIColor redColor]}];
    
    NSString *otherDesc = [NSString stringWithFormat:@"· %.1f分 · 人均￥%ld · %@", _dataList[row].star, _dataList[row].avg_price, _dataList[row].native_place];
    NSAttributedString *otherDescAttr = [[NSAttributedString alloc] initWithString:otherDesc attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13], NSForegroundColorAttributeName: kRGBA(130, 130, 130, 1)}];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithAttributedString:salePerMAttr];
    [str appendAttributedString:otherDescAttr];
    return str.copy;
}

- (NSInteger)numberOfRecommendForRow:(NSInteger)row{
    return _dataList[row].recommend_dishes_detail.count;
}

- (NSURL *)iconForRow:(NSInteger)row index:(NSInteger)index{
    return _dataList[row].recommend_dishes_detail[index].dish_image_url.yx_URL;
}


- (NSInteger)kitchenIdForRow:(NSInteger)row{
    return _dataList[row].kitchen_id;
}






@end
