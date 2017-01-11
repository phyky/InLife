//
//  CTMessageView.h
//  消息提示框
//
//  Created by jjh on 15-4-23.
//  Copyright (c) 2015年 wrs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 提示框按钮类型枚举
 */
typedef enum CTMessageViewBtnType {
    CTMessageViewBtnTypeYes = 0,//按钮“是”
    CTMessageViewBtnTypeNo = 1//按钮“否”
} CTMessageViewBtnType;

@interface CTMessageView : NSObject

/**
 *  提示框（会自动消失）
 *
 *  @param msg      提示内容
 *  @param duration     显示时间，单位为秒，传“0”则使用默认值
 *  @param callback 提示结束后回调
 */
+ (void)tipWithMsg:(NSString *)msg duration:(double)time callback:(void (^)(void))callback;

/**
 *  警告框（不会自动消失，需用户点击）
 *
 *  @param msg      警告内容
 *  @param callback 警告结束后回调
 */
+ (void)alertWithMsg:(NSString *)msg callback:(void (^)(CTMessageViewBtnType btnType))callback;

/**
 *  警告框（不会自动消失，需用户点击）
 *
 *  @param msg      警告内容
 *  @param title    警告标题
 *  @param btn      按钮文本
 *  @param callback 警告结束后回调
 */
+ (void)alertWithMsg:(NSString *)msg title:(NSString *)title btn:(NSString *)btn callback:(void (^)(CTMessageViewBtnType btnType))callback;

/**
 *  确认框
 *
 *  @param msg      确认内容
 *  @param callback 确认后回调
 */
+ (void)confirmWithMsg:(NSString *)msg callback:(void (^)(CTMessageViewBtnType btnType))callback;

/**
 *  确认框
 *
 *  @param msg      确认内容
 *  @param title    确认标题
 *  @param yesBtn   “是”按钮的显示文本
 *  @param noBtn    “否”按钮的显示文本
 *  @param callback 确认后回调
 */
+ (void)confirmWithMsg:(NSString *)msg title:(NSString *)title yesBtn:(NSString *)yesBtn noBtn:(NSString *)noBtn callback:(void (^)(CTMessageViewBtnType btnType))callback;

/**
 *  显示加载框
 */
+ (void)showLoading;

/**
 *  隐藏加载框
 */
+ (void)hideLoading;

/**
 *  显示加载框在指定视图内
 *
 *  @param view 指定视图
 */
+ (void)showLoadingInView:(UIView *)view;

/**
 *  隐藏指定视图内的加载框
 *
 *  @param view 指定视图
 */
+ (void)hideLoadingInView:(UIView *)view;

@end
