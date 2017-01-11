//
//  CTProgressView.h
//  CTBase
//
//  Created by Blacknight on 15-5-26.
//  Copyright (c) 2015年 cattsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTAlertView.h"

@interface CTProgressView : CTAlertView

/**
 *  初始化进度框
 *
 *  @param title          标题
 *  @param message        消息
 *  @param noButtonTitle  “否”按钮文本
 *  @param yesButtonTitle “是”按钮文本
 *
 *  @return 进度框对象
 */
- (id)initWithTitle:(NSString *)title message:(NSString *)message noButtonTitle:(NSString *)noButtonTitle yesButtonTitle:(NSString *)yesButtonTitle;

/**
 *  设置进度
 *
 *  @param progress 进度，0.0 ~ 1.0
 *  @param animated 是否动画
 */
- (void)setProgress:(float)progress animated:(BOOL)animated;

@end
