//
//  ILAppHelper.h
//  InLife
//
//  Created by pang on 16/11/29.
//  Copyright © 2016年 physoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILAppHeader.h"

typedef void(^SizeCallBack)(NSIndexPath *indexPath, CGFloat height);

@interface ILAppHelper : NSObject

//根据图片URL获取图片尺寸
+(void)getImageSizeWithURL:(id)imageURL indexPath:(NSIndexPath*)indexPath callBack:(SizeCallBack)callBack;

/**
 *  根据键对数组排序
 *
 *  @param dataSource 数据源
 *  @param key        排序键
 *  @param ascending  顺序还是倒序
 *
 *  @return 返回结果
 */
+(NSMutableArray *)sortDescriptorDataSource:(NSMutableArray *)dataSource key:(NSString *)key ascending:(BOOL)ascending;

/** 返回自适应高度的文本 */
+ (CGSize)sizeWithString:(NSString *)string font:(CGFloat)font maxWidth:(CGFloat)maxWidth;

/** 返回自适应宽度的文本 */
+ (CGSize)sizeWithString:(NSString *)string font:(CGFloat)font maxHeight:(CGFloat)maxHeight;

@end
