//
//  CTResourceUtil.h
//  资源工具类
//
//  Created by Blacknight on 15-5-16.
//  Copyright (c) 2015年 cattsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTResourceUtil : NSObject

/**
 *  获取主bundle里的bundle对象
 *
 *  @param bundleName bundle名称
 *
 *  @return bundle对象
 */
+ (NSBundle *)getBundleWithName:(NSString *)bundleName;

/**
 *  获取指定bundle里的bundle对象
 *
 *  @param bundleName   bundle名称
 *  @param parentBundle 父bundle对象
 *
 *  @return bundle对象
 */
+ (NSBundle *)getBundleWithName:(NSString *)bundleName inBundle:(NSBundle *)parentBundle;

@end
