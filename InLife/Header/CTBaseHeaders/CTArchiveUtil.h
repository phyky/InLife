//
//  WSArchiveUtil.h
//  BaseStaticLibrary
//
//  Created by wrs on 15/7/3.
//  Copyright (c) 2015年 wrs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTArchiveUtil : NSObject

#pragma mark - obj userDefault
/**
 *  归档对象到UserDefault
 *
 *  @param obj  obj NSUserDefaults 存储的对象全是不可变的，所以obj一定是不可变对象
 *  @param key
 */
+ (void)archiveToUserDefaultWithObject:(id)obj key:(NSString *)key;

/**
 *  从UserDefault解归档对象
 *
 *  @param key
 *
 *  @return
 */
+ (id)unarchiveObjectFromUserDefault:(NSString *)key;

#pragma mark - obj file
/**
 *  对象归档保存到某路径下
 *
 *  @param obj
 *  @param filePath
 *
 *  @return
 */
+ (BOOL)archiverObject:(id)obj toFilePath:(NSString *)filePath;

/**
 *  从某路径下解归档对象
 *
 *  @param filePath
 *
 *  @return
 */
+ (id)unarchiveObjectFromFilePath:(NSString *)filePath;

@end
