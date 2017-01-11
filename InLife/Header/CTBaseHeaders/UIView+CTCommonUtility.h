//
//  UIView+AutoLayout.h
//  BaseStaticLibrary
//
//  Created by wrs on 15/4/11.
//  Copyright (c) 2015年 wrs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CTCommonUtility)

/**
 *  获取当前uiview所在的viewController
 */
@property (nonatomic, readonly) UIViewController *viewController;

// 扩展到supView大小
- (void)expandToSuperView;

/**
 *  相距supview 上、下、左、右
 *
 *  @param top    top
 *  @param bottom bottom
 *  @param left   left
 *  @param right  right
 */
- (void)addConstraintToSuperViewWithTop:(CGFloat)top bottom:(CGFloat)bottom left:(CGFloat)left right:(CGFloat)right;

/**
 *  更新距离TopLayout顶部的距离
 *
 *  @param viewController viewController
 *  @param topMargin      topMargin
 */
- (void)updateTopConstrainToTopLayoutGuideWithViewController:(UIViewController *)viewController topMargin:(CGFloat)topMargin;

/**
 *  清除自身的约束
 */
- (void)clearSelfConstrains;

/**
 *  清除superview的约束
 */
- (void)clearConstrainsToSuperView;

/**
 *  清除self宽高的约束
 */
- (void)clearWidthAndHeight;

/**
 *  设置边框线
 *
 *  @param borderWidth  borderWidth 边框宽度
 *  @param borderColor  borderColor 边框颜色
 *  @param cornerRadius cornerRadius 边框半径
 */
- (void)setBorderCornerWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor cornerRadius:(CGFloat)cornerRadius;

/**
 *  水平平均布局subview
 *
 *  @param subViews subViews
 */
- (void)constrainSubViewsForHorizontalAverage:(NSArray *)subViews;


@end
