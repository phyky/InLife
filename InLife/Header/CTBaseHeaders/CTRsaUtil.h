//
//  CTRsaUtil.h
//  RSA加解密工具类
//
//  Created by blacknight on 15/11/26.
//  Copyright © 2015年 cattsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTRsaUtil : NSObject

/**
 *  公钥加密字符串
 *
 *  @param source    待加密字符串
 *  @param publicKey 公钥
 *
 *  @return 密文
 */
+ (NSString *)encrypt:(NSString *)source withPublicKey:(NSString *)publicKey;

/**
 *  私钥解密字符串
 *
 *  @param source     待解密字符串
 *  @param privateKey 私钥
 *
 *  @return 明文
 */
+ (NSString *)decrypt:(NSString *)source withPrivateKey:(NSString *)privateKey;

@end
