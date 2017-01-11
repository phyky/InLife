//
//  CTUIUtil.h
//  BaseStaticLibrary
//
//  Created by Blacknight on 15-4-22.
//  Copyright (c) 2015年 wrs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CTUIUtil : NSObject

/**
 *  获取应用程序委托
 *
 *  @return 应用程序委托
 */
+ (id<UIApplicationDelegate>)getApplicationDelegate;

/**
 *  获取主窗口
 *
 *  @return 主窗口
 */
+ (UIWindow *)getKeyWindow;

/**
 *  获取根视图控制器
 *
 *  @return 根视图控制器
 */
+ (UIViewController *)getRootViewController;

/**
 *  获取当前显示的视图控制器
 *
 *  @return 当前显示的视图控制器
 */
+ (UIViewController *)getTopViewController;

/**
 *  加载XIB文件
 *
 *  @param fileName XIB文件名称
 *
 *  @return XIB文件的第一个对象
 */
+ (id)loadXIB:(NSString *)fileName;

/**
 *  加载XIB文件
 *
 *  @param fileName   XIB文件名称
 *  @param bundleName bundle名称
 *
 *  @return XIB文件的第一个对象
 */
+ (id)loadXIB:(NSString *)fileName fromBundle:(NSString *)bundleName;

/**
 *  获取或创建重用cell
 *
 *  @param identifier 重用标识
 *  @param tableView  表格对象
 *
 *  @return cell对象
 */
+ (UITableViewCell *)getOrCreateReusableCellWithIdentifier:(NSString *)identifier inTableView:(UITableView *)tableView;

@end
