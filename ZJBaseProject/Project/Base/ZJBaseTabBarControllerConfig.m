//
//  ZJBaseTabBarControllerConfig.m
//  ZJBaseProject
//
//  Created by 孑孓 on 2018/5/23.
//  Copyright © 2018年 孑孓. All rights reserved.
//

#import "ZJBaseTabBarControllerConfig.h"
#import <UIKit/UIKit.h>

@interface ZJBaseNavigationController : HBDNavigationController
@end

@implementation ZJBaseNavigationController
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIImage *backImg = [[UIImage imageNamed:@"ic_back_black.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:backImg style:UIBarButtonItemStylePlain target:self action:@selector(backBtnClick:)];
        viewController.navigationItem.leftBarButtonItem = backItem;
    }
    [super pushViewController:viewController animated:animated];
}

-(void)backBtnClick:(UIButton *)btn{
    [super popViewControllerAnimated:YES];
}


@end

#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "UIColor+ColorChange.h"

@interface ZJBaseTabBarControllerConfig()<UITabBarControllerDelegate>

@property (nonatomic, readwrite, strong) CYLTabBarController *tabBarController;

@end

@implementation ZJBaseTabBarControllerConfig


- (CYLTabBarController *)tabBarController {
    if (_tabBarController == nil) {
        UIEdgeInsets imageInsets = UIEdgeInsetsZero;//UIEdgeInsetsMake(4.5, 0, -4.5, 0);
        UIOffset titlePositionAdjustment = UIOffsetZero;//UIOffsetMake(0, MAXFLOAT);
        
        CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers
                                                                                   tabBarItemsAttributes:self.tabBarItemsAttributesForController
                                                                                             imageInsets:imageInsets
                                                                                 titlePositionAdjustment:titlePositionAdjustment
                                                                                                 context:nil
                                                 ];
        [self customizeTabBarAppearance:tabBarController];
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}

- (NSArray *)viewControllers {
    OneViewController *oneVC = [[OneViewController alloc] init];
    TwoViewController *twoVC = [[TwoViewController alloc] init];
    ThreeViewController *threeVC = [[ThreeViewController alloc] init];
    FourViewController *fourVC = [[FourViewController alloc] init];
    
    UIViewController *oneNav = [[ZJBaseNavigationController alloc] initWithRootViewController:oneVC];
    UIViewController *twoNav = [[ZJBaseNavigationController alloc] initWithRootViewController:twoVC];
    UIViewController *threeNav = [[ZJBaseNavigationController alloc] initWithRootViewController:threeVC];
    UIViewController *fourNav = [[ZJBaseNavigationController alloc] initWithRootViewController:fourVC];
    
    NSArray *viewControllers = @[
                                 oneNav,
                                 twoNav,
                                 threeNav,
                                 fourNav
                                 ];
    return viewControllers;
}

- (NSArray *)tabBarItemsAttributesForController {
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"首页",
                            CYLTabBarItemImage : @"ic_home.png",
                            CYLTabBarItemSelectedImage : @"ic_home_choose.png",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"发现",
                            CYLTabBarItemImage : @"ic_foot.png",
                            CYLTabBarItemSelectedImage : @"ic_foot_choose.png",
                            };
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"发布需求",
                            CYLTabBarItemImage : @"ic_form.png",
                            CYLTabBarItemSelectedImage : @"ic_form_choose.png",
                            };
    NSDictionary *dict4 = @{
                            CYLTabBarItemTitle : @"我的",
                            CYLTabBarItemImage : @"ic_own.png",
                            CYLTabBarItemSelectedImage : @"ic_own_choose.png",
                            };
    
    NSArray *tabBarItemsAttributes = @[ dict1, dict2, dict3, dict4];
    return tabBarItemsAttributes;
}

- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    // Customize UITabBar height
    // 自定义 TabBar 高度
//    tabBarController.tabBarHeight = CYL_IS_IPHONE_X ? 65 : 49;
    tabBarController.tabBarHeight = CYL_IS_IPHONE_X ? 83 : 49;

    
    // set the text color for unselected state
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // set the text color for selected state
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // Set the dark color to selected tab (the dimmed background)
    // TabBarItem选中后的背景颜色
    // [self customizeTabBarSelectionIndicatorImage];
    
    // update TabBar when TabBarItem width did update
    // If your app need support UIDeviceOrientationLandscapeLeft or UIDeviceOrientationLandscapeRight，
    // remove the comment '//'
    // 如果你的App需要支持横竖屏，请使用该方法移除注释 '//'
    // [self updateTabBarCustomizationWhenTabBarItemWidthDidUpdate];
    
    // set the bar shadow image
    // This shadow image attribute is ignored if the tab bar does not also have a custom background image.So at least set somthing.
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundColor:[UIColor whiteColor]];
    //    [[UITabBar appearance] setShadowImage:[UIImage imageNamed:@"tapbar_top_line"]];
    
    // set the bar background image
    // 设置背景图片
    //    UITabBar *tabBarAppearance = [UITabBar appearance];
    
    //FIXED: #196
    //    UIImage *tabBarBackgroundImage = [UIImage imageNamed:@"tab_bar"];
    //    UIImage *scanedTabBarBackgroundImage = [[self class] scaleImage:tabBarBackgroundImage toScale:1.0];
    //     [tabBarAppearance setBackgroundImage:scanedTabBarBackgroundImage];
    
    // remove the bar system shadow image
    // 去除 TabBar 自带的顶部阴影
    // iOS10 后 需要使用 `-[CYLTabBarController hideTabBadgeBackgroundSeparator]` 见 AppDelegate 类中的演示;
//    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
}


@end
