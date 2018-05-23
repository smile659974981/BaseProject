//
//  AppDelegate+Config.m
//  ZJBaseProject
//
//  Created by 孑孓 on 2018/5/23.
//  Copyright © 2018年 孑孓. All rights reserved.
//

#import "AppDelegate+Config.h"
#import "IQKeyboardManager.h"

@implementation AppDelegate (Config)

+ (void)initWindow:(UIWindow *)window{
  
}

+(void)initIQKeyboard{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;// 控制整个功能是否启用。
    manager.shouldResignOnTouchOutside = YES;// 控制点击背景是否收起键盘。
    manager.shouldToolbarUsesTextFieldTintColor = YES;//控制键盘上的工具条文字颜色
    manager.enableAutoToolbar = NO;//控制是否显示键盘上的工具条
}

@end
