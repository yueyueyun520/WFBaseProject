//
//  WFViewController.m
//  WFProject
//
//  Created by waddy on 2019/4/9.
//  Copyright © 2019 waddy. All rights reserved.
//

#import "WFViewController.h"
#import "WFFirstViewModel.h"
#import "WFFirstModel.h"
#import "WFListModel.h"
#import "WFTableViewCell.h"
#import "YYModel.h"
#import "WFAlgorithmClass.h"



@interface WFViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) WFFirstViewModel *viewModel;
@property (nonatomic, strong) WFFirstModel *model;
@property (nonatomic, strong) NSArray *listArray;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *saveBtn;
@end

@implementation WFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(40, 50, 80, 40);
    [btn setTitle:@"下载" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor greenColor]];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.saveBtn.frame = CGRectMake(150, 50, 80, 40);
    [self.saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [self.saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.saveBtn setBackgroundColor:[UIColor greenColor]];
    self.saveBtn.layer.masksToBounds = YES;
    self.saveBtn.layer.cornerRadius = 5;
    self.saveBtn.enabled = NO;
    [self.view addSubview:self.saveBtn];
    [self.saveBtn addTarget:self action:@selector(savebuttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.tableView];
    
    //字符串反转
    char cha[] = "hello-waddy";
    char *reault = [WFAlgorithmClass reverseWithString:cha];
    NSLog(@"反转后：%s",reault);
    
    //有序数组合并
    NSArray *arr1 = @[@"1",@"3",@"4",@"7",@"9",@"21"];
    NSArray *arr2 = @[@"3",@"3",@"4",@"12",@"16",@"21",@"78",@"90"];
    NSMutableArray *results = [WFAlgorithmClass orderedArrayMergingWithArrayA:arr1 arrayB:arr2];
    NSLog(@"合并后：%@",results);
    
    //在字符串中找到第一个只出现一次的字符
    char str[] = "hsbaswhhhdds";
    char re = [WFAlgorithmClass firstAppearOnce:str];
    NSLog(@"第一个出现：%c",re);
    
    
    
    if (WFAnother) {} //another target
    
}

- (void)buttonClick {
    [self loadData];
}

- (void)savebuttonClick {
    //保存数据
    [self selectData];
}

- (void)loadData {
    __weak typeof(self) weakSelf = self;
    [self.viewModel reloadModelDataSucces:^(NSArray<WFFirstModel *> * _Nonnull modelArray) {
        if (modelArray.count > 0) {
            weakSelf.model = [modelArray firstObject];
            weakSelf.listArray = weakSelf.model.list;
            if (weakSelf.listArray.count> 0) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    weakSelf.saveBtn.enabled = YES;
                    [weakSelf.tableView reloadData];
                });
            }
            [weakSelf saveModel:weakSelf.model];
        }
    } fail:^(NSError * _Nonnull error) {
        
    }];
}

- (void)saveModel:(WFFirstModel *)model {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSDictionary *jason = [model yy_modelToJSONObject]; //model转成Jason
        [weakSelf.viewModel setCacheWithJasonArray:@[jason] cacheKey:@"WFFirstViewModelListModel"];
    });
}

//查询
- (void)selectData {
  NSArray *jasonArray = [self.viewModel cacheJasonArrayWithCacheKey:@"WFFirstViewModelListModel" saveMostModelArrayNumber:3];
    for (NSDictionary *jason in jasonArray) {
        WFFirstModel *model = [[WFFirstModel class] yy_modelWithJSON:jason];
        NSLog(@"个数：%zd",model.list.count);
    }
    
}

#pragma mark - tableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WFTableViewCell class])];
    WFListModel *listModel = self.listArray[indexPath.row];
    [cell setModel:listModel];

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
        [_tableView registerClass:[WFTableViewCell class] forCellReuseIdentifier:NSStringFromClass([WFTableViewCell class])];
    }
    return _tableView;
}
@end
