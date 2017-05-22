//
//  wanwanViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "wanwanViewController.h"
#import "LeftViewController.h"
//导航栏题目的文字的大小
#define kNaviTiTleFontSize 24
//导航栏文字的颜色
#define kNaviTiTleColor  [UIColor colorWithRed:239/255.0 green:141/255.0 blue:119/255.0 alpha:1]
@interface wanwanViewController ()

@end

@implementation wanwanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

/** 2.配置全局ui的样式 */
-(void)configGlobalUIStyle
{
    /**导航栏不透明*/
    [[UINavigationBar appearance]setTranslucent:NO];
    /** 设置导航栏背景图 */
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    /**4.配置导航栏题目的样式 */
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont flatFontOfSize:kNaviTiTleFontSize],NSForegroundColorAttributeName:kNaviTiTleColor}];
}
-(RESideMenu *)sideMeun
{
    if (!_sideMeun) {
        _sideMeun =[[RESideMenu alloc]initWithContentViewController:[TuWanViewController standardTuWanNavi] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        //为侧边栏设置背景图
        _sideMeun.backgroundImage =[UIImage imageNamed:@"fbb03.jpg"];
//        _window.rootViewController =_sideMeun;
    }
    return _sideMeun;
}

@end
