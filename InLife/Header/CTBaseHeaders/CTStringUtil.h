//
//  CTStringUtil.h
//  字符串工具类
//
//  Created by jjh on 15-4-20.
//  Copyright (c) 2015年 cattsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTStringUtil : NSObject

/**
 *  字符串是否为空
 *
 *  @param string 检测字符串
 *
 *  @return nil、“”均返回YES，其余返回NO
 */
+ (BOOL)isEmpty:(NSString *)string;

/**
 *  字符串是否为空白
 *
 *  @param string 检测字符串
 *
 *  @return nil、空白字符串均返回YES，其余返回NO
 */
+ (BOOL)isBlank:(NSString *)string;

/**
 *  判断两个字符串是否相等
 *
 *  @param str1 字符串1
 *  @param str2 字符串2
 *
 *  @return 是否相等
 */
+ (BOOL)isEqualBetween:(NSString *)str1 and:(NSString *)str2;

/**
 *  获取字符串值
 *
 *  @param obj 对象
 *
 *  @return 字符串
 */
+ (NSString *)stringValueWithObject:(id)obj;
+ (NSString *)stringValueWithInt:(int)intValue;
+ (NSString *)stringValueWithLong:(long)longValue;
+ (NSString *)stringValueWithLongLong:(long long)longLongValue;
+ (NSString *)stringValueWithDouble:(double)doubleValue;

/**
 *  获取UUID字符串
 *
 *  @return UUID字符串
 */
+ (NSString *)uuid;

@end
