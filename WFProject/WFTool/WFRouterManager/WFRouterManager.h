//
//  WFRouterManager.h
//  WFRouter
//
//  Created by waddy on 2019/4/22.
//  Copyright © 2019 wyy. All rights reserved.
//

#import <Foundation/Foundation.h>


@class WFRouterModel,WFRouterNavigationController;
NS_ASSUME_NONNULL_BEGIN

@interface WFRouterManager : NSObject
@property (nonatomic, strong) WFRouterNavigationController *routerNavigationController;

+ (instancetype)shareInstance;

- (void)initWithRouterModel:(WFRouterModel *)model;
@end

NS_ASSUME_NONNULL_END
