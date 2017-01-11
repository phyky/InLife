//
//  PHYBaseViewController.h
//  APPTest
//
//  Created by pang on 16/11/22.
//  Copyright © 2016年 gdcattsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PHYBaseViewController : UIViewController
#pragma mark - 基础属性
/**
 *  导航条
 */
@property(nonatomic,strong) UIView *naviView;
/**
 *  标题
 */
@property(nonatomic,strong) UILabel *titleLabel;
/**
 *  返回按钮
 */
@property(nonatomic,strong) UIButton *backButton;
/**
 *  导航条右边按钮
 */
@property(nonatomic,strong) UIButton *rightButton;
/**
 *  是否显示标题
 */
@property(nonatomic,assign) BOOL showTitle;
/**
 *  是否显示返回按钮
 */
@property(nonatomic,assign) BOOL showBackButton;
/**
 *  是否显示右边按钮
 */
@property(nonatomic,assign) BOOL showRightButton;
/**
 *  右边按钮是否带边框
 */
@property(nonatomic,assign) BOOL showRightButtonBorder;
/**
 *  是否支持侧滑返回
 */
@property(nonatomic,assign) BOOL interactivePop;

#pragma mark - 请求没有数据返回，界面显示
/**
 *  是否显示提示文字,默认是NO
 */
@property (nonatomic,assign) BOOL showDescript;


#pragma mark - Public Method

/**
 *  返回按钮调用
 */
-(void)baseBackBtnAction:(UIButton *)button;
/**
 *  右边按钮调用
 *
 */
-(void)rightButtonAction:(UIButton *)button;
/**
 *  设置没有数据的提示
 *
 *  @param image    没有数据提示图片
 *  @param descript 没有数据提示文字
 */
-(void)noDataImage:(NSString*)image andNoDataDescript:(NSString *)descript;

@end
