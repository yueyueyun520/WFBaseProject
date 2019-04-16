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

/**
 保存jasonArray数据
 @param jasonArray       需要保存的jasonArray  model转化成json NSDictionary *json = [user yy_modelToJSONObject];
 @param cacheKey         保存的key 规则：当前ViewModel+功能 如：WFFirstViewModelGetList
 */
- (void)setCacheWithJasonArray:(NSArray *)jasonArray cacheKey:(NSString *)cacheKey;

/**
 获取Jason数组 需要自行解析
 @param cacheKey       缓存key
 @param mostSaveNumber 设置最大保存个数 超过保存个数时删除最远保存的
 @return  返回jason数组 需要Jason转model  user = [user yy_modelWithJSON:object]
 */
- (NSArray<NSDictionary *> *)cacheJasonArrayWithCacheKey:(NSString *)cacheKey saveMostModelArrayNumber:(NSInteger)mostSaveNumber;
@end

NS_ASSUME_NONNULL_END
