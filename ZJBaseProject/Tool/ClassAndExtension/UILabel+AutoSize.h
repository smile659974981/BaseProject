//
//  UILabel+AutoSize.h
//  Shopping
//
//  Created by 孑孓 on 2017/4/13.
//  Copyright © 2017年 hlhj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (AutoSize)

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;
+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;

@end
