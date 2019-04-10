//
//  WFBaseViewModel.h
//  AFNetworking
//
//  Created by efun on 2019/4/8.
//

/**
 子类需要重写requestParam 方法
 - (WNetworkingRequestParam *)requestParam {
 WNetworkingRequestParam *param = [[WNetworkingRequestParam alloc]init];
 param.urlString = @"";
 param.otherParam = @{};
 return param;
 }
 
 重写当前viewModel对应model的解析  WBaseModel 换成当前model
 - (WBaseModel *)modelWithObject:(id)object {
 WBaseModel *baseModel = [[WBaseModel alloc]initWithJasonModel:object];
 return baseModel;
 }
 
 
 
 */

#import <Foundation/Foundation.h>
#import "WFNetworkingRequestParam.h"
#import "WFNetWorkingRequest.h"
#import "WFBaseModel.h"
#import "WFBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WFBaseViewModel : NSObject
typedef void(^WFBaseViewModelRequestSuccesBlock)(NSArray<WFBaseModel *> *modelArray);

@property (nonatomic, strong) NSArray *modelArray;


- (void)reloadModelDataSucces:(WFBaseViewModelRequestSuccesBlock)completionBlock fail:(WFNetWorkingRequestFailBlock)failureBlock;
/**
 设置param
 */
- (WFNetworkingRequestParam *)requestParam;
@end

NS_ASSUME_NONNULL_END
