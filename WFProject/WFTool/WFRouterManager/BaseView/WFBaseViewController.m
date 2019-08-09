//
//  WFBaseViewController.m
//  WFRouter
//
//  Created by waddy on 2019/4/19.
//  Copyright © 2019 wyy. All rights reserved.
//

#import "WFBaseViewController.h"
#import "WFRouterManager.h"


@interface WFBaseViewController ()

@end

@implementation WFBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationController.navigationBar.hidden = YES;
    [self jumpHandle];
}

- (void)jumpHandle {
    [self.routerNavigationController WFJumpToviewControllerWithPagerId:@"10001" jumpStyle:WFRouterNavigationJumpStylePush jumpParam:@{@"title":@"routerDemo"}];
}


- (void)setParam:(NSDictionary *)param {
    
}


@end
