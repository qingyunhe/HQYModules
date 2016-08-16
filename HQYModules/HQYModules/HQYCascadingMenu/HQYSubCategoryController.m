//
//  HQYSubCategoryController.m
//  HQYModules
//
//  Created by 江城程序猿 on 16/8/16.
//  Copyright © 2016年 江城程序猿. All rights reserved.
//

#import "HQYSubCategoryController.h"

@interface HQYSubCategoryController ()
/** 子类别数据 */
@property (nonatomic, strong) NSArray *subCategories;
@end

@implementation HQYSubCategoryController

static NSString *HQYSubCategoryControllerID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:HQYSubCategoryControllerID];
}

#pragma mark - HQYMainCategoryControllerDelegate
- (void)categoryViewController:(HQYMainCategoryController *)mainCategoryViewController didSelectSubCategories:(NSArray *)subCategories{
    
    self.subCategories = subCategories;
    // 刷新数据(如果不刷新数据,HQYSubCategoryController中的数据不会显示)
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.subCategories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HQYSubCategoryControllerID];
    cell.textLabel.text = self.subCategories[indexPath.row];
    
    return cell;
}

@end
