//
//  WFNetworkingRequestParam.m
//  
//
//  Created by waddy on 2019/4/4.
//

#import "WFNetworkingRequestParam.h"
@interface WFNetworkingRequestParam()

@end
@implementation WFNetworkingRequestParam
static WFNetworkingRequestParam *_instance;

+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init];
        [_instance setDefaultConfig];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return _instance;
}


- (void)setDefaultConfig {
    self.apiVersion = @"1.0.1";
    self.appVersion = @"1.0.1";
    self.userId = @"62734374385643";
    self.token = @"63462478264374634";
    self.comeFrom = @"ios";
}


/**
 使用缓存model的方式
 */
- (void)cashRequestParam {
    
}
@end
