//
//  WFTableViewCell.m
//  WFProject
//
//  Created by waddy on 2019/4/13.
//  Copyright © 2019 waddy. All rights reserved.
//

#import "WFTableViewCell.h"
#import "UIImageView+WebCache.h"

@interface WFTableViewCell()
@property (nonatomic, strong) UIImageView *coverImageView;
@property (nonatomic, strong) UILabel *label;
@end
@implementation WFTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.coverImageView = [[UIImageView alloc]init];
    self.coverImageView.frame = CGRectMake(5, 5, 70, 70);
    self.coverImageView.backgroundColor = [UIColor grayColor];
    self.coverImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.coverImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:self.coverImageView];
    
    self.label = [[UILabel alloc]init];
    self.label.frame = CGRectMake(CGRectGetMaxX(self.coverImageView.frame) + 10, 0, [UIScreen mainScreen].bounds.size.width - CGRectGetMaxX(self.coverImageView.frame) - 20, 80);
    self.label.font = [UIFont systemFontOfSize:15];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.label];
}

- (void)setModel:(WFListModel *)model {
    self.label.text = model.content;
    NSURL *url = [NSURL URLWithString:model.cover_img_url];
    [self.coverImageView sd_setImageWithURL:url];
}

@end
