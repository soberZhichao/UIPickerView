//
//  FlagView.h
//  06-注册界面
//
//  Created by xiaomage on 15/9/6.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Flag;
@interface FlagView : UIView


@property (nonatomic, strong) Flag *flag;

+ (instancetype)flagView;

@end
