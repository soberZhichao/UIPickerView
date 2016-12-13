//
//  Flag.h
//  06-注册界面
//
//  Created by xiaomage on 15/9/6.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface Flag : NSObject

@property (nonatomic, strong) NSString *name;

// 保存图片名称
//@property (nonatomic, strong) NSString *icon;

@property (nonatomic, strong) UIImage *icon1;

+ (instancetype)flagWithDict:(NSDictionary *)dict;

@end
