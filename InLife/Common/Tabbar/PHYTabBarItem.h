//
//  PHYTabBarItem.h
//  APPTest
//
//  Created by pang on 16/11/22.
//  Copyright © 2016年 gdcattsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PHYTabBarEntity.h"

@protocol PHYTabBarItemDelegate <NSObject>
/**
 *  点击tabItem事件
 *
 *  @param selectedEntity 选中的item实体
 */
- (void)selectedItemAction:(PHYTabBarEntity *)selectedEntity;

@end

@interface PHYTabBarItem : UIButton

/**
 *  item图标
 */
@property(nonatomic,strong)UIButton *itemIcon;
/**
 *  item文字
 */
@property(nonatomic,strong)UIButton *itemTitle;
/**
 *  item实体
 */
@property(nonatomic,strong) PHYTabBarEntity *entity;
@property(nonatomic,strong) id<PHYTabBarItemDelegate>delegate;

- (id)initWithFrame:(CGRect)frame entity:(PHYTabBarEntity *)entity delegate:(id)delegate;

/**
 *  更新tabbar的选中状态
 *
 *  @param state 是否选中
 */
-(void)updateTabBarItemState:(BOOL)state;

@end
