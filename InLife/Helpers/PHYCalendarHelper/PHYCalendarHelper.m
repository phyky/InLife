//
//  PHYCalendarHelper.m
//  InLife
//
//  Created by pang on 16/11/25.
//  Copyright © 2016年 physoft. All rights reserved.
//

#import "PHYCalendarHelper.h"

@implementation PHYCalendarHelper
+ (NSString *)getDateStrWithDate:(NSDate *)date format:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}

+ (NSDate *)getDateWithTimeInterval:(NSString *)interval
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[interval doubleValue]];
    return date;
}


+ (NSString *)getIntervalWithDate:(NSDate *)date
{
    NSString *timeSp = [NSString stringWithFormat:@"%.0f", [date timeIntervalSince1970]];
    return timeSp;
}

+ (NSDate *)getDateWithDateStr:(NSString *)dateStr format:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:format];
    NSDate *date = [formatter dateFromString:dateStr];
    return date;
}

+ (NSInteger)getCurYear
{
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitYear fromDate:[NSDate date]];
    return dateComponents.year;
}

+ (NSInteger)getCurQuarter
{
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitQuarter fromDate:[NSDate date]];
    return dateComponents.quarter;
}

+ (NSInteger)getCurMonth
{
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitMonth fromDate:[NSDate date]];
    return dateComponents.month;
}

+ (NSInteger)getCurDay
{
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitDay fromDate:[NSDate date]];
    return dateComponents.day;
}

+ (NSInteger)getCurHour
{
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitHour fromDate:[NSDate date]];
    return dateComponents.hour;
}

+ (NSInteger)getCurMin
{
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitMinute fromDate:[NSDate date]];
    return dateComponents.minute;
}

+ (NSInteger)getCurSec
{
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitSecond fromDate:[NSDate date]];
    return dateComponents.second;
}

+ (NSInteger)getCurWeekDay
{
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitWeekday fromDate:[NSDate date]];
    return dateComponents.weekday;
}


+ (NSInteger)getCurDayNumForMonth
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    return range.length;
}

+ (NSInteger)getCurDayNumForYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitYear forDate:[NSDate date]];
    return range.length;
}

+ (NSInteger)getCurWeekNumForMonth
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    return range.length;
}

+ (NSUInteger)getCurWeekNumForYear
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitYear forDate:[NSDate date]];
    return range.length;
}

+ (NSInteger)getYearWithDate:(NSDate *)date
{
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitYear fromDate:date];
    return dateComponents.year;
}

+ (NSInteger)getQuarterWithDate:(NSDate *)date
{
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitQuarter fromDate:date];
    return dateComponents.year;
}

+ (NSInteger)getMonthWithDate:(NSDate *)date
{
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitMonth fromDate:date];
    return dateComponents.month;
}

+ (NSInteger)getDayWithDate:(NSDate *)date{
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitDay fromDate:date];
    return dateComponents.day;
}

+ (NSInteger)getHourWithDate:(NSDate *)date{
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitHour fromDate:date];
    return dateComponents.hour;
}

+ (NSInteger)getWeekDayWithDate:(NSDate *)date
{
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitWeekday fromDate:date];
    return dateComponents.weekday;
}

+ (NSInteger)getWeekOfMonthWithDate:(NSDate *)date
{
    NSCalendar *greCalendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSCalendarUnitWeekOfMonth fromDate:date];
    return dateComponents.weekOfMonth;
}

+ (NSInteger)getDayNumForMonthWithDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    return range.length;
}

+ (NSInteger)getDayNumForYearWithDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitYear forDate:date];
    return range.length;
}

+ (NSInteger)getWeekNumForMonthWithDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitMonth forDate:date];
    return range.length;
}

+ (NSInteger)getWeekNumForYearWithDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitYear forDate:date];
    return range.length;
}

+ (NSDate *)getDateFromCurDayWithAfterDays:(NSInteger)afterDays
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = afterDays;
    NSDate *resultDay = [calendar dateByAddingComponents:dateComponents toDate:[NSDate date] options:0];
    return resultDay;
}

+ (NSDate *)getDateFromDate:(NSDate *)fromdate afterDays:(NSInteger)afterDays
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.day = afterDays;
    NSDate *resultDay = [calendar dateByAddingComponents:dateComponents toDate:fromdate options:0];
    return resultDay;
}

+(NSDateComponents *)getCurrentDateComponents{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekday;
    dateComponents = [calendar components:unitFlags fromDate:[NSDate date]];
    return dateComponents;
}

+(NSDateComponents *)getDateComponentsFromDate:(NSDate *)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekday;
    dateComponents = [calendar components:unitFlags fromDate:date];
    return dateComponents;
}

+ (NSDate *)getDateFromDate:(NSDate *)fromdate afterWeeks:(NSInteger)afterWeeks
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.weekOfYear = afterWeeks;
    NSDate *resultDay = [calendar dateByAddingComponents:dateComponents toDate:fromdate options:0];
    return resultDay;
}

+ (NSDate *)getDateFromDate:(NSDate *)fromdate afterMonths:(NSInteger)afterMonths
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.month = afterMonths;
    NSDate *resultDay = [calendar dateByAddingComponents:dateComponents toDate:fromdate options:0];
    return resultDay;
}

+ (NSDate *)getDateFromDate:(NSDate *)fromdate afterYears:(NSInteger)afterYears
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.year = afterYears;
    NSDate *resultDay = [calendar dateByAddingComponents:dateComponents toDate:fromdate options:0];
    return resultDay;
}

+ (NSDate *)getDateFromDate:(NSDate *)fromdate afterHours:(NSInteger)afterHours
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    dateComponents.hour = afterHours;
    NSDate *resultDay = [calendar dateByAddingComponents:dateComponents toDate:fromdate options:0];
    return resultDay;
}

+ (NSInteger)getDaysFromDate:(NSDate *)fromDate toDate:(NSDate*)toDate{
    NSTimeInterval fromDates = [fromDate timeIntervalSince1970];
    NSTimeInterval toDates = [toDate timeIntervalSince1970];
    NSInteger days = (toDates-fromDates)/(60*60*24);
    if (days >31) {
        days = 31;
    }
    return days;
}

@end
