//
//  WFRouterModel.h
//  WFRouter
//
//  Created by waddy on 2019/4/22.
//  Copyright © 2019 wyy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFRouterModel : NSObject
/**
 跳转URL  
 规则:@"WF://goto?type=go_webview&pid=100001&url=https://www.baidu.com"
 eg: @"WF://goto?type=go_inter_view&pid=100001&url=https://www.baidu.com"
     @"WF://goto?type=go_webview&pid=100001&url=https://www.baidu.com"
 */
@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) NSDictionary *otherParam;

@end

NS_ASSUME_NONNULL_END
