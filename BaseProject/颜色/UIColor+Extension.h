//
//  UIColor+Extension.h
//  我的微信
//
//  Created by tarena on 15/9/18.
//  Copyright (c) 2015年 星海集团. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)
+(UIColor *)colorWith255Red:(NSUInteger)red green:(NSUInteger)green bule:(NSUInteger)bule alpha:(CGFloat)alpha;

+(UIColor *)colorWithHex:(long)hex andAlpha:(CGFloat)alpha;
@end
