//
//  WFBaseModel.m
//  AFNetworking
//
//  Created by efun on 2019/4/9.
//

#import "WFBaseModel.h"
#import "YYModel.h"


@implementation WFBaseModel
- (instancetype)initWithJasonModel:(id)object {
    self = [super init];
    if (self) {
        self = [[self class] yy_modelWithJSON:object];
    }
    return self;
}

@end
