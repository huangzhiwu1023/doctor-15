//
//  MyCodeTool.m
//  生活百库
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MyCodeTool.h"
@implementation MyCodeTool
+(void)goback:(UIViewController*)vc ID:(NSString *)ID
{
    FUIButton *b =[FUIButton new];
    b.frame =CGRectMake(0, 0, 80, 30);
    [b setTitle:@"返回主页" forState:0];
    [factroy SetButtonUserFlatUIKit:b];
    [b bk_addEventHandler:^(id sender) {
        UIViewController *vcc = [vc.storyboard instantiateViewControllerWithIdentifier:ID];
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window.rootViewController =vcc;
    } forControlEvents:UIControlEventTouchUpInside];
    vc.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:b];
}
+(void)SetButtonUserFlatUIKit:(FUIButton *)button
{
    button.buttonColor = [UIColor turquoiseColor];
    button.shadowColor = [UIColor greenSeaColor];
    button.shadowHeight = 3.0f;
    button.cornerRadius = 6.0f;
    button.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [button setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
}
+(void)SetTextFieldUserFlatUIKit:(FUITextField *)TextField
{
    TextField.font = [UIFont flatFontOfSize:16];
    TextField.backgroundColor = [UIColor clearColor];
    TextField.edgeInsets = UIEdgeInsetsMake(4.0f, 15.0f, 4.0f, 15.0f);
    TextField.textFieldColor = [UIColor whiteColor];
    TextField.borderColor = [UIColor turquoiseColor];
    TextField.borderWidth = 2.0f;
    TextField.cornerRadius = 3.0f;
}
//方法1.  /**向某个控制器上添加按钮*/
+(void)addMenuItemToVC:(UIViewController *)vc
{
    UIButton *btn =[UIButton buttonWithType:0];
    //    [btn setBackgroundImage:[UIImage imageNamed:@"zone_post_red"] forState:UIControlStateNormal];
    //    [btn setBackgroundImage:[UIImage imageNamed:@"zone_post_n"] forState:UIControlStateHighlighted];
    btn.frame =CGRectMake(0, 0, 30, 30);
    
    [btn bk_addEventHandler:^(id sender) {
        [vc.sideMenuViewController presentLeftMenuViewController];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuItem =[[UIBarButtonItem alloc]initWithCustomView:btn];
    //self.navigationItem.leftBarButtonItem = menuItem;
    //6s. 使用弹簧按钮缩小菜单按钮的和边缘的距离
    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width =-10;
    vc.navigationItem.leftBarButtonItems =@[spaceItem,menuItem];
    
}
+(void)addBackItemToVC:(UIViewController *)vc
{
    UIButton *btn =[UIButton buttonWithType:0];
    
    //    [btn setImage:[UIImage imageNamed:@"btn_back_n"] forState:UIControlStateNormal];
    //    [btn setImage:[UIImage imageNamed:@"btn_back_h"] forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor orangeColor] forState:0];
    btn.frame =CGRectMake(0, 0, 45, 44);
    [btn setTitle:@"返回" forState:0];
    [btn bk_addEventHandler:^(id sender) {
        [vc.navigationController popToRootViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *menuItem =[[UIBarButtonItem alloc]initWithCustomView:btn];
    //self.navigationItem.leftBarButtonItem = menuItem;
    //6s. 使用弹簧按钮缩小菜单按钮的和边缘的距离
    UIBarButtonItem *spaceItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width =-16;
    vc.navigationItem.leftBarButtonItems =@[spaceItem,menuItem];
    
}
+(void)setImage:(UIImageView *)imageview vc:(UIViewController *)vc
{
    imageview =[UIImageView new];
    [vc.view addSubview:imageview];
    imageview.contentMode =2;
    [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    vc.view.clipsToBounds =YES;
    
}
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
+(UIImage *)imageWithName:(NSString *)name border:(CGFloat)border borderColor:(UIColor *)color
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
