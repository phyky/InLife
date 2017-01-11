//
//  PHYCommonMacro.h
//  APPTest
//
//  Created by pang on 16/11/22.
//  Copyright © 2016年 gdcattsoft. All rights reserved.
//

#ifndef PHYCommonMacro_h
#define PHYCommonMacro_h

//颜色
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//ios7.0以上
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f ? YES : NO)

//获取屏幕 宽度、高度 (包括状态栏)
#define SCREEN_W_NO_STATUS      [UIScreen mainScreen].bounds.size.width
#define SCREEN_H_NO_STATUS      [UIScreen mainScreen].bounds.size.height

//获取屏幕 宽度、高度 (不包括状态栏)
#define SCREEN_W                [UIScreen mainScreen].applicationFrame.size.width
#define SCREEN_H                [UIScreen mainScreen].applicationFrame.size.height

//顶部栏高度
#define TOP_BAR_HEIGHT (IOS7?64:44)

//屏幕坐标初始Y值,如果是iOS7以上，y=20，IOS7以下，y=0
#define Default_Y (IOS7?20:0)

#define Default_Height (IOS7?0:20)

//顶部内容高度(不包括ios6和ios7以上的20个像素的差别)
#define TOP_BAR_CONTENT_HEIGHT 44

//底部栏高度
#define BOTTOM_BAR_HEIGHT 50

#endif /* PHYCommonMacro_h */
