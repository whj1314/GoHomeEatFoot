//
//  TRDetailViewController.m
//  DaDaCook
//
//  Created by tarena on 16/8/23.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "TRDetailViewController.h"
#import "TRCommonDishCell.h"
#import "TRDetailViewModel.h"
#import "TRRecommendCell.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "TRKitchenMapViewController.h"

@interface TRDetailViewController ()<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, CHTCollectionViewDelegateWaterfallLayout>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
//最下方那个购物结算视图的底部约束，用于制作动画
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraintForBottomView;
//下方购物车按钮
@property (weak, nonatomic) IBOutlet UIButton *cartBtn;



//头部视图中需要下拉放大的视图
@property (weak, nonatomic) IBOutlet UIImageView *headerIcon;

@property (nonatomic) TRDetailViewModel *detailVM;

//用于存储每次动画生成的红色圆点,用于释放用
@property (nonatomic) NSMutableArray *redBalls;

//头部视图中 评论视图
@property (weak, nonatomic) IBOutlet UICollectionView *commentCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *commentNumberLb;

//头部视图中 标签视图
@property (weak, nonatomic) IBOutlet UICollectionView *authCollectionView;

//用户位置部分
@property (weak, nonatomic) IBOutlet UILabel *addressLb;
@property (weak, nonatomic) IBOutlet UILabel *distanceLb;

//厨房信息介绍
@property (weak, nonatomic) IBOutlet UIImageView *cookerIcon;
@property (weak, nonatomic) IBOutlet UILabel *cookerNameLb;



@end

@implementation TRDetailViewController
//通过storyboard上的连线跳转操作,会自动进入下方方法.
//厨房页面是通过添加在位置UI上的tap手势触发的
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"kitchenMap"]) {
        TRKitchenMapViewController *mapVC = segue.destinationViewController;
        mapVC.coordinate = self.detailVM.coordinate;
    }
}


#pragma mark - UICOllectionView Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (collectionView == _commentCollectionView) {
        return [self.detailVM commentTagNumber];
    }
    if (collectionView == _authCollectionView) {
        return self.detailVM.authNumber;
    }
    return 6;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == _commentCollectionView) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
        UILabel *lb = (UILabel *)[cell.contentView viewWithTag:100];
        lb.text = [self.detailVM commentTagForRow:indexPath.row];
        return cell;
    }
    if (collectionView == _authCollectionView) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
        UILabel *lb = (UILabel *)[cell.contentView viewWithTag:200];
        lb.text = [self.detailVM authNameForRow:indexPath.row];
        UIImageView *iv = (UIImageView *)[cell.contentView viewWithTag:100];
        [iv setImageWithURL:[self.detailVM authIconURLForRow:indexPath.row] placeholder:[UIImage imageNamed:@"defaultimage_small"]];
        return cell;
    }
    return [UICollectionViewCell new];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (collectionView == _authCollectionView) {
        return CGSizeMake(47, 67);
    }
    //此处根据文字个数和字体大小算出不同的内容需要的宽度即可
    //YYKit的NSString分类提供了简单的方法
    return CGSizeMake([[self.detailVM commentTagForRow:indexPath.row] widthForFont:[UIFont systemFontOfSize:13]] + 10, 21);
}

#pragma mark - method
- (IBAction)backBtnClicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UIScrollView Delegate
//下拉放大的关键代码
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.tableView) {
        //在sb中设置的头部高度是128，并且图片的内容模式必须是 AspectFill。
        CGFloat y = scrollView.contentOffset.y;
        //        NSLog(@"y %f", y);//向下拉动为负数
        if (y <= 0) {
            //头部视图必须不能够切除掉多余部分的视图，即clipsToBounds属性必须是NO
            //否则就算图片变大了，也没法超越到外部
            _headerIcon.frame = CGRectMake(0, y, kScreenW, 208  - y);
        }
    }
}


