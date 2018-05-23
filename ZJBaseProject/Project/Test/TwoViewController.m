//
//  TwoViewController.m
//  ZJBaseProject
//
//  Created by 孑孓 on 2018/5/23.
//  Copyright © 2018年 孑孓. All rights reserved.
//

#import "TwoViewController.h"
#import "FourViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

#pragma mark: --- 创建视图
-(void)createUI{
    self.title = @"我的";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    FourViewController *VC = [[FourViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
