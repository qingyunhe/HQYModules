//
//  HYQHealthItem.h
//  级联菜单
//
//  Created by 江城程序猿 on 16/8/16.
//  Copyright © 2016年 江城程序猿. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HYQHealthItem : NSObject
/** 名称*/
@property (nonatomic,strong) NSString *name;
/** 具体项目 */
@property(nonatomic,strong) NSArray *subcategories;
/** 字典转模型 */
+ (instancetype)categoryWithDict:(NSDictionary *)dict;

@end
