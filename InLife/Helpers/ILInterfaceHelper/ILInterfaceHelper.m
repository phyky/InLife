//
//  ILInterfaceHelper.m
//  InLife
//
//  Created by pang on 16/11/23.
//  Copyright © 2016年 physoft. All rights reserved.
//

#import "ILInterfaceHelper.h"

@implementation ILInterfaceHelper

+ (void)requestWithUrl:(NSString *)url param:(NSDictionary *)param methodType:(CTRequestMethodType)methodType showHUD:(BOOL)showHUD showErrorMsg:(BOOL)showErrorMsg resultCallback:(void (^)(CTRequestResultType resultType, id resultData))resultCallback{
    [ILInterfaceHelper requestWithUrl:url param:param methodType:methodType showHUD:showHUD showErrorMsg:showErrorMsg resultCallback:^(CTRequestResultType resultType, id resultData){
        resultCallback(resultType, resultData);
    }isSync:NO];
}

+ (void)requestWithUrl:(NSString *)url param:(NSDictionary *)param methodType:(CTRequestMethodType)methodType showHUD:(BOOL)showHUD showErrorMsg:(BOOL)showErrorMsg resultCallback:(void (^)(CTRequestResultType resultType, id resultData))resultCallback isSync:(BOOL)isSync{
    if (showHUD) {
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
        [SVProgressHUD showWithStatus:@"加载中..."];
    }
    [CTInterfaceUtil requestWithUrl:url param:param methodType:methodType resultCallback:^(CTRequestResultType resultType, id resultData) {
        if (resultType != CTRequestResultTypeSuccess) {
            if (showErrorMsg) {
                [SVProgressHUD showErrorWithStatus:[resultData stringForKey:@"content"]];
            }
            resultCallback(resultType, [resultData stringForKey:@"content"]);
        } else {
            if (showHUD) {
                [SVProgressHUD dismiss];
            }
            resultCallback(resultType, resultData);
        }
    } isSync:isSync];
}


@end
