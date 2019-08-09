//
//  WFFirstViewModel.m
//  WFProject
//
//  Created by waddy on 2019/4/10.
//  Copyright © 2019 waddy. All rights reserved.
//

#import "WFFirstViewModel.h"

@implementation WFFirstViewModel
- (WFNetworkingRequestParam *)requestParam {
    WFNetworkingRequestParam *param = [WFNetworkingRequestParam shareInstance];
    param.urlString = @"https://api-social.adnonstop.com/index.php?r=1.3.0/article/recommend/get-list&req=eyJpc19lbmMiOjAsImN0aW1lIjoxNTU1MTIwOTg2LjgzNTYzNCwib3NfdHlwZSI6ImlvcyIsImRldmljZSI6ImlQaG9uZSA3IiwiaW1laSI6IjE5NkU3RDBCLTNENzItNDI1OC04NERELUZBMkQ1MDQ1OTdDNSIsImNvbWVfZnJvbSI6eyJ2ZXJzaW9uIjoiMi4wLjUifSwidmVyc2lvbiI6IjEuMy4wIiwicGFyYW0iOnsibWF4X2lkIjowLCJsYXRpdHVkZSI6IjIzLjExNjI1NSIsInR5cGUiOjAsImxvbmdpdHVkZSI6IjExMy4zMjI3NTkiLCJmaXJzdF9pZCI6MH0sImFwcF9uYW1lIjoidHdlbnR5X29uZV9pcGhvbmUiLCJzaWduX2NvZGUiOiIyZjYwYTNlZDI5NTY1ZDA0NjVkIn0%3D";
    param.requestMethod = WFNetworkingRequestMethodGet;
    return param;
}

- (WFFirstModel *)modelWithObject:(id)object {
    WFFirstModel *model = [[WFFirstModel alloc]initWithJasonModel:object];
    return model;
}

@end
