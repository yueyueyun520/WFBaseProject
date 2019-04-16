//
//  WFTableViewCell.h
//  WFProject
//
//  Created by efun on 2019/4/13.
//  Copyright © 2019 efun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WFListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WFTableViewCell : UITableViewCell
- (void)setModel:(WFListModel *)model;
@end

NS_ASSUME_NONNULL_END
