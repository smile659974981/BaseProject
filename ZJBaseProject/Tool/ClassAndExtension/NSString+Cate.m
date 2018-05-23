//
//  NSString+Cate.m
//  ZJBaseProject
//
//  Created by 孑孓 on 2018/5/23.
//  Copyright © 2018年 孑孓. All rights reserved.
//

#import "NSString+Cate.h"

@implementation NSString (Cate)

+(NSString *)priceFormateAny:(id)price{
    float floatStr = [price floatValue];
    NSString *str = [NSString stringWithFormat:@"%.2f", floatStr];
    return str;
}

@end
