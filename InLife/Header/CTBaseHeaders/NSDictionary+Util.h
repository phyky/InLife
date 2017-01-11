//
//  NSDictionary+Util.h
//  CTBase
//
//  Created by Blacknight on 15-5-14.
//  Copyright (c) 2015年 cattsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Util)

/**
 *  获取字符串值
 *
 *  @param key 键
 *
 *  @return 值
 */
- (NSString *)stringForKey:(id)key;

/**
 *  获取数字值
 *
 *  @param key 键
 *
 *  @return 值
 */
- (NSNumber *)numberForKey:(id)key;

/**
 *  获取整形值
 *
 *  @param key 键
 *
 *  @return 值
 */
- (int)intForKey:(id)key;

/**
 *  获取长整形值
 *
 *  @param key 键
 *
 *  @return 值
 */
- (long)longForKey:(id)key;

/**
 *  获取浮点值
 *
 *  @param key 键
 *
 *  @return 值
 */
- (double)doubleForKey:(id)key;

@end
