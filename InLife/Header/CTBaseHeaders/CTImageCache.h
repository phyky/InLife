//
//  ImageCache.h
//  图片缓存管理
//
//  Created by jjh on 1/9/11.
//  Copyright 2011 Dan Auclair. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CTImageCache : NSObject

/**
 *  设置图片缓存
 *
 *  @param image 图片
 *  @param key   键
 */
+ (void)setImage:(UIImage *)image forKey:(NSString *)key;

/**
 *  获取图片缓存
 *
 *  @param key 键
 *
 *  @return 图片
 */
+ (UIImage *)imageForKey:(NSString *)key;

/**
 *  删除图片缓存
 *
 *  @param key 键
 */
+ (void)deleteImageForKey:(NSString *)key;

/**
 *  清空图片缓存
 */
+ (void)clearCache;

@end