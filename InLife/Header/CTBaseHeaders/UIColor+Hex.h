//
//  UIColor+Hex.h
//  16进制颜色格式支持
//
//  Created by Blacknight on 15-5-16.
//  Copyright (c) 2015年 cattsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

/**
 *  获取颜色对象
 *
 *  @param hexValue   16进制值
 *  @param alphaValue alpha值
 *
 *  @return 颜色对象
 */
+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

/**
 *  获取颜色对象
 *
 *  @param hexValue 16进制值
 *
 *  @return 颜色对象
 */
+ (UIColor*)colorWithHex:(NSInteger)hexValue;

/**
 *  获取16进制字符串颜色
 *
 *  @param color 颜色对象
 *
 *  @return 字符串格式颜色
 */
+ (NSString *)hexStringFromUIColor:(UIColor*)color;

@end
