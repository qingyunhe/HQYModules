//
//  HQYCascadingMenuController.m
//  HQYModules
//
//  Created by 江城程序猿 on 16/8/16.
//  Copyright © 2016年 江城程序猿. All rights reserved.
//

#import "HQYCascadingMenuController.h"
#import "HQYMainCategoryController.h"
#import "HQYSubCategoryController.h"

@interface HQYCascadingMenuController ()

@end

@implementation HQYCascadingMenuController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat width = self.view.frame.size.width * 0.5;
    CGFloat height = self.view.frame.size.height;
    
    HQYSubCategoryController *subCategoryVc = [[HQYSubCategoryController alloc] init];
    subCategoryVc.view.frame = CGRectMake(width, 0, width, height);
    [self addChildViewController:subCategoryVc];
    [self.view addSubview:subCategoryVc.view];
    
    HQYMainCategoryController *mainCategoryVc = [[HQYMainCategoryController alloc] init];
    mainCategoryVc.delegate = subCategoryVc;
    mainCategoryVc.view.frame = CGRectMake(0, 0, width, height);
    [self addChildViewController:mainCategoryVc];
    [self.view addSubview:mainCategoryVc.view];
    
}

@end