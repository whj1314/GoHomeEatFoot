//
//  UIView+HUD.m
//  TRProject
//
//  Created by tarena on 16/7/13.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "UIView+HUD.h"
static NSArray *animateImages = nil;
@implementation UIView (HUD)
- (void)showHUD{
    [self hideHUD]; //先隐藏其他的提示
    //再添加新的. 这样可以保证只有一个提示
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    [hud hideAnimated:YES afterDelay:30];
}

- (void)hideHUD{
    [MBProgressHUD hideHUDForView:self animated:YES];
}
- (void)showWarning:(NSString *)msg{
    [self hideHUD];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = msg;
    //    hud.label.text = msg;
    //    [hud hideAnimated:YES afterDelay:1.5];
    [hud hide:YES afterDelay:1.5];
}


@end












