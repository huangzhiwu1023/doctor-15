//
//  UIColor+Extension.m
//  我的微信
//
//  Created by tarena on 15/9/18.
//  Copyright (c) 2015年 星海集团. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)
//十进制的颜色
+(UIColor *)colorWith255Red:(NSUInteger)red green:(NSUInteger)green bule:(NSUInteger)bule alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.0 green:green /255.0 blue:bule/255.0 alpha:alpha];

}
//十六进制的颜色的
+(UIColor *)colorWithHex:(long)hex andAlpha:(CGFloat)alpha
{
//hex:0x3A5B6C
    //一般需要留下谁就用与，全部留下就用或
    float red = ((float)(hex & (0xFF0000)>>16)/255.0);
    float green = ((float)(hex & (0x00FF00)>>8)/255.0);
    float bule = ((float)(hex & (0x0000FF))/255.0);
  return  [UIColor colorWithRed:red green:green blue:bule alpha:alpha];

}

@end
