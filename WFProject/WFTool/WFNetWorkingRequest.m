//
//  WFNetWorkingRequest.m
//  WF
//
//  Created by efun on 2019/4/8.
//

#import "WFNetWorkingRequest.h"
#import "AFNetworking.h"


@interface WFNetWorkingRequest()
@property (nonatomic, strong) NSURLSessionTask *session;
@property (nonatomic, strong) WFNetworkingRequestParam *param;
@end
@implementation WFNetWorkingRequest

+ (WFNetWorkingRequest *)shareInstance {
    static WFNetWorkingRequest *shareInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[super allocWithZone:nil] init];
    });
    return shareInstance;
}

- (NSURLSessionTask *)fetchNetWorkingDataWithParam:(WFNetworkingRequestParam *)param susses:(WFNetWorkingRequestSuccesBlock)completionBlock fail:(WFNetWorkingRequestFailBlock)failureBlock{
    /**
     1.取消上一次的session
     2.解析转换param
     3.请求配置 config 超时设置
     */
    if (self.session) {
        [self.session cancel];
    }
    
    NSDictionary *paramDic = [self paramConvertToDicdionary:param];
    
    NSURLSessionConfiguration *cofig = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:cofig];
    NSURLSessionDataTask *sessionTask = [manager GET:param.urlString parameters:paramDic progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error);
    }];
    [sessionTask resume];
    
    self.session = sessionTask;
    return sessionTask;
}

- (NSDictionary *)paramConvertToDicdionary:(WFNetworkingRequestParam *)param {
    NSMutableDictionary *paramDict = [NSMutableDictionary dictionary];
    if (param.userId.length > 0) {
        [paramDict setValue:param.userId forKey:@"userID"];
    }
    if (param.token.length > 0) {
        [paramDict setValue:param.token forKey:@"token"];
    }
    if (param.apiVersion.length > 0) {
        [paramDict setValue:param.apiVersion forKey:@"apiVersion"];
    }
    if (param.appVersion.length > 0) {
        [paramDict setValue:param.appVersion forKey:@"appVersion"];
    }
    if (param.otherParam.count > 0) {
        [paramDict addEntriesFromDictionary:param.otherParam];
    }
    
    return (NSDictionary *)paramDict;
}


@end
