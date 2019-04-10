//
//  WFFirstViewModel.m
//  WFProject
//
//  Created by efun on 2019/4/10.
//  Copyright © 2019 efun. All rights reserved.
//

#import "WFFirstViewModel.h"

@implementation WFFirstViewModel
- (WFNetworkingRequestParam *)requestParam {
    WFNetworkingRequestParam *param = [WFNetworkingRequestParam shareInstance];
    param.urlString = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1554885522277&di=80ac3b39a10a6bffa4d2a20a9bae50d6&imgtype=0&src=http%3A%2F%2Fimg18.3lian.com%2Fd%2Ffile%2F201712%2F04%2Fa185075073435725bffeb1601bdb688a.png";
    param.otherParam = @{
                         @"page":@"1"
                         };
    return param;
}

- (WFFirstModel *)modelWithObject:(id)object {
    WFFirstModel *model = [[WFFirstModel alloc]initWithJasonModel:object];
    return model;
}

@end
