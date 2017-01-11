//
//  PHYDataBaseHelper.m
//  InLife
//
//  Created by pang on 16/11/25.
//  Copyright © 2016年 physoft. All rights reserved.
//

#import "PHYDataBaseHelper.h"

static NSString * const MWTableName = @"MEIWEN_TABLE";
static NSString * const HPTableName = @"HOMEPAGE_TABLE";
static FMDatabaseQueue *databaseQueue = nil;

@implementation PHYDataBaseHelper

+ (PHYDataBaseHelper*)shareInstance
{
    static PHYDataBaseHelper* instance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[[self class] alloc] init];
        [instance createMeiWenTable];
        [instance createHomePageTable];
    });
    return instance;
}

#pragma mark - MeiWen Public Method
//插入数据
- (void)insertMeiWenDataToDB:(ILMeiWenEntity *)MeiWenEntity date:(NSString *)date{
    NSString *insertSql = @"INSERT INTO MEIWEN_TABLE (data, date) VALUES (?, ?)";
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:MeiWenEntity];
    FMDatabaseQueue *queue = [self getDatabaseQueue];
    [queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:insertSql,data,date];
    }];
}
//获取某天数据
- (ILMeiWenEntity *)getMeiWenDataWithDate:(NSString *)date{
    __block ILMeiWenEntity * MeiWenEntity = nil;
    __block NSData *data = nil;
    FMDatabaseQueue *queue = [self getDatabaseQueue];
    if (queue==nil) {
        return nil;
    }
    [queue inDatabase:^(FMDatabase *db) {
        FMResultSet *result = [db executeQuery:@"SELECT * FROM MEIWEN_TABLE where date = ?",date];
        while ([result next]) {
            data = [result dataForColumn:@"data"];
            
            MeiWenEntity = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }
        [result close];
    }];
    return  MeiWenEntity;
}

//获取所有数据
- (NSMutableArray *)getMeiWenData{
    __block ILMeiWenEntity * MeiWenEntity = nil;
    __block NSMutableArray *MeiWenEntities = [NSMutableArray array];
    __block NSData *data = nil;
    FMDatabaseQueue *queue = [self getDatabaseQueue];
    if (queue==nil) {
        return nil;
    }
    [queue inDatabase:^(FMDatabase *db) {
        FMResultSet *result = [db executeQuery:@"SELECT * FROM MEIWEN_TABLE"];
        while ([result next]) {
            data = [result dataForColumn:@"data"];
            MeiWenEntity = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            [MeiWenEntities addObject:MeiWenEntity];
        }
        [result close];
    }];
    return  MeiWenEntities;
}

#pragma mark - HomePage Public Method
//插入数据
- (void)insertHomePageDataToDB:(ILHomePageEntity *)HomePageEntity date:(NSString *)date dataId:(NSString *)dataId{
    NSString *insertSql = @"INSERT INTO HOMEPAGE_TABLE (data, date, dataId) VALUES (?, ?, ?)";
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:HomePageEntity];
    FMDatabaseQueue *queue = [self getDatabaseQueue];
    [queue inDatabase:^(FMDatabase *db) {
        [db executeUpdate:insertSql,data,date,dataId];
    }];
}
//修改数据
- (void)updateHomePageDataToDB:(ILHomePageEntity *)HomePageEntity dataId:(NSString *)dataId collectState:(BOOL)state{
//    NSString *insertSql = [NSString stringWithFormat:@"UPDATE HOMEPAGE_TABLE SET collectState=%@ WHERE date=%@",@"1",date];
   
    NSString *insertSql = @"UPDATE HOMEPAGE_TABLE SET collectState = ? WHERE dataId = ?";
    FMDatabaseQueue *queue = [self getDatabaseQueue];
    [queue inDatabase:^(FMDatabase *db) {
        BOOL res = [db executeUpdate:insertSql,[NSNumber numberWithBool:state],dataId];
        if (res) {
            
        }else{
        
        }
    }];
}

//获取某天数据是否收藏
- (ILHomePageEntity *)checkCollectionHomePageDataWithDataId:(NSString *)dataId{
    __block ILHomePageEntity * HomePageEntity = nil;
    __block NSData *data = nil;
    FMDatabaseQueue *queue = [self getDatabaseQueue];
    if (queue==nil) {
        return nil;
    }
    [queue inDatabase:^(FMDatabase *db) {
        FMResultSet *result = [db executeQuery:@"SELECT * FROM HOMEPAGE_TABLE where dataId = ? and collectState = ?",dataId,[NSNumber numberWithBool:YES]];
        while ([result next]) {
            data = [result dataForColumn:@"data"];
            
            HomePageEntity = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }
        [result close];
    }];
    return  HomePageEntity;
}

