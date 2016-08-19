//
//  HQYStatusBarController.m
//  HQYModules
//
//  Created by 江城程序猿 on 16/8/19.
//  Copyright © 2016年 江城程序猿. All rights reserved.
//

#import "HQYStatusBarController.h"

@interface HQYStatusBarController ()

@end

@implementation HQYStatusBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpStatusBar];
}

- (void)setUpStatusBar{
    
    UIApplication *app = [UIApplication sharedApplication];
    UIView *statusBar = [app valueForKeyPath:@"statusBar"];
    statusBar.frame = (CGRect){0, 100, 350, 20};
    statusBar.center = self.view.center;
    statusBar.backgroundColor = [UIColor orangeColor];
    
    // 拿到UIStatusBarForegroundView对象
    UIView *barForegroundView =  statusBar.subviews[1];
    
    // 设置服务商
    UIView *seviceView =  barForegroundView.subviews[0];
    CGRect seviceFrame = seviceView.frame;
    seviceFrame.size.width = 2 *  seviceFrame.size.width;
    seviceView.frame = seviceFrame;
    seviceView.hidden = YES;
    UILabel *seviceLabel = [[UILabel alloc] init];
    seviceLabel.frame = seviceFrame;
    seviceLabel.text = @"66666";
    seviceLabel.font = [UIFont systemFontOfSize:10];
    [barForegroundView addSubview:seviceLabel];
    
    // 设置网络信号
    UIView *networkView =  barForegroundView.subviews[1];
    networkView.backgroundColor = [UIColor greenColor];
    
    // 设置电池
    UIView *batteryView = barForegroundView.subviews[2];
    batteryView.hidden = YES;
    CGRect batteryFrame = batteryView.frame;
    UILabel *batteryLabel = [[UILabel alloc] init];
    batteryLabel.frame = batteryFrame;
    batteryLabel.text = @"电池";
    batteryLabel.font = [UIFont systemFontOfSize:10];
    [barForegroundView addSubview:batteryLabel];
    
    // 设置时间
    UIView *timeView = barForegroundView.subviews[3];
    timeView.hidden = YES;
    CGRect timeFrame = timeView.frame;
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.frame = timeFrame;
    timeLabel.text = @"时间去哪儿";
    timeLabel.font = [UIFont systemFontOfSize:10];
    [barForegroundView addSubview:timeLabel];
}

@end