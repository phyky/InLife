//
//  CTAppUtil.h
//  BaseStaticLibrary
//
//  Created by Blacknight on 15-4-23.
//  Copyright (c) 2015年 wrs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTAppUtil : NSObject

/**
 *  当前是否处于主线程
 *
 *  @return 是否处于主线程
 */
+ (BOOL)isMainThread;

/**
 *  主线程执行块
 *
 *  @param block 待执行的块
 */
+ (void)performInMainThreadWithBlock:(void(^)(void)) block;

/**
 *  后台执行块
 *
 *  @param block 待执行的块
 */
+ (void)performInBackgroundWithBlock:(void(^)(void)) block;

/**
 *  主线程执行块
 *
 *  @param time  延迟的时间，单位：秒
 *  @param block 待执行的块
 */
+ (void)performInMainThreadAfter:(double)time withBlock:(void(^)(void)) block;

/**
 *  后台执行块
 *
 *  @param time  延迟的时间，单位：秒
 *  @param block 待执行的块
 */
+ (void)performInBackgroundAfter:(double)time withBlock:(void(^)(void)) block;

@end
