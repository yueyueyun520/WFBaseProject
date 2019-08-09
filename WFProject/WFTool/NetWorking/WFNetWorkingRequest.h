//
//  WFNetWorkingRequest.h
//  Wf
//
//  Created by waddy on 2019/4/8.
//

#import <Foundation/Foundation.h>
#import "WFNetworkingRequestParam.h"
#import "WFNetWorkingRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface WFNetWorkingRequest : NSObject
typedef void(^WFNetWorkingRequestSuccesBlock)(id  responeData);
typedef void(^WFNetWorkingRequestFailBlock)(NSError * _Nonnull error);



- (NSURLSessionTask *)fetchNetWorkingDataWithParam:(WFNetworkingRequestParam *)param susses:(WFNetWorkingRequestSuccesBlock)completionBlock fail:(WFNetWorkingRequestFailBlock)failureBlock;

+ (WFNetWorkingRequest *)shareInstance;
@end

NS_ASSUME_NONNULL_END
