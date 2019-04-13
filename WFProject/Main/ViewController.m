//
//  ViewController.m
//  WFProject
//
//  Created by efun on 2019/4/9.
//  Copyright © 2019 efun. All rights reserved.
//

#import "ViewController.h"
#import "WFFirstViewModel.h"
#import "WFFirstModel.h"
#import "WFListModel.h"
#import "UIImageView+WebCache.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) WFFirstViewModel *viewModel;
@property (nonatomic, strong) WFFirstModel *model;
@property (nonatomic, strong) NSArray *listArray;

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(150, 50, 100, 40);
    [btn setTitle:@"下载" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor greenColor]];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.tableView];
    
}

- (void)buttonClick {
    [self loadData];

}

- (void)loadData {
    __weak typeof(self) weakSelf = self;
    [self.viewModel reloadModelDataSucces:^(NSArray<WFFirstModel *> * _Nonnull modelArray) {
        if (modelArray.count > 0) {
            weakSelf.model = [modelArray firstObject];
            weakSelf.listArray = weakSelf.model.list;
            if (weakSelf.listArray.count> 0) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakSelf.tableView reloadData];
                });
            }
        }
    } fail:^(NSError * _Nonnull error) {
        
    }];
}

#pragma mark - tableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstCellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"firstCellID"];
    }
    WFListModel *listModel = self.listArray[indexPath.row];
    cell.textLabel.text = listModel.content;
    NSURL *url = [NSURL URLWithString:listModel.cover_img_url];
    [cell.imageView sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        cell.imageView.image =image;
    }];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}

- (WFFirstViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[WFFirstViewModel alloc]init];
    }
    return _viewModel;
}

- (UITableView *)tableView {
    if (!_tableView) {
        CGRect rect = CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 150);
        _tableView = [[UITableView alloc]initWithFrame:rect style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}
@end
