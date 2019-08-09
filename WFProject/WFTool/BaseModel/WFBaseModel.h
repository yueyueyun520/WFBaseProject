//
//  WFBaseModel.h
//  AFNetworking
//
//  Created by waddy on 2019/4/9.
//  model要继承于此基类

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFBaseModel : NSObject
- (instancetype)initWithJasonModel:(id)object;

@end

NS_ASSUME_NONNULL_END
