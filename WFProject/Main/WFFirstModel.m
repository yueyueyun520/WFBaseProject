//
//  WFFirstModel.m
//  WFProject
//
//  Created by efun on 2019/4/10.
//  Copyright © 2019 efun. All rights reserved.
//

#import "WFFirstModel.h"
#import "YYModel.h"
#import "WFListModel.h"

@implementation WFFirstModel

+ (NSArray *)modelPropertyWhitelist {
    return @[@"mood_title",@"mood_material_url",@"mood",@"list"];
}


+ (nullable NSDictionary<NSString *, id> *)modelContainerPropertyGenericClass{
    return @{@"list": [WFListModel class],
             };
}
@end
