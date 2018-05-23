//
//  RegularJudge.h
//  GuanZhou
//
//  Created by 孑孓 on 2017/7/11.
//  Copyright © 2017年 王志杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegularJudge : UIViewController

#pragma 正则匹配手机号
+ (BOOL)checkTelNumber:(NSString *) telNumber;
#pragma 正则匹配用户密码6-18位数字和字母组合
+ (BOOL)checkPassword:(NSString *) password;
#pragma 正则匹配用户姓名,20位的中文或英文
+ (BOOL)checkUserName : (NSString *) userName;
#pragma 正则匹配用户身份证号
+ (BOOL)checkUserIdCard: (NSString *) idCard;
#pragma 正则匹配URL
+ (BOOL)checkURL : (NSString *) url;
#pragma 正则匹配银行卡
+(BOOL)checkIDCardNumber:(NSString *)value;

@end
