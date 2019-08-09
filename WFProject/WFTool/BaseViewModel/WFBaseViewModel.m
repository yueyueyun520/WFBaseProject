//
//  WFBaseViewModel.m
//  AFNetworking
//
//  Created by waddy on 2019/4/8.
//

#import "WFBaseViewModel.h"
#import "WFCacheDataManager.h"
#import "YYModel.h"


@implementation WFBaseViewModel
- (WFNetworkingRequestParam *)requestParam {
    WFNetworkingRequestParam *param = [WFNetworkingRequestParam shareInstance];
    param.urlString = @"dsdsd";
    param.otherParam = @{};
    return param;
}


- (void)reloadModelDataSucces:(WFBaseViewModelRequestSuccesBlock)completionBlock fail:(WFNetWorkingRequestFailBlock)failureBlock{
    __weak typeof(self) weakSelf = self;
    WFNetworkingRequestParam *param = [self requestParam];
    [[WFNetWorkingRequest shareInstance]fetchNetWorkingDataWithParam:param susses:^(id  _Nonnull responeData) {
        
        @synchronized (weakSelf) {
            //解析处理数据
            NSMutableArray *modelArray = [NSMutableArray array];

            if ([responeData isKindOfClass:[NSArray class]]) {
                for (id obj in responeData) {
                    WFBaseModel *model = [weakSelf modelWithObject:obj];
                    [modelArray addObject:model];
                }
                completionBlock(modelArray);
                
            } else {
                WFBaseModel *model = [weakSelf modelWithObject:responeData];
                [modelArray addObject:model];
                completionBlock(modelArray);
            }
            
        }
        
    } fail:^(NSError * _Nonnull error) {
        failureBlock(error);
    }];

}

- (WFBaseModel *)modelWithObject:(id)object {
    WFBaseModel *baseModel = [[WFBaseModel alloc]initWithJasonModel:object];
    return baseModel;
}

/*
 缓存回调数据
 存：
 1.FMDB 单例创建，增删改查
 2.表名 ViewModel + 功能
 3.淘汰策略，始终保存几个，比如5个列表，超过5个删除最新进来的（在每次查询时，判断并删除）
 4.保存Jason/字段/model 字段不现实，当字段过多，model会存在序列化等其他问题
 5.key:ViewModel + 功能 +时间戳  （用FMDB本身的自动增长key）
 多读单写
 栅栏函数，读在一个队列，写在栅栏函数里
 查：
 根据key取到Jason 并根据当前viewModel解析返回ModeArray
 会取到整个表的数据哦
 根据需要获取显示
 
 */
- (void)setCacheWithJasonArray:(NSArray *)jasonArray cacheKey:(NSString *)cacheKey {
    /*
     1.传进来的modeArray 转成Jason 能拿到当前的model吗
     2.需要序列化
     */
    for (NSInteger i = 0; i < jasonArray.count; i++) {
        NSDictionary *jsonDict = jasonArray[i];
        //转化成nsdata
        NSData *jasonData = [NSKeyedArchiver archivedDataWithRootObject:jsonDict requiringSecureCoding:YES error:nil];
        [[WFCacheDataManager shareInstance] insertInToTableName:cacheKey json:jasonData];
    }
}

//这里data转Jason
- (NSArray<NSDictionary *> *)cacheJasonArrayWithCacheKey:(NSString *)cacheKey saveMostModelArrayNumber:(NSInteger)mostSaveNumber{
    NSArray *dictArray = [[WFCacheDataManager shareInstance] selectFromTabel:cacheKey mostIndex:mostSaveNumber];
    return dictArray;
}

@end
