//
//  HYQHealthItem.m
//  级联菜单
//
//  Created by 江城程序猿 on 16/8/16.
//  Copyright © 2016年 江城程序猿. All rights reserved.
//

#import "HYQHealthItem.h"

@implementation HYQHealthItem

+ (instancetype)categoryWithDict:(NSDictionary *)dict{
    
    HYQHealthItem *item = [[self alloc] init];
    [item setValuesForKeysWithDictionary:dict];
    return item;
}

@end
