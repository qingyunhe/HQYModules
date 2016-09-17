

//
//  HQYDownMenuController.m
//  HQYModules
//
//  Created by 江城程序猿 on 16/9/15.
//  Copyright © 2016年 江城程序猿. All rights reserved.
//

#import "HQYDownMenuController.h"
#import "HQYDownMenu.h"

@interface HQYDownMenuController ()
/** 菜单是否弹出 */
@property(nonatomic,assign) BOOL isPopMenu;

/** downMenuView */
@property (nonatomic,weak) UIView *downMenuView;

@end

@implementation HQYDownMenuController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];
    
    [self setUpDownMenuButton];

}

- (void)setUpDownMenuButton{

    UIButton *downMenuButton = [[UIButton alloc] init];
    [downMenuButton setTitle:@"快点我吧😄" forState:UIControlStateNormal];
    [downMenuButton setFont:[UIFont boldSystemFontOfSize:25]];
    downMenuButton.frame = CGRectMake(50, 50, 150, 30);
    downMenuButton.center = self.view.center;
    [self.view addSubview:downMenuButton];
    [downMenuButton addTarget:self action:@selector(downMenuButtonClick) forControlEvents:UIControlEventTouchUpInside];
}

#pragma - mark 下拉菜单按钮的点击
- (void)downMenuButtonClick{

    [self popMenu];
    
}

#pragma - mark 监听导航条右边按钮的点击
- (void)popMenu{
    
    if (_isPopMenu == NO) {
        
        self.downMenuView = [HQYDownMenu showMenuInView:self.view WithTarget:self action:@selector(buttonClick:)];
        
    }else{
        // 隐藏菜单
        [UIView animateWithDuration:0.5 animations:^{
            
            self.downMenuView.transform = CGAffineTransformMakeTranslation(0, - self.downMenuView.frame.size.height);
            
        } completion:^(BOOL finished) {
            
            [self.downMenuView removeFromSuperview];
            
        }];
        
    }
    _isPopMenu = !_isPopMenu;
    
}

- (void)buttonClick:(UIButton *)button{

    NSLog(@"在这里你可以做一些不可描述的事情");

}


@end
