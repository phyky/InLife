//
//  ILInterfaceHelper.h
//  InLife
//
//  Created by pang on 16/11/23.
//  Copyright © 2016年 physoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTNetworking.h"
#import "ILAppHeader.h"

@interface ILInterfaceHelper : NSObject

/**
 *  普通请求（异步）
 *
 *  @param url            接口相对地址
 *  @param param          请求参数
 *  @param methodType     请求类型
 *  @param resultCallback 回调
 */
+ (void)requestWithUrl:(NSString *)url param:(NSDictionary *)param methodType:(CTRequestMethodType)methodType showHUD:(BOOL)showHUD showErrorMsg:(BOOL)showErrorMsg resultCallback:(void (^)(CTRequestResultType resultType, id resultData))resultCallback;

@end
