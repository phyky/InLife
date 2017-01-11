//
//  CTFileUtil.h
//  文件工具类
//
//  Created by jjh on 15-4-20.
//  Copyright (c) 2015年 cattsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  文件类型
 */
typedef NS_ENUM(NSInteger, CTFileType){
    /**
     *  图片
     */
    CTFileTypePicture  = 0,
    /**
     *  视频
     */
    CTFileTypeVideo    = 1,
    /**
     *  音频
     */
    CTFileTypeAudio    = 2,
    /**
     *  文档
     */
    CTFileTypeDocument = 3,
    /**
     *  未知
     */
    CTFileTypeUnknown  = 4,
};

@interface CTFileUtil : NSObject

/**
 *  获取主目录路径
 *
 *  @return
 */
+ (NSString *)getHomeDirectoryPath;

/**
 *  获取app目录路径
 *
 *  @return
 */
+ (NSString *)getAppDirectoryPath;

/**
 *  获取Documents目录路径
 *
 *  @return
 */
+ (NSString *)getDocDirectoryPath;

/**
 *  获取临时目录路径
 *
 *  @return
 */
+ (NSString *)getTmpDirectoryPath;

/**
 *  创建目录（自动创建子目录）
 *
 *  @param dirPath 目录路径
 *
 *  @return 是否创建成功
 */
+ (BOOL)createDirectoryAtPath:(NSString *)dirPath;

/**
 *  创建文件（自动创建目录，覆盖原文件）
 *
 *  @param path    文件路径
 *  @param content 文件内容
 *
 *  @return 是否创建成功
 */
+ (BOOL)createFileAtPath:(NSString *)path withContent:(NSData *)content;

/**
 *  向文件新增内容
 *
 *  @param path    文件路径
 *  @param content 新增的内容
 *
 *  @return 成功标识
 */
+ (BOOL)appendToFileAtPath:(NSString *)path withContent:(NSData *)content;

/**
 *  获取文件或目录的名称
 *
 *  @param path 文件或目录路径
 *
 *  @return 文件或目录的名称
 */
+ (NSString *)getItemNameAtPath:(NSString *)path;

/**
 *  获取文件扩展名
 *
 *  @param filePath 文件路径
 *
 *  @return 扩展名
 */
+ (NSString *)getExtOfFile:(NSString *)filePath;

/**
 *  根据文件路径判断其类型
 *
 *  @param filePath 文件路径
 *
 *  @return 文件类型
 */
+ (CTFileType)getFileTypeWithPath:(NSString *)filePath;

/**
 *  根据文件扩展名，获取对应的MIME类型
 *
 *  @param ext 扩展名
 *
 *  @return MIME类型
 */
+ (NSString *)getMIMETypeWithExt:(NSString *)ext;

@end
