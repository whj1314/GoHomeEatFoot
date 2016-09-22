//
//  TRHomeViewController.m
//  DaDaCook
//
//  Created by tarena on 16/8/17.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRHomeViewController.h"
#import "TRHomeHeaderView.h"
#import "TRHomeViewModel.h"
#import "TRHomeCell.h"
#import "TRDetailViewController.h"

@interface TRHomeViewController ()<UITableViewDelegate, UITableViewDataSource, TRHomeHeaderViewDataSource, TRHomeHeaderViewDelegate, TRHomeCellDelegate, TRHomeCellDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//tableView的头部视图没有复用问题,可以直接拖拽到VC中!!!
@property (weak, nonatomic) IBOutlet TRHomeHeaderView *headerView;

@property (nonatomic) TRHomeViewModel *homeVM;

/**************头部自定义导航栏上的内容**************/
@property (weak, nonatomic) IBOutlet UIView *naviContentView;
@property (weak, nonatomic) IBOutlet UIButton *naviLocationBtn;


@end

@implementation TRHomeViewController
#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.tableView) {
        CGFloat y = scrollView.contentOffset.y;
        //NSLog(@"%f", y);
        //-20（0） ~ 105(1) alpha
        CGFloat alpha = (y + 20)/ 125;
        if (y <= -20) {
            alpha = 0;
        }
        if (y >= 105) {
            alpha = 1;
        }
        self.naviLocationBtn.backgroundColor = kRGBA(0, 0, 0, 1 - alpha - .5);
        if (y > 80) {
            [self.naviLocationBtn setTitleColor:kRGBA(251, 92, 58, 1) forState:UIControlStateNormal];
        }else{
            [self.naviLocationBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
        self.naviContentView.alpha = alpha;
    }
}

#pragma mark - TRHomeCell Delegate
- (NSInteger)numberOfItemInCell:(TRHomeCell *)cell{
    return [self.homeVM numberOfRecommendForRow:cell.indexPath.row];
}

- (NSURL *)homeCell:(TRHomeCell *)cell iconForItemAtIndex:(NSInteger)index{
    return [self.homeVM iconForRow:cell.indexPath.row index:index];
}

- (void)clickItemInHomeCell:(TRHomeCell *)cell{
    [self tableView:self.tableView didSelectRowAtIndexPath:cell.indexPath];
}

#pragma mark - TRHomeHeaderView Delegate
- (NSString *)homeHeaderView:(TRHomeHeaderView *)homeHeaderView activityTopTitleAtIndex:(NSInteger)index{
    return [self.homeVM activityNameAtIndex:index];
}
- (NSURL *)homeHeaderView:(TRHomeHeaderView *)homeHeaderView activityTopIconURLAtIndex:(NSInteger)index{
    return [self.homeVM activityIconURLAtIndex:index];
}

- (void)homeHeaderView:(TRHomeHeaderView *)homeHeaderView didSelectedItemInActivityTopAtIndex:(NSInteger)index{
    NSLog(@"111");
}

- (NSURL *)homeHeaderView:(TRHomeHeaderView *)homeHeaderView activityBottomIconURLAtIndex:(NSInteger)index{
    return [self.homeVM activityIconURLAtIndex:index + 4];
}

- (void)homeHeaderView:(TRHomeHeaderView *)homeHeaderView didSelectedItemInActivityBottomAtIndex:(NSInteger)index{
    NSLog(@"333");
}

- (NSInteger)numberOfAdInHomeHeaderView:(TRHomeHeaderView *)homeHeaderView{
    return self.homeVM.adNumber;
}

- (NSURL *)homeHeaderView:(TRHomeHeaderView *)homeHeaderView iconURLAtIndex:(NSInteger)index{
    return [self.homeVM adIconURLAtIndex:index];
}

- (void)homeHeaderView:(TRHomeHeaderView *)homeHeaderView didSelectedItemAtIndex:(NSInteger)index{
    NSLog(@"...");
}

#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];
    _headerView.delegate = self;
    _headerView.dataSource = self;
    MJWeakSelf
    [self.tableView addHeaderRefresh:^{
        [weakSelf.homeVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            NSLog(@"");
            [weakSelf.tableView endHeaderRefresh];
            [_headerView reloadData];
            [weakSelf.tableView reloadData];
        }];
    }];
    [self.tableView beginHeaderRefresh];
    
    [self.tableView addFooterRefresh:^{
        [weakSelf.homeVM getDataWithMode:RequestModeMore completionHandler:^(NSError *error) {
            [weakSelf.tableView endFooterRefresh];
            [weakSelf.tableView reloadData];
        }];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.homeVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TRHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TRHomeCell" forIndexPath:indexPath];
    [cell.cookerIconIV setImageWithURL:[self.homeVM cookerIconForRow:indexPath.row] placeholder:[UIImage imageNamed:@"dishinfo_icon"]];
    cell.titleLb.attributedText = [self.homeVM titleForRow:indexPath.row];
    cell.detailL.attributedText = [self.homeVM descForRow:indexPath.row];
    cell.indexPath = indexPath;
    cell.delegate = self;
    cell.dataSource = self;
    [cell reloadData];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[TRDetailViewController detailVCWithKitchenId:[self.homeVM kitchenIdForRow:indexPath.row]] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - lazy
- (TRHomeViewModel *)homeVM {
    if(_homeVM == nil) {
        _homeVM = [[TRHomeViewModel alloc] init];
    }
    return _homeVM;
}

@end
