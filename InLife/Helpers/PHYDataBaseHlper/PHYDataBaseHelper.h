//
//  PHYDataBaseHelper.h
//  InLife
//
//  Created by pang on 16/11/25.
//  Copyright © 2016年 physoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ILAppHeader.h"
#import "ILMeiWenEntity.h"
#import "ILHomePageEntity.h"

@interface PHYDataBaseHelper : NSObject
//初始化实例
+ (PHYDataBaseHelper*)shareInstance;

/**
 *  插入美文数据
 *
 *  @param MeiWenEntity 美文数据
 *  @param date         日期
 */
- (void)insertMeiWenDataToDB:(ILMeiWenEntity *)MeiWenEntity date:(NSString *)date;

/**
 *  获取美文数据
 *
 *  @param date 日期
 *
 *  @return 对应日期的美文数据
 */
- (ILMeiWenEntity *)getMeiWenDataWithDate:(NSString *)date;

/**
 *  获取所有数据
 *
 */
- (NSMutableArray *)getMeiWenData;


/**
 *  插入语录数据
 *
 *  @param HomePageEntity 首页语录数据
 *  @param date           日期
 *  @param dataId         语录标识
 */
- (void)insertHomePageDataToDB:(ILHomePageEntity *)HomePageEntity date:(NSString *)date dataId:(NSString *)dataId;

/**
 *  修改收藏状态
 *
 *  @param HomePageEntity 首页语录数据
 *  @param dataId         语录标识
 *  @param state          是否收藏
 */
- (void)updateHomePageDataToDB:(ILHomePageEntity *)HomePageEntity dataId:(NSString *)dataId collectState:(BOOL)state;

/**
 *  查看收藏记录
 *
 *  @param dataId 语录标识
 *
 *  @return 语录数据
 */
- (ILHomePageEntity *)checkCollectionHomePageDataWithDataId:(NSString *)dataId;

/**
 *  获取语录数据
 *
 *  @param date 日期
 *
 *  @return 对应日期的语录数据
 */
- (ILHomePageEntity *)getHomePageDataWithDate:(NSString *)date;

/**
 *  获取所有语录收藏数据
 *
 */
- (NSMutableArray *)getAllCollcetHomePageData;

/**
 *  获取所有数据
 *
 */
- (NSMutableArray *)getAllHomePageData;
@end
