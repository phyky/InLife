//
//  CTClassUtil.h
//  CTBase
//
//  Created by Blacknight on 15-7-3.
//  Copyright (c) 2015年 cattsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTClassUtil : NSObject

/**
 *  获取所有property名称
 *
 *  @param cls 类
 *
 *  @return 名称数组
 */
+ (NSArray *)getPropertyNames:(Class)cls;

/**
 *  获取所有方法名称
 *
 *  @param cls 类
 *
 *  @return 名称数组
 */
+ (NSArray *)getMethodNames:(Class)cls;

@end
