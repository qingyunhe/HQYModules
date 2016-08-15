//
//  HQYTableViewCell.m
//  HQYModules
//
//  Created by 江城程序猿 on 16/5/15.
//  Copyright © 2016年 江城程序猿. All rights reserved.
//

#import "HQYTableViewCell.h"

@implementation HQYTableViewCell

- (void)setFrame:(CGRect)frame{
    
    frame.origin.x += 10;
    frame.origin.y += 10;
    frame.size.height -= 10;
    frame.size.width -= 20;
    
    [super setFrame:frame];
}

@end
