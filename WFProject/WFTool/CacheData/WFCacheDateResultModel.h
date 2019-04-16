//
//  WFCacheDateResultModel.h
//  WFProject
//
//  Created by efun on 2019/4/15.
//  Copyright © 2019 efun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFCacheDateResultModel : NSObject
@property (nonatomic, assign) NSInteger resultId;
@property (nonatomic, strong) NSData *jasonData;
@end

NS_ASSUME_NONNULL_END
