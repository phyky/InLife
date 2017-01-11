//
//  CTAesUtil.h
//  AES加解密工具类
//
//  Created by Blacknight on 15-6-29.
//  Copyright (c) 2015年 cattsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTAesUtil : NSObject

/**
 *  加密数据
 *
 *  @param key   密钥
 *  @param data  明文
 *  @param error 错误
 *
 *  @return 密文
 */
+ (NSData *)encryptWithKey:(NSString *)key data:(NSData *)data error:(NSError **)error;

/**
 *  解密数据
 *
 *  @param key   密钥
 *  @param data  密文
 *  @param error 错误
 *
 *  @return 明文
 */
+ (NSData *)decryptWithKey:(NSString *)key data:(NSData *)data error:(NSError **)error;

/**
 *  加密字符串
 *
 *  @param key   密钥
 *  @param input 明文
 *  @param error 错误
 *
 *  @return 密文
 */
+ (NSString *)encryptWithKey:(NSString *)key input:(NSString *)input error:(NSError **)error;

/**
 *  解密字符串
 *
 *  @param key   密钥
 *  @param input 密文
 *  @param error 错误
 *
 *  @return 明文
 */
+ (NSString *)decryptWithKey:(NSString *)key input:(NSString *)input error:(NSError **)error;

@end
