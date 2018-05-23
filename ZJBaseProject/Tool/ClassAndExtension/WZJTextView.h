//
//  WZJTextView.h
//  nuggetsEmpire_ios
//
//  Created by 孑孓 on 2017/6/9.
//  Copyright © 2017年 hlhj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZJTextView : UITextView

@property (copy, nonatomic, nullable) IBInspectable NSString *xx_placeholder;
@property (strong, nonatomic, nullable) IBInspectable UIColor *xx_placeholderColor;
@property (strong, nonatomic, nullable) UIFont *xx_placeholderFont;

@end
