//
//  AppConfigs.m
//  ZJBaseProject
//
//  Created by 孑孓 on 2018/5/23.
//  Copyright © 2018年 孑孓. All rights reserved.
//

#import "AppConfigs.h"

static NSString *const loginSate = @"loginState";

@implementation AppConfigs

+ (void)setLoginState:(BOOL)state{
    [[NSUserDefaults standardUserDefaults] setBool:state forKey:loginSate];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)getLoginState{
    return [[NSUserDefaults standardUserDefaults] boolForKey:loginSate];
}
+ (BOOL)iPhoneX{
    return [UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO;
}

+ (CGFloat)getNavigationBarHeight{
    if ([self iPhoneX]) {
        return 88.0;
    } else {
        return 64.0;
    }
}
+ (CGFloat)getTabBarHeight{
    if ([self iPhoneX]) {
        return 83.0;
    } else {
        return 49.0;
    }
}
+ (CGFloat)getStatusBarHeight{
    if ([self iPhoneX]) {
        return 44.0;
    } else {
        return 20.0;
    }
}
+ (CGFloat)getButtomHeight{
    if ([self iPhoneX]) {
        return 34.0;
    } else {
        return 0.0;
    }
}

+(UIViewController *)getCurrentVC{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    return currentVC;
}

+(UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC{
    UIViewController *currentVC;
    if ([rootVC presentedViewController]) {
        rootVC = [rootVC presentedViewController];
    }
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        currentVC = rootVC;
    }
    return currentVC;
}
@end
