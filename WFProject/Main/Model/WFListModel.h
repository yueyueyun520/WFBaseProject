//
//  WFListModel.h
//  WFProject
//
//  Created by waddy on 2019/4/13.
//  Copyright © 2019 waddy. All rights reserved.
//

#import "WFBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WFListModel : WFBaseModel
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *cover_img_url;
@property (nonatomic, assign) NSInteger cover_img_height;
@property (nonatomic, assign) NSInteger cover_img_width;

@end

NS_ASSUME_NONNULL_END
