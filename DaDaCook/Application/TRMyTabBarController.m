//
//  TRMyTabBarController.m
//  DaDaCook
//
//  Created by tarena on 16/8/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRMyTabBarController.h"

@interface TRMyTabBarController ()

@end

@implementation TRMyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //任务:分别获取发现,首页,我的三个故事板中的起始控制器指针,把这三个控制器设置为标签控制器的子视图控制器.
    id homeNavi = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateInitialViewController];
    id discoverNavi = [[UIStoryboard storyboardWithName:@"Discover" bundle:nil] instantiateInitialViewController];
    id mineNavi = [[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateInitialViewController];
    self.viewControllers = @[homeNavi, discoverNavi, mineNavi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
