//
//  WSCalendarUtil.h
//  CalendarProj
//
//  Created by wrs on 15/5/21.
//  Copyright (c) 2015年 wrs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTCalendarUtil : NSObject

/**
 *  获取格式化日期
 *
 *  @param date   日期
 *  @param format 日期格式，如：yyyy-MM-dd HH:mm:ss
 *
 *  @return return value description
 */
+ (NSString *)getDateStrWithDate:(NSDate *)date format:(NSString *)format;

/**
 *  时间戳转时间 1970年以来
 *
 *  @param interval
 *
 *  @return
 */
+ (NSDate *)getDateWithTimeInterval:(NSString *)interval;

/**
 *  时间转时间戳
 *
 *  @param date
 *
 *  @return
 */
+ (NSString *)getIntervalWithDate:(NSDate *)date;

/**
 *  获取日期
 *
 *  @param dateStr 日期字符串
 *  @param format  日期格式，如：yyyy-MM-dd HH:mm:ss
 *
 *  @return return value description
 */
+ (NSDate *)getDateWithDateStr:(NSString *)dateStr format:(NSString *)format;

/**
 *  获取当前年份
 *
 *  @return return value description
 */
+ (NSInteger)getCurYear;

/**
 *  获取当前季度
 *             春  夏  秋  冬
 *  @return return value description
 */
+ (NSInteger)getCurQuarter;

/**
 *  获取当前月份
 *
 *  @return return value description
 */
+ (NSInteger)getCurMonth;

/**
 *  获取当前日
 *
 *  @return return value description
 */
+ (NSInteger)getCurDay;


/**
 *  获取当前小时
 *
 *  @return return value description
 */
+ (NSInteger)getCurHour;

/**
 *  获取当前星期
 *
 *             周日   周一  周二  周三  周四  周五  周六
 *  @return     1      2    3    4     5    6    7
 */
+ (NSInteger)getCurWeekDay;

/**
 *  获取当前月份的天数
 *
 *  @return return value description
 */
+ (NSInteger)getCurDayNumForMonth;

/**
 *  获取今年的天数
 *
 *  @return return value description
 */
+ (NSInteger)getCurDayNumForYear;

/**
 *  获取当前月份的周数
 *
 *  @return return value description
 */
+ (NSInteger)getCurWeekNumForMonth;

/**
 *  获取今年的周数
 *
 *  @return return value description
 */
+ (NSUInteger)getCurWeekNumForYear;

/**
 *  获取某日期的年份
 *
 *  @param date date description
 *
 *  @return return value description
 */
+ (NSInteger)getYearWithDate:(NSDate *)date;

/**
 *  获取某天的季度
 *
 *  @param date date description
 *
 *  @return return value description
 */
+ (NSInteger)getQuarterWithDate:(NSDate *)date;

/**
 *  获取某日期的月份
 *
 *  @param date date description
 *
 *  @return return value description
 */
+ (NSInteger)getMonthWithDate:(NSDate *)date;

/**
 *  获取某日期的day
 *
 *  @param date date description
 *
 *  @return return value description
 */
+ (NSInteger)getDayWithDate:(NSDate *)date;

/**
 *  获取某天的星期
 *
 *  @param date date description
 *
 *             周日   周一  周二  周三  周四  周五  周六
 *  @return     1      2    3    4     5    6    7
 */
+ (NSInteger)getWeekDayWithDate:(NSDate *)date;

/**
 *  获取某天的周数
 *
 *  @param date date description
 *
 *  @return return 从1开始
 */
+ (NSInteger)getWeekOfMonthWithDate:(NSDate *)date;

/**
 *  获取某月的天数
 *
 *  @param date date description
 *
 *  @return
 */
+ (NSInteger)getDayNumForMonthWithDate:(NSDate *)date;

/**
 *  获取某年的天数
 *
 *  @param date date description
 *
 *  @return return value description
 */
+ (NSInteger)getDayNumForYearWithDate:(NSDate *)date;

/**
 *  获取某月的周数
 *
 *  @param date date description
 *
 *  @return return value description
 */
+ (NSInteger)getWeekNumForMonthWithDate:(NSDate *)date;

/**
 *  获取某年的周数
 *
 *  @param date date description
 *
 *  @return return value description
 */
+ (NSInteger)getWeekNumForYearWithDate:(NSDate *)date;

/**
 *  获取几天后是哪一天
 *
 *  @return return value description
 */
+ (NSDate *)getDateFromCurDayWithAfterDays:(NSInteger)afterDays;

/**
 *  获取某天过了几天后的日期
 *
 *  @param fromdate 从哪天开始
 *  @param afterDay 过了几天
 *
 *  @return return value description
 */
+ (NSDate *)getDateFromDate:(NSDate *)fromdate afterDays:(NSInteger)afterDays;


//add by phy
/**
 *  获取当前components
 *
 *  @return return value description
 */


+(NSDateComponents *)getCurrentDateComponents;
/**
 *  获取某个日期的components
 *
 *  @param date date description
 *
 *  @return return value description
 */
+(NSDateComponents *)getDateComponentsFromDate:(NSDate *)date;

/**
 *  获取某个日期过了几月后的日期
 *
 *  @param fromdate 从哪月开始
 *  @param afterDay 过了几月
 *
 *  @return return value description
 */
+ (NSDate *)getDateFromDate:(NSDate *)fromdate afterMonths:(NSInteger)afterMonths;


/**
 *  获取某个日期过了几年后的日期
 *
 *  @param fromdate 从某个日期开始
 *  @param afterDay 过了几年
 *
 *  @return return value description
 */
+ (NSDate *)getDateFromDate:(NSDate *)fromdate afterYears:(NSInteger)afterYears;


/**
 *  获取某个日期过了几周后的日期
 *
 *  @param fromdate 从某个日期开始
 *  @param afterDay 过了几周
 *
 *  @return return value description
 */
+ (NSDate *)getDateFromDate:(NSDate *)fromdate afterWeeks:(NSInteger)afterWeeks;


/**
 *  获取某个日期过了几小时后的日期
 *
 *  @param fromdate 从某个日期开始
 *  @param afterDay 过了几小时
 *
 *  @return return value description
 */
+ (NSDate *)getDateFromDate:(NSDate *)fromdate afterHours:(NSInteger)afterHours;
@end
