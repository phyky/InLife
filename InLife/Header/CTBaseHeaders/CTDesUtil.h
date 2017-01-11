//
//  CTDESTool.h
//  DES加解密工具类
//
//  Created by Frank Fan on 14-7-8.
//  Copyright (c) 2014年 Frank Fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTDesUtil : NSObject

/**
 *  加密字符串
 *
 *  @param key   密钥
 *  @param input 明文
 *
 *  @return 密文
 */
+ (NSString *)encryptWithKey:(NSString *)key input:(NSString *)input;

/**
 *  解密字符串
 *
 *  @param key   密钥
 *  @param input 密文
 *
 *  @return 明文
 */
+ (NSString *)decryptWithKey:(NSString *)key input:(NSString *)input;

@end
