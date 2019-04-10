//
//  ViewController.m
//  WFProject
//
//  Created by efun on 2019/4/9.
//  Copyright © 2019 efun. All rights reserved.
//

#import "ViewController.h"
#import "WFFirstViewModel.h"
@interface ViewController ()
@property (nonatomic, strong) WFFirstViewModel *viewModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(150, 150, 100, 40);
    [btn setTitle:@"下载" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor greenColor]];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)buttonClick {
    [self loadData];

}

- (void)loadData {
    
    [self.viewModel reloadModelDataSucces:^(NSArray<WFBaseModel *> * _Nonnull modelArray) {
        NSLog(@"%@",modelArray);
    } fail:^(NSError * _Nonnull error) {
        
    }];
}

- (WFFirstViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[WFFirstViewModel alloc]init];
    }
    return _viewModel;
}
@end
