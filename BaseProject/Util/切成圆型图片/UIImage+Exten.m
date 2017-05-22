//
//  UIImage+Exten.m
//  切头像
//
//  Created by tarena on 15/9/22.
//  Copyright (c) 2015年 星海集团. All rights reserved.
//

#import "UIImage+Exten.h"

@implementation UIImage (Exten)
+(instancetype)imageWithName:(NSString *)name border:(CGFloat)border borderColor:(UIColor *)color
{
    //要想画谁就要加载旧的图片
    UIImage *oldImage = [UIImage imageNamed:name];
    //新的画布的尺寸
    CGFloat imageWidth = oldImage.size.width + 2* border;
    CGFloat imageHeight = oldImage.size.height + 2*border;
    //设置与大圆相切的正方形的边
    CGFloat circleW = MIN(imageWidth, imageHeight);
    
    //开启图片上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(circleW, circleW), NO, 0.0);
    
    //画大的实心的圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, circleW, circleW)];
    //设置颜色
    [color setFill];
    //绘制
    [path fill];
     //先画的是不能剪裁的
    
    CGRect smallCircle = CGRectMake(border, border, circleW -2 *border, circleW -2*border);
    //绘制小圆点路径
    UIBezierPath *smallpath = [UIBezierPath bezierPathWithOvalInRect:smallCircle];
    [smallpath addClip];//小圆以外的都不能画
    
    //画原有的旧图
    [oldImage drawInRect:smallCircle];
    
    UIImage *newimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newimage;
    
    
    


}

@end
