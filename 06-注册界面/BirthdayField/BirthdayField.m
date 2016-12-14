//
//  BirthdayField.m
//  06-注册界面
//
//  Created by xiaomage on 15/9/6.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "BirthdayField.h"

@interface BirthdayField ()

@property (nonatomic, weak) UIDatePicker *datePicker;
@end

@implementation BirthdayField

// 初始化文字的方法
- (void)initialText
{
    [self dateChamge:self.datePicker];
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}
- (void)awakeFromNib
{
    [self setUp];
}

// 初始化
- (void)setUp
{
    
    // 创建日期选择控件
    UIDatePicker *dateP = [[UIDatePicker alloc] init];
    
    _datePicker = dateP;
    
    // 设置日期模式,年月日
    dateP.datePickerMode = UIDatePickerModeDate;
    
    // 设置地区 zh:中国标识
    dateP.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    
    [dateP addTarget:self action:@selector(dateChamge:) forControlEvents:UIControlEventValueChanged];
    
    // 自定义文本框的键盘
    self.inputView = dateP;
}

// 只要UIDatePicker选中的时候调用
- (void)dateChamge:(UIDatePicker *)picker
{
    // 2015-09-06 yyyy-MM-dd
    // 创建一个日期格式字符串对象
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    self.text = [fmt stringFromDate:picker.date];
}

@end
