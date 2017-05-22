//
//  Factory.m
//  BaseProject
//
//  Created by tarena on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "Factory.h"

@implementation Factory
//方法1.  /**向某个控制器上添加按钮*/
+(void)addMenuItemToVC:(UIViewController *)vc
{
    //6.
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
+(void)goback:(UIViewController*)vc
{

    FUIButton *b =[FUIButton new];
    b.frame =CGRectMake(0, 0, 80, 30);
    [b setTitle:@"返回主页" forState:0];
    [factroy SetButtonUserFlatUIKit:b];
    [b bk_addEventHandler:^(id sender) {
        UIViewController *vcc = [vc.storyboard instantiateViewControllerWithIdentifier:@"TBC"];
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


@end
