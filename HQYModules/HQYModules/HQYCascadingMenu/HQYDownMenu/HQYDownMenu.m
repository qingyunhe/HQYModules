//
//  HQYDownMenu.m
//  HQYModules
//
//  Created by 江城程序猿 on 16/9/15.
//  Copyright © 2016年 江城程序猿. All rights reserved.
//

#import "HQYDownMenu.h"
@interface HQYDownMenu()
/** menuView */
@property (nonatomic,weak) UIView *menuView;

@end

@implementation HQYDownMenu

+ (instancetype)showMenuInView:(UIView *)view WithTarget:(id)target action:(SEL)action{
    
    NSInteger row = 5;
    
    // HQYScreenWidth - 100
    CGRect downMenuViewFrame = CGRectMake(HQYScreenWidth - 100, 64, 100, 44 * row);
    HQYDownMenu *downMenuView = [[HQYDownMenu alloc] initWithFrame:downMenuViewFrame];
    
    CGFloat x = 0;
    CGFloat h = 44;
    CGFloat w = 100;
    
    for (NSInteger i = 0; i < row; ++i) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button .tag = i;
        button.frame = CGRectMake(x, i * h, w, h);
        [downMenuView addSubview:button];
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        
        // 添加与菜单同色的背景view
        CGRect backViewFrame = CGRectMake(HQYScreenWidth - 100, 64, 100, 44);
        UIView *backView = [[UIView alloc] initWithFrame:backViewFrame];
        backView.backgroundColor = [UIColor redColor];
        [view addSubview:backView];
        
        
        CGFloat ratio = 0.1;
        downMenuView.transform = CGAffineTransformMakeTranslation(0, - (ratio * downMenuView.frame.size.height));
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8
              initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                  
                  downMenuView.transform = CGAffineTransformIdentity;
                  
              } completion:^(BOOL finished) {
                  [backView removeFromSuperview];
              }];
        
        if (button.tag == 0) {
            [button setTitle:@"原味酸奶" forState:UIControlStateNormal];
        }
        if (button.tag == 1) {
            [button setTitle:@"芒果酸奶" forState:UIControlStateNormal];
        }
        if (button.tag == 2) {
            [button setTitle:@"蓝莓酸奶" forState:UIControlStateNormal];
        }
        if (button.tag == 3) {
            [button setTitle:@"菠萝酸奶" forState:UIControlStateNormal];
        }
        if (button.tag == 4) {
            [button setTitle:@"蜜柚酸奶" forState:UIControlStateNormal];
        }
    }
    
    downMenuView.backgroundColor = [UIColor redColor];
    
    // 此处不能将downMenuView添加到主窗口中
    // [[UIApplication sharedApplication].keyWindow addSubview:downMenuView];
    [view addSubview:downMenuView];
    
    return downMenuView;
}

@end