#pragma mark - UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%ld, %ld", self.detailVM.recommendNumber, self.detailVM.dishNumber);
    if (section == 0) {
        return self.detailVM.recommendNumber;
    }
    return self.detailVM.dishNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        TRRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TRRecommendCell" forIndexPath:indexPath];
        [cell.iconIV setImageWithURL:[self.detailVM recommendIconURLForRow:indexPath.row] placeholder:[UIImage imageNamed:@"defaultimage_small"]];
        cell.titleLb.text = [self.detailVM recommendTitleForRow:indexPath.row];
        cell.detailLb.text = [self.detailVM recommendDetailForRow:indexPath.row];
        cell.priceLb.text = [self.detailVM recommendPriceForRow:indexPath.row];
        cell.descLb.text = [self.detailVM recommendDescForRow:indexPath.row];
        __weak typeof(cell) weakCell = cell;
        [cell setAddHandler:^(UIButton *btn){
            //点击加号以后 要执行抛物线下落动画
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            UIBezierPath *path = [UIBezierPath bezierPath];
            //convertPoint:toView 转化某个视图中的某个点到另外一个坐标系
            [path moveToPoint:[weakCell.contentView convertPoint:btn.center toView:self.view]];
            [path addQuadCurveToPoint:_cartBtn.center controlPoint:CGPointMake(20, 200)];
            animation.path = path.CGPath;
            UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(-20, -20, 20, 20)];
            redView.layer.cornerRadius = 10;
            redView.backgroundColor = kRGBA(242, 114, 66, 1.0);
            [self.view addSubview:redView];
            animation.duration = 1;
            animation.delegate = self;
            [redView.layer addAnimation:animation forKey:nil];
            //把动画视图加入数组中, 方便动画结束后的释放.
            //这个非通用解决方案. 只是针对于当前情况
            [self.redBalls addObject:redView];
        }];
        
        return cell;
    }
    
    if (indexPath.section == 1) {
        TRCommonDishCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TRCommonDishCell" forIndexPath:indexPath];
        [cell.iconIV setImageWithURL:[self.detailVM dishIconURLForRow:indexPath.row] placeholder:[UIImage imageNamed:@"defaultimage_small"]];
        cell.titleLb.text = [self.detailVM dishTitleForRow:indexPath.row];
        cell.detailLb.text = [self.detailVM dishDetailForRow:indexPath.row];
        cell.priceLb.text = [self.detailVM dishPriceForRow:indexPath.row];
        __weak typeof(cell) weakCell = cell;
        [cell setAddHandler:^(UIButton *btn){
            //点击加号以后 要执行抛物线下落动画
            CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
            UIBezierPath *path = [UIBezierPath bezierPath];
            //convertPoint:toView 转化某个视图中的某个点到另外一个坐标系
            [path moveToPoint:[weakCell.contentView convertPoint:btn.center toView:self.view]];
            [path addQuadCurveToPoint:_cartBtn.center controlPoint:CGPointMake(20, 200)];
            animation.path = path.CGPath;
            UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(-20, -20, 20, 20)];
            redView.layer.cornerRadius = 10;
            redView.backgroundColor = kRGBA(242, 114, 66, 1.0);
            [self.view addSubview:redView];
            animation.duration = 1;
            animation.delegate = self;
            [redView.layer addAnimation:animation forKey:nil];
            //把动画视图加入数组中, 方便动画结束后的释放.
            //这个非通用解决方案. 只是针对于当前情况
            [self.redBalls addObject:redView];
        }];
        
        return cell;
    }
    return [UITableViewCell new];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    //最先完成的动画 一定是数组中的最先加入的元素
    [self.redBalls.firstObject removeFromSuperview];
    [self.redBalls removeFirstObject];
    //关键帧动画: 查看第二阶段笔记
    [UIView animateKeyframesWithDuration:.4 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        //startTime和duration都是指总时长的百分数
        
        //0x0.4秒开始,执行0.5x0.4秒时间
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:.5 animations:^{
            _cartBtn.transform = CGAffineTransformMakeScale(1.3, 1.3);
        }];
        //0.5x0.4秒开始,执行0.5x0.4秒时间
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:.5 animations:^{
            _cartBtn.transform = CGAffineTransformIdentity;
        }];
        
    } completion:^(BOOL finished) {
        
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
//cell自适应高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [tableView fd_heightForCellWithIdentifier:@"TRRecommendCell" configuration:^(TRRecommendCell *cell) {
            //因为只有描述有可能为1行/2行, 会影响到cell的算高. 其他UI元素的高度已经被约束锁死不变了!
            cell.descLb.text = [self.detailVM recommendDescForRow:indexPath.row];
        }];
    }else{
        return [tableView fd_heightForCellWithIdentifier:@"TRCommonDishCell" configuration:^(TRCommonDishCell *cell) {
            cell.titleLb.text = [self.detailVM dishTitleForRow:indexPath.row];
            cell.detailLb.text = [self.detailVM dishDetailForRow:indexPath.row];
            cell.priceLb.text = [self.detailVM dishPriceForRow:indexPath.row];
        }];
    }
}

#pragma mark - life
+ (instancetype)detailVCWithKitchenId:(NSInteger)kitchenId{
    TRDetailViewController *vc = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateViewControllerWithIdentifier:@"TRDetailViewController"];
    vc.kitchenId = kitchenId;
    vc.hidesBottomBarWhenPushed = YES;
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view showHUD];
    
    [self.detailVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
        [self.view hideHUD];
        [self.tableView reloadData];
        [_commentCollectionView reloadData];
        [_authCollectionView reloadData];
        _addressLb.text = self.detailVM.address;
        _distanceLb.text = [@"相距" stringByAppendingString:self.detailVM.distance];
        [_cookerIcon setImageWithURL:self.detailVM.cookerIconURL placeholder:[UIImage imageNamed:@"doing_icon"]];
        _cookerNameLb.text = self.detailVM.cookerName;
        self.commentNumberLb.text = [NSString stringWithFormat:@"饭友评论(%ld):", self.detailVM.totalCommentNumber];
    }];
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self scrollViewDidScroll:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [UIView animateWithDuration:.2 animations:^{
        _bottomConstraintForBottomView.constant =0;
        [self.view layoutIfNeeded];
    }];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (TRDetailViewModel *)detailVM {
    if(_detailVM == nil) {
        _detailVM = [[TRDetailViewModel alloc] initWithKitchenId:_kitchenId];
    }
    return _detailVM;
}

- (NSMutableArray *)redBalls {
    if(_redBalls == nil) {
        _redBalls = [[NSMutableArray alloc] init];
    }
    return _redBalls;
}

@end
