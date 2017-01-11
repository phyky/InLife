//
//  CTJsonUtil.h
//  json工具类
//
//  Created by Blacknight on 15-4-29.
//  Copyright (c) 2015年 wrs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTJsonUtil : NSObject

/**
 *  对象转json字符串
 *
 *  @param obj 对象
 *
 *  @return json字符串
 */
+ (NSString *)stringify:(id)obj error:(NSError **)error;

/**
 *  json字符串转对象
 *
 *  @param json json字符串
 *
 *  @return 对象
 */
+ (id)parse:(NSString *)json error:(NSError **)error;

@end
