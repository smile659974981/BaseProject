//
//  OneViewController.m
//  ZJBaseProject
//
//  Created by 孑孓 on 2018/5/23.
//  Copyright © 2018年 孑孓. All rights reserved.
//

#import "OneViewController.h"
#import "FourViewController.h"

@interface OneViewController ()

@property(nonatomic, strong)MyRelativeLayout *rootLayout;
@property(nonatomic,strong)UIButton *pushBtn;
@property(nonatomic,strong)UILabel *messageLa;
@property(nonatomic,strong)UIView *line;

@end

@implementation OneViewController

-(UIButton *)pushBtn{
    if (!_pushBtn) {
        _pushBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _pushBtn.mySize = CGSizeMake(100, 100);
        _pushBtn.myCenter = self.rootLayout.myCenter;
        _pushBtn.layer.cornerRadius = 50;
        _pushBtn.layer.masksToBounds = YES;
        _pushBtn.backgroundColor = [UIColor blackColor];
        [_pushBtn addTarget:self action:@selector(pushBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _pushBtn;
}

-(UILabel *)messageLa{
    if (!_messageLa) {
        _messageLa = [[UILabel alloc] init];
        _messageLa.topPos.equalTo(self.pushBtn.bottomPos).offset(SYRealValue(20));
        _messageLa.myCenterX = _pushBtn.myCenterX;
        _messageLa.wrapContentSize = YES;
        _messageLa.font = [UIFont systemFontOfSize:18];
        _messageLa.backgroundColor = [UIColor cyanColor];
        _messageLa.textColor = [UIColor blackColor];
//        _messageLa.widthSize.max(10);
    }
    return _messageLa;
}

-(UIView *)line{
    if (!_line) {
        _line = [[UIView alloc] init];
        _line.myLeft = _line.myRight = SYRealValue(10);
        _line.myTop = SYRealValue(20);
        _line.myHeight = 25;
        _line.backgroundColor = [UIColor yellowColor];
    }
    return _line;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

#pragma mark: --- 创建视图
-(void)createUI{
    self.title = @"首页";
    self.hbd_barShadowHidden = YES;
//    [[BaseRequest defaultManager] sendRequestMethod:http serverUrl:<#(nonnull NSString *)#> apiPath:<#(nonnull NSString *)#> parameters:<#(nullable id)#> progress:<#^(NSProgress * _Nullable progress)progress#> success:<#^(BOOL isSuccess, id  _Nullable responseObject)success#> failure:<#^(NSString * _Nullable errorMessage)failure#>]
    
    self.rootLayout = [[MyRelativeLayout alloc] init];
//    self.rootLayout.leftPos.equalTo(@10).offset(SYRealValue(50));
//    self.rootLayout.topPos.equalTo(@SYRealValue(100));
//    self.rootLayout.widthSize.equalTo(@100);
//    self.rootLayout.heightSize.equalTo(@400);
    
    self.rootLayout.myTop = [AppConfigs getNavigationBarHeight];
    self.rootLayout.myHeight = SCREEN_H - [AppConfigs getNavigationBarHeight];
    self.rootLayout.myWidth = SCREEN_W;
    self.rootLayout.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.rootLayout];
    
    [self.rootLayout addSubview:self.pushBtn];
    [self.rootLayout addSubview:self.messageLa];
    self.messageLa.text = @"测试测试测试";
    [self.rootLayout addSubview:self.line];
}

-(void)pushBtnClick:(UIButton *)btn{
    FourViewController *VC = [[FourViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
