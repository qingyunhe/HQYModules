//
//  HQYReorderingCell.m
//  HQYModules
//
//  Created by 江城程序猿 on 16/5/15.
//  Copyright © 2016年 江城程序猿. All rights reserved.
//

#import "HQYReorderingCell.h"

@implementation HQYReorderingCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        _cellImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5.0, 5.0, frame.size.width - 10.0, frame.size.height - 10.0)];
        [self.contentView addSubview:_cellImageView];
    }
    return self;
}

@end
