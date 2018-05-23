//
//  MyTextField.m
//  DZWork
//
//  Created by 孑孓 on 2017/3/14.
//  Copyright © 2017年 smile. All rights reserved.
//

#import "MyTextField.h"

@implementation MyTextField

- (CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+SYRealValue(30), bounds.origin.y, bounds.size.width - SYRealValue(40), bounds.size.height);
    return inset;
}


-(CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+SYRealValue(30), bounds.origin.y, bounds.size.width - SYRealValue(40), bounds.size.height);
    return inset;
}

-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    
    CGRect inset = CGRectMake(bounds.origin.x+SYRealValue(30), bounds.origin.y, bounds.size.width, bounds.size.height);
    return inset;
}


@end
