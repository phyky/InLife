//
//  PHYNavigationController.h
//  APPTest
//
//  Created by pang on 16/11/22.
//  Copyright © 2016年 gdcattsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PHYNavigationController : UINavigationController<UIGestureRecognizerDelegate>

/**
 * 不需要手势返回的页面使用类别重写这个方法判断并返回NO时该页面不支持手势返回
 * 最后需要判断是否是根视图，必须增加否则会存在手势和push动画冲突
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer;

@end
