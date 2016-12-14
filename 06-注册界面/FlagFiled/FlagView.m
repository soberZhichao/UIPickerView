//
//  FlagView.m
//  06-注册界面
//
//  Created by xiaomage on 15/9/6.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "FlagView.h"

#import "Flag.h"

@interface FlagView ()

@property (weak, nonatomic) IBOutlet UILabel *nameView;


@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation FlagView

+ (instancetype)flagView
{
    return [[NSBundle mainBundle] loadNibNamed:@"FlagView" owner:nil options:nil][0];
}

- (void)setFlag:(Flag *)flag
{
    _flag = flag;
    
    // 给控件赋值
    _nameView.text = flag.name;
    
    _iconView.image = flag.icon;
    
}
@end
