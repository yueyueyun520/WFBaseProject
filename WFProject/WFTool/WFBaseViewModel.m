//
//  WFBaseViewModel.m
//  AFNetworking
//
//  Created by efun on 2019/4/8.
//

#import "WFBaseViewModel.h"


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


@end
