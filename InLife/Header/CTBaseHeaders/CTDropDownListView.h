//
//  DropDownListView.h
//  testDropList
//
//  Created by cattsoft on 16/1/14.
//  Copyright © 2016年 com.wei. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CELL_HEIGHT 40

//代理方法
@protocol CTDropListChooseDelegate <NSObject>

@optional

/**
 *  点击选择
 *
 *  @param section 区域
 *  @param index   行列
 */
- (void)chooseAtIndex:(NSInteger)index;

@end

@protocol CTDropListChooseDataSource <NSObject>

/** 行数 */
- (NSInteger)numberOfRows;
/** 样式 */
- (NSString*)titleAtIndex:(NSInteger)index;


@end

@interface CTDropDownListView : UIView <UITableViewDataSource,UITableViewDelegate>

/**
 *  显示下拉菜单
 *
 *  @param frame      计算好的UIButton的位置
 *  @param dataSource 数据源代理
 *  @param delegate   代理
 */
+ (void)showWithFrame:(CGRect)frame dataSource:(id<CTDropListChooseDataSource>)dataSource delegate:(id<CTDropListChooseDelegate>)delegate;

/**
 *  隐藏下拉菜单
 */
+ (void)hideDropDownListView;

@end
