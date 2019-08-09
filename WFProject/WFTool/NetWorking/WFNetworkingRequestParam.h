//
//  WFNetworkingRequestParam.h
//  
//
//  Created by waddy on 2019/4/4.
//  参数设置

/**
 WFNetworkingRequestParam的使用
 1.直接创建获得param对象
 WFNetworkingRequestParam *param = [[WFNetworkingRequestParam alloc]init];
 param.urlString = K_MRS_API_UPDATE_USER_INFO_PET_LIST_URL;
 param.httpMethod = WNetworkingRequestMethodGet;
 
 param.otherParam = @{
 @"select_user_pet":@(true),
 };
 2.viewModel里面调用requestParam，子类需要要重写，父viewmodel有生成requestParam
 
 WFNetworkingRequestParam转成NSDictionary在网络请求中转换

 */

#import <Foundation/Foundation.h>
#import "WFNetworkingRequestParam.h"
NS_ASSUME_NONNULL_BEGIN
typedef enum : NSUInteger {
    WFNetworkingRequestMethodPost = 0,
    WFNetworkingRequestMethodGet,
} WFNetworkingRequestMethod;

@interface WFNetworkingRequestParam : NSObject
/**
 其他参数
 */
@property (nonatomic, strong) NSDictionary *otherParam;

/**
 请求url
 */
@property (nonatomic, copy) NSString *urlString;

/**
 请求方式 get/post
 */
@property (nonatomic, assign) WFNetworkingRequestMethod requestMethod;

/**
 所有参数
 */
@property (nonatomic, strong) NSDictionary *allParam;

@property (nonatomic, assign) NSTimeInterval timeoutInterval;
@property (nonatomic, copy) NSString *apiVersion;         //api接口
@property (nonatomic, copy) NSString *appVersion;         //app接口
@property (nonatomic, copy) NSString *userId;             //用户ID
@property (nonatomic, copy) NSString *token;              //token
@property (nonatomic, copy) NSString *comeFrom;           //来源 ios Android

+ (instancetype)shareInstance;
/**
 缓存请求参数
 */
- (void)cashRequestParam ;


@end

NS_ASSUME_NONNULL_END
