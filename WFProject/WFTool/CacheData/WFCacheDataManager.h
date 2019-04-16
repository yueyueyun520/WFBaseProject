//
//  WFCacheDataManager.h
//  WFProject
//
//  Created by efun on 2019/4/15.
//  Copyright © 2019 efun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFCacheDataManager : NSObject


+ (instancetype)shareInstance;

/**
 增
 @param tableName 表名 规则：当前ViewModel+功能 如：WFFirstViewModelGetList
 @param jsonData  jsonData
 */
- (void)insertInToTableName:(NSString *)tableName json:(NSData *)jsonData;

/**
 改
 @param tableName 表名 规则：当前ViewModel+功能 如：WFFirstViewModelGetList
 @param ID        更新的ID
 @param jsonData  jsonData
 */
- (void)updateTable:(NSString *)tableName updateId:(NSInteger)ID jsonData:(NSData *)jsonData;

/**
 查
 @param tableName 表名 规则：当前ViewModel+功能 如：WFFirstViewModelGetList
 @param mostIndex 最大缓存个数 超过保存个数时删除最远保存的
 @return          返回查询到的jason数组 （整个表的数据）后面优化只返回想要查询的
 */
- (NSArray *)selectFromTabel:(NSString *)tableName mostIndex:(NSInteger)mostIndex;
@end

NS_ASSUME_NONNULL_END
