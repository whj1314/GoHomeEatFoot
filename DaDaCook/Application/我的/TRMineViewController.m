//
//  TRMineViewController.m
//  DaDaCook
//
//  Created by tarena on 16/8/19.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRMineViewController.h"

@interface TRMineViewController ()<UITableViewDelegate>
@property (nonatomic) UITableView *tableView;
@property (nonatomic) UITableViewController *mineTableVC;
@end

@implementation TRMineViewController

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"24234");
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 1) {
        return 68;
    }
    return 44;
}

#pragma mark - lazy
- (UITableView *)tableView{
    return _mineTableVC.tableView;
}

#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];
    //因为 UITableViewController 的根视图是 UITableView，这是一个滚动视图。我们不能在滚动视图上添加右上角那两个静止不动的按钮。而静态的表格又必须是继承与 UITableViewController 的类型。最终的解决方案是使用一个 UIViewController 类型的类，即当前类来存放两个静态的按钮。然后把滚动视图控制器作为本控制器的子控制器。把子控制器的根视图（UITableView）加入到当前控制器的页面上
    
    //获取 storyboard 中的表格控制器的指针。使用的是场景的 id ，即 storyboardId
    _mineTableVC = [[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:@"MineTableViewController"];
    //添加为当前控制器的子控制器，用来保存控制器的指针
    [self addChildViewController:_mineTableVC];
    //把子控制器的视图（UITableView）添加到当前控制器上
    [self.view addSubview:_mineTableVC.tableView];
    //约束
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsMake(-20, 0, 0, 0));
    }];
    //由当前控制器来实现子控制器的视图的代理
    self.tableView.delegate = self;
    //让子控制器的页面处于当前控制器的最底层，这样就不会因为是后加入的而遮盖右上角的两个按钮了!
    [self.view sendSubviewToBack:self.tableView];
    
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
