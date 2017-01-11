//
//  CTImagePickerUtil.h
//  图片选择工具类
//
//  Created by jjh on 14-10-16.
//  Copyright (c) 2014年 gdcattsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PECropViewController.h"

@interface CTImagePickerUtil : NSObject

/**
 *  打开不带编辑功能的图片选择
 *
 *  @param viewController 所属的视图控制器
 *  @param delegate       获取图片后的委托
 */
+ (void)openImagePickerInViewController:(UIViewController *)viewController delegate:(id<UINavigationControllerDelegate, UIImagePickerControllerDelegate>)delegate;

/**
 *  打开带编辑功能的图片选择
 *
 *  @param viewController 所属的视图控制器
 *  @param delegate       获取图片后的委托
 */
+ (void)openImagePickerWithEditorInViewController:(UIViewController *)viewController delegate:(id<PECropViewControllerDelegate>)delegate;

/**
 *  打开带编辑功能的图片选择
 *
 *  @param viewController 所属的视图控制器
 *  @param delegate       获取图片后的委托
 *  @param initCallback   初始化编辑视图控制器回调
 */
+ (void)openImagePickerWithEditorInViewController:(UIViewController *)viewController delegate:(id<PECropViewControllerDelegate>)delegate initPECropViewControllerCallback:(void(^)(PECropViewController *cropViewController, UIImage *image))initCallback;

@end
