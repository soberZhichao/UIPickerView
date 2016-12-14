//
//  CityField.m
//  06-注册界面
//
//  Created by xiaomage on 15/9/6.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//


#import "Province.h"
#import "CityField.h"

@interface CityField () <UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic, assign) NSInteger selProvinceIndex;

@property (nonatomic, strong) NSMutableArray *provinces;

@property (nonatomic, weak) UIPickerView *pickerView;

@end

@implementation CityField

// 初始化文字的方法
- (void)initialText
{
    [self pickerView:self.pickerView didSelectRow:0 inComponent:0];
}


- (NSMutableArray *)provinces
{
    if (_provinces == nil) {
        // 保存模型
        _provinces = [NSMutableArray array];
        
        // 加载字典数组,
        // 1.拿到filePath
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"provinces.plist" ofType:nil];
        // 2.根据filePath创建JSON数据
        NSArray *dictArr = [NSArray arrayWithContentsOfFile:filePath];
        
        // 3.dict->Model
        for (NSDictionary *dict in dictArr) {
            id obj = [Province modelWithDict:dict];
            [_provinces addObject:obj];
        }
    }
    return _provinces;
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
    // 创建pickerView
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    
    _pickerView = pickerView;
    
    pickerView.dataSource = self;
    
    pickerView.delegate = self;
    
    // 自定义文本框键盘
    self.inputView = pickerView;
}

#pragma mark - 数据源方法
// PickerView 2列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) { // 第0列描述省,第0列有多少行,得看下有多少个省
        
        return self.provinces.count;
        
    }else{ // 第1列描述第0列选中的省的城市,第1列有多少行,看下选中的省会有多少个城市
        
        // 获取第0列选中的省会模型
       Province *p =  self.provinces[_selProvinceIndex];
        
        return p.cities.count;
        
    }
}

// 返回每一行的标题
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) { // 描述省会的标题
        
        // 获取对应的省模型
        Province *p = self.provinces[row];
        
        return p.name;
        
    }else{ // 描述选中的省会的城市标题
        
        // 获取第0列选中的省会模型
        Province *p =  self.provinces[_selProvinceIndex];
        
        // 获取城市标题
        return p.cities[row];
        
    }
}

// 选中某一行的时候调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) { // 滚动省会
        // 记录下选中的省会角标
        _selProvinceIndex = row;
        
        // 刷新第1列的城市
        [pickerView reloadComponent:1];
        
        // 让pickerView选中第1列第0行
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
    

    
    // 获取选中的省
    Province *p = self.provinces[_selProvinceIndex];
    
    // 获取选中的城市
    NSArray *cities = p.cities;
    
    // 获取第1列选中的行
    NSInteger cityIndex = [pickerView selectedRowInComponent:1];
    
    // 获取选中的城市
    NSString *cityName = cities[cityIndex];
    
    // 给文本框赋值
    self.text = [NSString stringWithFormat:@"%@ %@",p.name, cityName];
}



@end
