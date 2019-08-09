//
//  WFRouterNavigationController.m
//  WFRouter
//
//  Created by waddy on 2019/4/19.
//  Copyright © 2019 wyy. All rights reserved.
//

#import "WFRouterNavigationController.h"
#import <objc/runtime.h>
#import "WFBaseViewController.h"

@interface WFRouterNavigationController ()

@end

@implementation WFRouterNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)WFJumpToViewContrllerName:(NSString *)viewControllerName                   jumpStyle:(WFRouterNavigationJumpStyle)jumpStyle jumpParam:(NSDictionary *)param {
    [self jumpToVCName:viewControllerName jumpStyle:jumpStyle jumpParam:param];
}


- (void)WFJumpToviewControllerWithPagerId:(NSString *)pid jumpStyle:(WFRouterNavigationJumpStyle)jumpStyle jumpParam:(NSDictionary  * _Nullable )param {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"WFRouterTable" ofType:@"plist"];
    NSDictionary *plistDict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSDictionary *itemDict = [plistDict objectForKey:pid];
    if (itemDict.count > 0) {
        NSString *vcName = [itemDict objectForKey:@"name"];
        if (vcName.length > 0) {
            [self jumpToVCName:vcName jumpStyle:jumpStyle jumpParam:param];
        }
    }
}



- (void)jumpToVCName:(NSString *)name jumpStyle:(WFRouterNavigationJumpStyle)jumpStyle                   jumpParam:(NSDictionary *)param {
    
    Class class = NSClassFromString(name);
    WFBaseViewController *vc = [(WFBaseViewController *)[class alloc]init];
    if (param.count > 0) {
        [vc setParam:param];
    }
    //跳转
    if (jumpStyle == WFRouterNavigationJumpStylePush) {
         [self pushViewController:vc animated:YES];
    } else if (jumpStyle == WFRouterNavigationJumpStylePush) {
        [self presentViewController:vc animated:YES completion:nil];
    }
   
    
}

@end
