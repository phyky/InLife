//
//  CTAlertView.h
//  自定义弹出框
//
//  Created by Blacknight on 15-5-21.
//  Copyright (c) 2015年 cattsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  提示框按钮类型枚举
 */
typedef NS_ENUM(NSInteger, CTAlertViewBtnType){
    /**
     *  按钮“是”
     */
    CTAlertViewBtnTypeYes = 0,
    /**
     *  按钮“否”
     */
    CTAlertViewBtnTypeNo = 1
};

@interface CTAlertView : UIView

// 标题
@property (copy, nonatomic) NSString *title;
// 消息
@property (copy, nonatomic) NSString *message;
// 自定义视图
@property (strong, nonatomic) UIView *contentView;
// “否”按钮文本
@property (copy, nonatomic) NSString *noButtonTitle;
// ”是”按钮文本
@property (copy, nonatomic) NSString *yesButtonTitle;
/**
 *  是否关闭弹出框回调，用户点击按钮时触发
 *  回调中调用callback(YES)则关闭弹出框，callback(NO)则不关闭
 */
@property (nonatomic, copy) void(^shouldDismissCallback)(CTAlertView *alertView, CTAlertViewBtnType btnType, UIView *contentView, void(^callback)(BOOL shouldDismiss));
/**
 *  弹出框关闭后回调
 */
@property (nonatomic, copy) void(^didDismissCallback)(CTAlertView *alertView, CTAlertViewBtnType btnType, UIView *contentView);

/**
 *  初始化弹出框
 *
 *  @param title          标题
 *  @param message        消息
 *  @param contentView    自定义视图
 *  @param noButtonTitle  “否”按钮文本
 *  @param yesButtonTitle “是”按钮文本
 *
 *  @return 弹出框对象
 */
- (id)initWithTitle:(NSString *)title message:(NSString *)message contentView:(UIView *)contentView noButtonTitle:(NSString *)noButtonTitle yesButtonTitle:(NSString *)yesButtonTitle;

/**
 *  显示或刷新弹出框
 */
- (void)show;

/**
 *  模拟点击按钮来使弹出框消失
 *
 *  @param btnType 按钮类型
 */
- (void)dismissWithClickedButton:(CTAlertViewBtnType)btnType;

@end
