//
//  ViewController.m
//  WanHeGardenShop
//
//  Created by 江城程序猿 on 16/5/31.
//  Copyright © 2016年 Personnal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:scrollView];
    scrollView.frame = CGRectMake(50, 50, 200, 200);
    // 增加购物车功能
    // 完善图片轮播器功能
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
