//
//  HQYMainCategoryController.h
//  HQYModules
//
//  Created by 江城程序猿 on 16/8/16.
//  Copyright © 2016年 江城程序猿. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HQYMainCategoryController;

@protocol HQYMainCategoryControllerDelegate <NSObject>

@optional

- (void)categoryViewController:(HQYMainCategoryController *)mainCategoryViewController didSelectSubCategories:(NSArray *)subCategories;

@end

@interface HQYMainCategoryController : UITableViewController

@property (nonatomic, weak) id<HQYMainCategoryControllerDelegate> delegate;

@end
