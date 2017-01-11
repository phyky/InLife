//
//  PHYTabBarEntity.h
//  APPTest
//
//  Created by pang on 16/11/22.
//  Copyright © 2016年 gdcattsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PHYTabBarEntity : NSObject
/**
 *  item下标
 */
@property(nonatomic,assign) NSInteger index;
/**
 *  标题
 */
@property(nonatomic,strong) NSString *title;
/**
 *  未选中标题颜色
 */
@property(nonatomic,strong) UIColor *normalTitleColor;
/**
 *  选中标题颜色
 */
@property(nonatomic,strong) UIColor *selectedTitleColor;
/**
 *  未选中背景图片
 */
@property(nonatomic,strong) NSString *normalImg;
/**
 *  选中背景图片
 */
@property(nonatomic,strong) NSString *selectedImg;
/**
 *  对应控制器的名字
 */
@property(nonatomic,strong) NSString *controllerName;
/**
 *  当前是否被选择
 */
@property(nonatomic,assign) BOOL isSelected;

@end
