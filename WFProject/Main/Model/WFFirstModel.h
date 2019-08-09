//
//  WFFirstModel.h
//  WFProject
//
//  Created by waddy on 2019/4/10.
//  Copyright © 2019 waddy. All rights reserved.
//

#import "WFBaseModel.h"


NS_ASSUME_NONNULL_BEGIN
@class WFListModel;
@interface WFFirstModel : WFBaseModel

@property (nonatomic, copy) NSString *mood_title;
@property (nonatomic, copy) NSString *mood_material_url;
@property (nonatomic, strong) NSDictionary *mood;
@property (nonatomic, strong) NSArray<WFListModel *> *list;
@end

NS_ASSUME_NONNULL_END
