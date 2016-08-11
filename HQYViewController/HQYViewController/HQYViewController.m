//
//  HQYViewController.m
//  HQYViewController
//
//  Created by 江城程序猿 on 16/8/9.
//  Copyright © 2016年 江城程序猿. All rights reserved.
//

#import "HQYViewController.h"

@interface HQYViewController ()
/** 自定义选项卡 */
@property (nonatomic,weak) UIView *tabBarView;
/** 选项卡是否初始化 */
@property (nonatomic,assign,getter=isInitialled) BOOL isInitialled;
/** contentView */
@property (nonatomic,weak) UIView *contentView;
/** 被选中的按钮 */
@property (nonatomic,weak) UIButton *selectedButton;

@end

@implementation HQYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *contentView = [[UIView alloc] init];
    self.contentView.frame = self.view.bounds;
    [self.view addSubview:contentView];
    self.contentView = contentView;

    UIView *tarBarView = [[UIView alloc] init];
    self.tabBarView = tarBarView;
    CGFloat tabBarViewX = 0;
    CGFloat tabBarViewY = [UIScreen mainScreen].bounds.size.height - 49;
    CGFloat tabBarViewW = [UIScreen mainScreen].bounds.size.width;
    CGFloat tabBarViewH = 49;
    
    self.tabBarView.frame = CGRectMake(tabBarViewX, tabBarViewY, tabBarViewW, tabBarViewH);
    self.tabBarView.backgroundColor = [UIColor whiteColor];

    [self.view addSubview:self.tabBarView];

}

#pragma - mark 添加选项卡中的item
- (void)viewWillAppear:(BOOL)animated{
    
    if(self.isInitialled == NO){
    
        [self setUpTabBar];
    }
    self.isInitialled = YES;
}

#pragma - mark 初始化选项卡
- (void)setUpTabBar{

    CGFloat count = self.childViewControllers.count;
    CGFloat tabBarButtonX = [UIScreen mainScreen].bounds.size.width / count;
    CGFloat tabBarButtonY = 0;
    CGFloat tabBarButtonW = [UIScreen mainScreen].bounds.size.width / count;
    CGFloat tabBarButtonH = 49;
    for(NSInteger i = 0; i < count; ++i) {
        
        UIButton *tabBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        tabBarButton.tag = i;
        tabBarButton.frame = CGRectMake(i * tabBarButtonX, tabBarButtonY, tabBarButtonW, tabBarButtonH);
        UIViewController *vc = self.childViewControllers[i];
        [tabBarButton setTitle:vc.title forState:UIControlStateNormal];
        [tabBarButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [tabBarButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBarView addSubview:tabBarButton];
    }
}

#pragma - mark 监听选项卡上按钮的点击
- (void)tabBarButtonClick:(UIButton *)tabBarButton{
    
    // 设置选中状态下的按钮的颜色
    self.selectedButton.selected = NO;
    tabBarButton.selected = YES;
    self.selectedButton = tabBarButton;

    // 添加子控制器的view前,先移除contentView中的视图
    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UIViewController *vc = self.childViewControllers[tabBarButton.tag];
    [self.contentView addSubview:vc.view];

}


@end