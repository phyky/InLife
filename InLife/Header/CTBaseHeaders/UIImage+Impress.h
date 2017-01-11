//
//  UIImage+WSImpress.h
//  BaseStaticLibrary
//
//  Created by wrs on 15/5/21.
//  Copyright (c) 2015年 wrs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Impress)
/**
 *  压缩成固定大小
 *
 *  @param targetSize targetSize description
 *
 *  @return return value description
 */
- (UIImage *)commpressImageForTargetSize:(CGSize)targetSize;

/**
 *  按系数压缩
 *
 *  @param factor 压缩系数 0～1
 *
 *  @return return value description
 */
- (UIImage *)commpressImageWithScaleFactor:(float)factor;

/**
 *  按比例压缩
 *
 *  @param targetSize targetSize description
 *
 *  @return return value description
 */
- (UIImage *)compressForTargetSize:(CGSize)targetSize;

/**
 *  压缩成固定宽度
 *
 *  @param targetWidth targetWidth description
 *
 *  @return return value description
 */
- (UIImage *)compressForTargetWidth:(CGFloat)targetWidth;

@end
