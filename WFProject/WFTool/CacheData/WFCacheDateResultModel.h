//
//  WFCacheDateResultModel.h
//  WFProject
//
//  Created by waddy on 2019/4/15.
//  Copyright © 2019 waddy. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WFCacheDateResultModel : NSObject
@property (nonatomic, assign) NSInteger resultId;
@property (nonatomic, strong) NSData *jasonData;
@end

NS_ASSUME_NONNULL_END
