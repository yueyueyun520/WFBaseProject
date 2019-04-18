//
//  WFCacheDataManager.m
//  WFProject
//
//  Created by efun on 2019/4/15.
//  Copyright © 2019 efun. All rights reserved.
//

#import "WFCacheDataManager.h"
#import "FMDatabase.h"
#import "WFCacheDateResultModel.h"
@interface WFCacheDataManager()
@property (nonatomic, strong) FMDatabase *dataBase;

@end
static WFCacheDataManager *_shareInstance;
@implementation WFCacheDataManager

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstance = [[super allocWithZone:nil]init];
        [_shareInstance createDataBase];
    });
    return _shareInstance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _shareInstance;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return _shareInstance;
}

/*
 1.创建数据库，每次进来需要判断是否打开,使用完要关闭
 2.判断当前是否存在传进来的表
 3.增删改查
 4.考虑数据安全问题，多线程，加锁 多读单写
 */

//创建数据库
- (void)createDataBase {
    //数据库路径
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
    NSString *dataPath = [path stringByAppendingPathComponent:@"WFDataBase.db"];
    NSLog( @"DBPath: %@",dataPath);
    self.dataBase = [FMDatabase databaseWithPath:dataPath];
    [self.dataBase open];
    if (![self.dataBase open]) {
        NSLog(@"dataBase open fail");
        return;
    }
}

//创建表
- (void)createTableWithName:(NSString *)tableName {
    NSString *sql = [NSString stringWithFormat:@"create table if not exists %@ ('ID' INTEGER PRIMARY KEY AUTOINCREMENT,'json' BLOB)",tableName];
    BOOL result = [self.dataBase executeUpdate:sql];
    if (result) {
        NSLog(@"create table success");
    }
}

//增
- (void)insertInToTableName:(NSString *)tableName json:(NSData *)jsonData{
    //判断数据是否打开
    [self.dataBase open];
    if (![self.dataBase open]) {
        return;
    }
    [self createTableWithName:tableName];
    
    NSString *sql = [NSString stringWithFormat:@"insert into %@ (json) values (?)",tableName];
    BOOL result = [self.dataBase executeUpdate:sql,jsonData];
    if (result) {
        NSLog(@"insert table success");
    } else {
        NSLog(@"insert table fail");
    }
    [self.dataBase close];
}

//删
- (void)deleteFromTabel:(NSString *)tableName id:(NSInteger)deleteId {
    [self.dataBase open];
    if (![self.dataBase open]) {
        return;
    }
    NSString *sql = [NSString stringWithFormat:@"delete from %@ where ID = %zd",tableName,deleteId];
    BOOL result = [self.dataBase executeUpdate:sql];
    if (result) {
        NSLog(@"delete data success");
    } else {
        NSLog(@"delete data fail");
    }
    [self.dataBase close];
}

//改
- (void)updateTable:(NSString *)tableName updateId:(NSInteger)ID jsonData:(NSData *)jsonData {
    [self.dataBase open];
    if (![self.dataBase open]) {
        return;
    }
    NSString *sql = [NSString stringWithFormat:@"update %@ set json = %@  where ID = %zd",tableName,jsonData,ID];
    BOOL result = [self.dataBase executeUpdate:sql];
    if (result) {
        NSLog(@"update data success");
    } else {
        NSLog(@"update data fail");
    }
    [self.dataBase close];
}

//查 全部返回 顺便删除超过个数的
- (NSArray *)selectFromTabel:(NSString *)tableName mostIndex:(NSInteger)mostIndex {
    [self.dataBase open];
    if (![self.dataBase open]) {
        return @[];
    }
    NSString *sql = [NSString stringWithFormat:@"select * from %@",tableName];
    FMResultSet *resultSet = [self.dataBase executeQuery:sql];
    NSMutableArray *resultArray = [NSMutableArray array];
    NSMutableArray *dictArray = [NSMutableArray array];
    while ([resultSet next]) {  //没有查询出全部
        WFCacheDateResultModel *model = [[WFCacheDateResultModel alloc]init];
        model.resultId = [resultSet intForColumn:@"ID"];
        model.jasonData = [resultSet dataForColumn:@"json"];
        
        NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:model.jasonData];
        [resultArray addObject:model];
        [dictArray addObject:dict];
    }
    if (resultArray.count > mostIndex) { //超过缓存个数删除
        NSInteger deleteIndex = resultArray.count - mostIndex ;
        if (deleteIndex < resultArray.count) {
            for (NSInteger i = 0; i < deleteIndex; i++) {
                WFCacheDateResultModel *deleteModel = resultArray[i];
                //去数据库删除
                [self deleteFromTabel:tableName id:deleteModel.resultId];
                //删除返回数组
                [dictArray removeObjectAtIndex:i];
            }
        }
    }
    
    [self.dataBase close];
    return dictArray;
    
}






@end
