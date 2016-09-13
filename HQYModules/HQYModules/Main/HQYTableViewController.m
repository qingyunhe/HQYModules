//
//  HQYTableViewController.m
//  HQYModules
//
//  Created by 江城程序猿 on 16/5/15.
//  Copyright © 2016年 江城程序猿. All rights reserved.
//

#import "HQYTableViewController.h"
#import "HQYTableViewCell.h"
#import "HQYReorderingController.h"
#import "HQYCascadingMenuController.h"
#import "HQYStatusBarController.h"

@interface HQYTableViewController ()

@end

@implementation HQYTableViewController

static NSString * const HQYID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"江城程序猿";
    self.tableView.rowHeight = 66;
    
    // 设置背景视图
    [self backgroundView];
}

#pragma - mark 设置背景视图
- (void)backgroundView{

    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"bg"];
    self.tableView.backgroundView = imageView;
}

#pragma - mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HQYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HQYID];
    if (cell == nil) {
        cell = [[HQYTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:HQYID];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:25];

    NSString *text = nil;
    switch (indexPath.row) {
        case 0:
        {
            // HQYCollectionView Reordering
            text = @"UICollectionView重排";
            break;
        }
        case 1:
        {
            // HQYCascadingMenu
            text = @"级联菜单";
            break;
        }
        case 2:
        {
            // HQYStatusBar
            text = @"自定义系统状态栏(服务商,网络信号,时间,电池)";
            cell.textLabel.font = [UIFont systemFontOfSize:15];
            break;
        }
        case 3:
        {
            // HQYDownMenu
            text = @"自定义下拉菜单";
            break;
        }
        case 4:
        {
            text = @"待续 😄😄😄😄😄😄";
            break;
        }
        case 5:
        {
            text = @"待续 😄😄😄😄😄😄";
            break;
        }
        case 6:
        {
            text = @"待续 😄😄😄😄😄😄";
            break;
        }
        case 7:
        {
            text = @"待续 😄😄😄😄😄😄";
            break;
        }
        case 8:
        {
            text = @"待续 😄😄😄😄😄😄";
            break;
        }
        case 9:
        {
            text = @"待续 😄😄😄😄😄😄";
            break;
        }
            
        default:
            break;
    }
    
    cell.textLabel.text = text;
    
    return cell;
}

#pragma - mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0:
        {
            HQYReorderingController *reorderingVc = [[HQYReorderingController alloc] init];
            reorderingVc.title = @"UICollectionView重排";
            [self.navigationController pushViewController:reorderingVc animated:YES];
            
            break;
        }
        case 1:
        {
            HQYCascadingMenuController *cascadingMenuVc = [[HQYCascadingMenuController alloc] init];
            cascadingMenuVc.title = @"级联菜单";
            [self.navigationController pushViewController:cascadingMenuVc animated:YES];
            break;
        }
        case 2:
        {
            HQYStatusBarController *statusBarVc = [[HQYStatusBarController alloc] init];
            statusBarVc.title = @"自定义系统状态栏";
            [self.navigationController pushViewController:statusBarVc animated:YES];
            break;
        }
        default:
            break;
    }
}

@end