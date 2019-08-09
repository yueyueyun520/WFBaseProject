//
//  WFListModel.m
//  WFProject
//
//  Created by waddy on 2019/4/13.
//  Copyright © 2019 waddy. All rights reserved.
//

#import "WFListModel.h"

@implementation WFListModel

+ (NSArray *)modelPropertyWhitelist {
    return @[@"content",@"cover_img_url",@"cover_img_height",@"cover_img_width"];
}



@end
