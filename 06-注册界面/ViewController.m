//
//  ViewController.m
//  06-注册界面
//
//  Created by xiaomage on 15/9/6.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "ViewController.h"

#import "CityField.h"

@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *flagField;
@property (weak, nonatomic) IBOutlet UITextField *birthdayField;
@property (weak, nonatomic) IBOutlet UITextField *cityField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 监听国旗文本框的输入
    _flagField.delegate = self;
    _birthdayField.delegate = self;
    _cityField.delegate = self;
    
}

#pragma mark - UITextFieldDelegate
// 是否允许用户输入文字
// 拦截用户的输入
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    return NO;
}

// 文本框开始编辑的时候调用
- (void)textFieldDidBeginEditing:(id)textField
{
   
    // id特性:能调用任何对象的方法
    [textField initialText];
    
    NSLog(@"%@",textField);
    // 给文本框初始化文字
//    [textField initialText];
    
}

@end
