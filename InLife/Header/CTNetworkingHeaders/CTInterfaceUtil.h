//
//  CTInterfaceUtil.h
//  接口工具类，适用于部门后台框架逻辑
//
//  Created by blacknight on 15/11/27.
//  Copyright © 2015年 gdcattsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTURLSession.h"

// 请求失败错误码的KEY值
#define FAILED_ERROR_CODE @"errorCode"
// 请求失败错误信息的KEY值
#define FAILED_ERROR_MSG @"content"

/**
 *  请求方法类型
 */
typedef NS_ENUM(NSInteger, CTRequestMethodType){
    /**
     *  GET
     */
    CTRequestMethodTypeGet = 0,
    /**
     *  POST
     */
    CTRequestMethodTypePost = 1,
    /**
     *  PUT
     */
    CTRequestMethodTypePut = 2
};

/**
 *  请求结果类型
 */
typedef NS_ENUM(NSInteger, CTRequestResultType){
    /**
     *  成功
     */
    CTRequestResultTypeSuccess = 0,
    /**
     *  失败
     */
    CTRequestResultTypeFailed = 1,
    /**
     *  未登录
     */
    CTRequestResultTypeUnLogined = 2
};

@interface CTInterfaceUtil : NSObject

/**
 *  设置默认请求失败提示信息
 *
 *  @param defaultErrorMsg 默认请求失败提示信息
 */
+ (void)setDefaultErrorMsg:(NSString *)defaultErrorMsg;


/**
 *  设置是否需要校验服务器证书
 *
 *  @param validates 根据编译模式debug或者release判断是否需要服务器校验证书
 */
+ (void)setValidatesCertificates:(BOOL)validates;

/**
 *  普通请求（异步）
 *
 *  @param url            接口完整地址
 *  @param param          请求参数
 *  @param methodType     请求类型
 *  @param resultCallback 回调
 */
+ (void)requestWithUrl:(NSString *)url param:(NSDictionary *)param methodType:(CTRequestMethodType)methodType resultCallback:(void (^)(CTRequestResultType resultType, id resultData))resultCallback;

/**
 *  普通请求
 *
 *  @param url            接口完整地址
 *  @param param          请求参数
 *  @param methodType     请求类型
 *  @param resultCallback 回调
 *  @param isSync         是否同步
 */
+ (void)requestWithUrl:(NSString *)url param:(NSDictionary *)param methodType:(CTRequestMethodType)methodType resultCallback:(void (^)(CTRequestResultType resultType, id resultData))resultCallback isSync:(BOOL)isSync;

/**
 *  普通请求
 *
 *  @param url            接口完整地址
 *  @param header         自定义请求头部
 *  @param param          请求参数
 *  @param bodyData       body数据
 *  @param methodType     请求类型
 *  @param resultCallback 回调
 *  @param isSync         是否同步
 */
+ (void)requestWithUrl:(NSString *)url header:(NSDictionary *)header param:(NSDictionary *)param bodyData:(NSData *)bodyData methodType:(CTRequestMethodType)methodType resultCallback:(void (^)(CTRequestResultType resultType, id resultData))resultCallback isSync:(BOOL)isSync;

/**
 *  上传文件
 *
 *  @param url              接口完整地址
 *  @param param            请求参数
 *  @param fileParam        文件参数，一个元素代表一个文件（String）或文件数组（Array<String>）
 *  @param resultCallback   结果回调
 *  @param progressCallback 进度回调
 */
+ (void)uploadWithUrl:(NSString *)url param:(NSDictionary *)param fileParam:(NSDictionary *)fileParam resultCallback:(void (^)(CTRequestResultType resultType, id resultData))resultCallback progressCallback:(void (^)(double progress, unsigned long long bytesWritten, unsigned long long totalSize))progressCallback;

@end
