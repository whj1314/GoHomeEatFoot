//
//  TRDetailViewController.h
//  DaDaCook
//
//  Created by tarena on 16/8/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TRDetailViewController : UIViewController
+ (instancetype)detailVCWithKitchenId:(NSInteger)kitchenId;
/** 厨房id */
@property (nonatomic) NSInteger kitchenId;
@end
