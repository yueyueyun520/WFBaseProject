//
//  WFBaseViewController.h
//  WFRouter
//
//  Created by waddy on 2019/4/19.
//  Copyright © 2019 wyy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WFRouterNavigationController.h"
NS_ASSUME_NONNULL_BEGIN

@interface WFBaseViewController : UIViewController
@property (nonatomic, strong) WFRouterNavigationController *routerNavigationController;
/**
 设置参数  基类需要重写获取
 @param param 跳转携带字典参数
 */
- (void)setParam:(NSDictionary *)param;
@end

NS_ASSUME_NONNULL_END
