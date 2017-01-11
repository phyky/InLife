//
//  CTDateUtil.h
//  日期工具类
//
//  Created by jjh on 15-4-20.
//  Copyright (c) 2015年 cattsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FORMAT_DATE @"yyyy-MM-dd"
#define FORMAT_TIME @"yyyy-MM-dd HH:mm:ss"

@interface CTDateUtil : NSObject

/**
 *  格式化日期为年月日字符串
 *
 *  @param date 日期
 *
 *  @return 日期字符串
 */
+ (NSString *)formatDate:(NSDate *)date;

/**
 *  格式化日期为年月日时分秒字符串
 *
 *  @param date 日期
 *
 *  @return 时间字符串
 */
+ (NSString *)formatDateTime:(NSDate *)date;

/**
 *  日期转字符串
 *
 *  @param date   日期
 *  @param format 格式
 *
 *  @return 格式化的日期字符串
 */
+ (NSString *)formatDate:(NSDate *)date format:(NSString *)format;

/**
 *  字符串转日期
 *
 *  @param dateStr 字符串日期
 *  @param format  格式
 *
 *  @return 转换后的日期
 */
+ (NSDate *)parseDate:(NSString *)dateStr format:(NSString *)format;

/**
 *  转换日期为毫秒数
 *
 *  @param date 日期
 *
 *  @return 毫秒数
 */
+ (long long)getTimeFromDate:(NSDate *)date;

/**
 *  获取当前时间的毫秒数
 *
 *  @return 当前时间的毫秒数
 */
+ (long long)getCurrentTime;

/**
 *  转换毫秒数为日期
 *
 *  @param time 毫秒数
 *
 *  @return 日期
 */
+ (NSDate *)getDateFromTime:(long long)time;




@end
