//
//  WFRouterManager.m
//  WFRouter
//
//  Created by waddy on 2019/4/22.
//  Copyright © 2019 wyy. All rights reserved.
//

#import "WFRouterManager.h"
#import "WFRouterModel.h"
#import "WFRouterNavigationController.h"
@interface WFRouterManager()

@end
static WFRouterManager *_instance;
@implementation WFRouterManager
+ (instancetype)shareInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:nil]init];
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




- (void)initWithRouterModel:(WFRouterModel *)model {
    if (!model) {
        return;
    }
    NSURLComponents *component = [[NSURLComponents alloc]initWithString:model.url];
    NSArray *array = component.queryItems;
    
    for (NSURLQueryItem *item in array) {
        if ([item.name isEqualToString:@"type"]) {
            NSString *typeValue = item.value;
            if ([typeValue isEqualToString:@"go_inter_view"]) {
                for (NSURLQueryItem *item in array) {
                    if ([item.name isEqualToString:@"pid"]) {
                        [self.routerNavigationController WFJumpToviewControllerWithPagerId:item.value jumpStyle:WFRouterNavigationJumpStylePush jumpParam:model.otherParam];
                    }
                }
                return;
            } else if ([typeValue isEqualToString:@"go_webview"]) {
                for (NSURLQueryItem *item in array) {
                    if ([item.name isEqualToString:@"url"]) {
                       BOOL open = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:item.value]];
                        if (open) {
                            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:item.value] options:nil completionHandler:^(BOOL success) {
                            }];
                        }
                    }
                }
                return;
            }
        }
    }
    
}



@end
