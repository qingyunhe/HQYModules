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

@end

@implementation HQYViewController

- (void)viewDidLoad {
    [super viewDidLoad];

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
        tabBarButton.frame = CGRectMake(tabBarButtonX, tabBarButtonY, i * tabBarButtonW, tabBarButtonH);
        UIViewController *vc = self.childViewControllers[i];
        [tabBarButton setTitle:vc.title forState:UIControlStateNormal];
        tabBarButton.backgroundColor = [UIColor orangeColor];
        [self.tabBarView addSubview:tabBarButton];
    }

}


@end