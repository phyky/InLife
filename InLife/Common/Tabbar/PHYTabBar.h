//
//  PHYTabBar.h
//  APPTest
//
//  Created by pang on 16/11/22.
//  Copyright © 2016年 gdcattsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PHYTabBarEntity.h"
#import "PHYTabBarItem.h"
#import "PHYCommonMacro.h"

@protocol PHYTabBarViewDelegate <NSObject>
/**
 *  点击tabItem事件
 *
 *  @param selectedEntity 选中的item实体
 */
- (void)selectedItemAction:(PHYTabBarEntity *)selectedEntity;

@end

@interface PHYTabBar : UIView

/**
 *  TabBar背景颜色
 */
@property(nonatomic,strong) UIColor *bgColor;
/**
 *  装载所有item对应的控制的View
 */
@property(nonatomic,strong) UIView *controllerView;
/**
 *  TabBar所有item实体
 */
@property(nonatomic,strong) NSMutableArray *itemEntities;
/**
 *  TabBar所有items
 */
@property(nonatomic,strong) NSMutableArray *itemViews;
@property(nonatomic,assign) id<PHYTabBarViewDelegate> delegate;

- (id)initWithFrame:(CGRect)frame delegate:(id)delegate controllerView:(UIView *)controllerView;

/**
 *  提供给外部直接跳到指定的index页面
 *
 *  @param index 选中的item
 */
-(void)selectIndex:(NSInteger)index;


@end
