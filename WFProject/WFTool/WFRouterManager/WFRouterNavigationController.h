//
//  WFRouterNavigationController.h
//  WFRouter
//
//  Created by waddy on 2019/4/19.
//  Copyright © 2019 wyy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,WFRouterNavigationJumpStyle){
    WFRouterNavigationJumpStylePush = 0,
    WFRouterNavigationJumpStylePresent,
};

@interface WFRouterNavigationController : UINavigationController
/**
 通过viewControllerName跳转
 @param viewControllerName VCName string
 @param jumpStyle          跳转方式
 @param param              携带参数
 */
- (void)WFJumpToViewContrllerName:(NSString *)viewControllerName                         jumpStyle:(WFRouterNavigationJumpStyle)jumpStyle                   jumpParam:(NSDictionary *)param;

/**
 通过pageId跳转
 @param pid                pageID
 @param jumpStyle          跳转方式
 @param param              携带参数
 */
- (void)WFJumpToviewControllerWithPagerId:(NSString *)pid jumpStyle:(WFRouterNavigationJumpStyle)jumpStyle jumpParam:(NSDictionary  * _Nullable )param;
@end

NS_ASSUME_NONNULL_END
