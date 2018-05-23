//
//  AppConfigs.h
//  ZJBaseProject
//
//  Created by 孑孓 on 2018/5/23.
//  Copyright © 2018年 孑孓. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppConfigs : NSObject

///修改登录状态
+ (void)setLoginState:(BOOL)state;
///获取登录状态
+ (BOOL)getLoginState;
///获取顶部导航栏高度
+ (CGFloat)getNavigationBarHeight;
///获取底部导航栏高度
+ (CGFloat)getTabBarHeight;
///获取状态栏高度
+ (CGFloat)getStatusBarHeight;
///
+ (CGFloat)getButtomHeight;
///获取当前视图
+(UIViewController *)getCurrentVC;


@end
