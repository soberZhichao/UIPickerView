//
//  FlagField.m
//  06-注册界面
//
//  Created by xiaomage on 15/9/6.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "FlagField.h"

#import "Flag.h"
#import "FlagView.h"

@interface FlagField () <UIPickerViewDataSource,UIPickerViewDelegate>

// 如何判断定义不可变还是可变,就判断数组里保存什么,如果保存是模型,就用可变
// 保存模型
@property (nonatomic, strong) NSMutableArray *flags;

@end

@implementation FlagField


// 初始化文字的方法
- (void)initialText
{
    [self pickerView:nil didSelectRow:0 inComponent:0];
}

- (NSMutableArray *)flags
{
    if (_flags == nil) {
        
        _flags = [NSMutableArray array];
        
        
        // 1.拿到filePath
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil];
        // 2.根据filePath创建JSON数据
        NSArray *dictArr = [NSArray arrayWithContentsOfFile:filePath];
        
        // 3.dict->Model
        for (NSDictionary *dict in dictArr) {
            id obj = [Flag flagWithDict:dict];
            [_flags addObject:obj];
        }
        
        
    }
    return _flags;
}

// 只要从xib或者stroyboard加载就会调用这个方法,只会调用一次
- (void)awakeFromNib
{
    [self setUp];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setUp];
        
    }
    return self;
}

// 初始化操作
- (void)setUp
{
    
    
    
    // 创建国旗键盘
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    
    pickerView.dataSource = self;
    
    pickerView.delegate = self;
    
    // 自定义键盘
    self.inputView = pickerView;
    
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.flags.count;
}


#pragma mark - UIPickerViewDelegate
// 返回第component列第row行的控件
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view

{
    
    Flag *flag = self.flags[row];
   
    FlagView *flagView = [FlagView flagView];
    
    flagView.flag = flag;
    
    
    return flagView;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 100;
}

// 选中某一行的时候调用
// 给文本框赋值
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
     Flag *flag = self.flags[row];
    
    self.text = flag.name;
}
@end
