//
//  CTSinglePickerView.h
//  CTSinglePickerView
//
//  Created by Calon Mo on 16/2/2.
//  Copyright © 2016年 gdcattsoft. All rights reserved.
//  单选弹出框控件，传入的是字典数组或者字符串数组都可以，block返回被选中的字典数据

#import <UIKit/UIKit.h>

typedef void (^CTSinglePickerViewFinishBlock)(id data,int index);
typedef void (^CTSinglePickerViewCancelBlock)(void);

@interface CTSinglePickerView : UIView

/**
 * 初始化函数
 * dataArray:显示的数组(字典数组/字符串数组)
 * showEmpty:是否显示空行（空行即在数组前面加一行：请选择）
 * selectIndex:默认选择某行，默认为0
 * showKey:显示的属性key，默认为name（字典数组时有效）
 */
- (instancetype)initWithDataArray:(NSMutableArray *)dataArray showEmpty:(BOOL)showEmpty selectIndex:(int)selectIndex showKey:(NSString *)showKey finish:(CTSinglePickerViewFinishBlock)finish cancel:(CTSinglePickerViewCancelBlock)cancel;

-(void)show;

@end