//获取所有收藏语录数据
- (NSMutableArray *)getAllCollcetHomePageData{
    __block ILHomePageEntity * HomePageEntity = nil;
    __block NSMutableArray *HomePageEntities = [NSMutableArray array];
    __block NSData *data = nil;
    FMDatabaseQueue *queue = [self getDatabaseQueue];
    if (queue==nil) {
        return nil;
    }
    [queue inDatabase:^(FMDatabase *db) {
        FMResultSet *result = [db executeQuery:@"SELECT * FROM HOMEPAGE_TABLE WHERE collectState = ?", @"1"];
        while ([result next]) {
            data = [result dataForColumn:@"data"];
            HomePageEntity = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            [HomePageEntities addObject:HomePageEntity];
        }
        [result close];
    }];
    return  HomePageEntities;
}


//获取某天数据
- (ILHomePageEntity *)getHomePageDataWithDate:(NSString *)date{
    __block ILHomePageEntity * HomePageEntity = nil;
    __block NSData *data = nil;
    FMDatabaseQueue *queue = [self getDatabaseQueue];
    if (queue==nil) {
        return nil;
    }
    [queue inDatabase:^(FMDatabase *db) {
        FMResultSet *result = [db executeQuery:@"SELECT * FROM HOMEPAGE_TABLE where date = ?",date];
        while ([result next]) {
            data = [result dataForColumn:@"data"];
            
            HomePageEntity = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        }
        [result close];
    }];
    return  HomePageEntity;
}

//获取所有数据
- (NSMutableArray *)getAllHomePageData{
    __block ILHomePageEntity * HomePageEntity = nil;
    __block NSMutableArray *HomePageEntities = [NSMutableArray array];
    __block NSData *data = nil;
    FMDatabaseQueue *queue = [self getDatabaseQueue];
    if (queue==nil) {
        return nil;
    }
    [queue inDatabase:^(FMDatabase *db) {
        FMResultSet *result = [db executeQuery:@"SELECT * FROM HOMEPAGE_TABLE"];
        while ([result next]) {
            data = [result dataForColumn:@"data"];
            HomePageEntity = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            [HomePageEntities addObject:HomePageEntity];
        }
        [result close];
    }];
    return  HomePageEntities;
}

#pragma mark - Privite Method
//创建美文存储表
- (void)createMeiWenTable
{
    FMDatabaseQueue *queue = [self getDatabaseQueue];
    if (queue==nil) {
        return;
    }
    [queue inDatabase:^(FMDatabase *db) {
        if (![self isTableOK:MWTableName withDB:db]) {
            NSString *createTableSQL = @"CREATE TABLE MEIWEN_TABLE (id integer PRIMARY KEY autoincrement, data blob,date string)";
            [db executeUpdate:createTableSQL];
        }
    }];
    
}

//创建首页存储表
- (void)createHomePageTable
{
    FMDatabaseQueue *queue = [self getDatabaseQueue];
    if (queue==nil) {
        return;
    }
    [queue inDatabase:^(FMDatabase *db) {
        if (![self isTableOK:HPTableName withDB:db]) {
            NSString *createTableSQL = @"CREATE TABLE HOMEPAGE_TABLE (id integer PRIMARY KEY autoincrement, data blob,date string,dataId string,collectState string)";
            [db executeUpdate:createTableSQL];
        }
    }];
    
}


- (FMDatabaseQueue *)getDatabaseQueue
{
    if (!databaseQueue) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentDirectory = [paths objectAtIndex:0];
        NSString *dbPath = [documentDirectory stringByAppendingPathComponent:@"InLife.sqlite"];
        databaseQueue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
        DLog(@"dataBasePath:%@",dbPath);
    }
    
    return databaseQueue;
    
}

- (BOOL) isTableOK:(NSString *)tableName withDB:(FMDatabase *)db
{
    BOOL isOK = NO;
    
    FMResultSet *rs = [db executeQuery:@"select count(*) as 'count' from sqlite_master where type ='table' and name = ?", tableName];
    while ([rs next])
    {
        NSInteger count = [rs intForColumn:@"count"];
        
        if (0 == count)
        {
            isOK =  NO;
        }
        else
        {
            isOK = YES;
        }
    }
    [rs close];
    
    return isOK;
}
@end
