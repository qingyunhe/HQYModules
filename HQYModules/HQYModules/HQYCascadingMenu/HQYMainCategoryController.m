//
//  HQYMainCategoryController.m
//  HQYModules
//
//  Created by 江城程序猿 on 16/8/16.
//  Copyright © 2016年 江城程序猿. All rights reserved.
//

#import "HQYMainCategoryController.h"
#import "HYQHealthItem.h"

@interface HQYMainCategoryController ()
/** 所有数据 */
@property (nonatomic, strong) NSArray *mainCategories;

@end

@implementation HQYMainCategoryController

static NSString *HQYMainCategoryControllerID = @"cell";

- (NSArray *)mainCategories
{
    if (_mainCategories == nil) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"health.plist" ofType:nil]];
        
        NSMutableArray *categoryArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            [categoryArray addObject:[HYQHealthItem categoryWithDict:dict]];
        }
        _mainCategories = categoryArray;
    }
    return _mainCategories;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:HQYMainCategoryControllerID];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mainCategories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HQYMainCategoryControllerID];
    
    HYQHealthItem *item = self.mainCategories[indexPath.row];
    cell.textLabel.text = item.name;
    cell.textLabel.highlightedTextColor = [UIColor redColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(categoryViewController:didSelectSubCategories:)]) {
        HYQHealthItem *item = self.mainCategories[indexPath.row];
        [self.delegate categoryViewController:self didSelectSubCategories:item.subcategories];
    }
}

@end
