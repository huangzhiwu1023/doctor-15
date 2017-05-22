//
//  AppDelegate.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "WelcomeVC.h"
#import "LoinVC.h"
#import <AVFoundation/AVFoundation.h>
#import "LeftViewController.h"
//导航栏题目的文字的大小
#define kNaviTiTleFontSize 24
//导航栏文字的颜色
#define kNaviTiTleColor  [UIColor colorWithRed:239/255.0 green:141/255.0 blue:119/255.0 alpha:1]

@interface AppDelegate ()
@property(nonatomic,strong)AVPlayer *palyer11;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self initializeWithApplication:application];
    [self welcome];
   // [self tuwan];
    
        return YES;
}
-(void)welcome
{
    //1.初始化windowjiemain
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    WelcomeVC *vc= [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateInitialViewController];
    LoinVC *lv =[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LVC"] ;
//#define kStoryboard(StoryboardName)     [UIStoryboard storyboardWithName:StoryboardName bundle:nil]
//    
//    //通过Storyboard ID 在对应Storyboard中获取场景对象
//#define kVCFromSb(VCID, SbName)     [[UIStoryboard storyboardWithName:SbName bundle:nil] instantiateViewControllerWithIdentifier:VCID]

    NSDictionary *infoDic = [[NSBundle mainBundle]infoDictionary];
    NSString *key = @"CFBundleShortVersionString";
    NSString *cuerentVersion = infoDic[key];
    NSString *runVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    if (runVersion == nil || ![runVersion isEqualToString:cuerentVersion]) {
        //欢迎界面
        //  NSLog(@"显示欢迎页，window根视图设置为欢迎界面控制器");
        self.window.rootViewController =vc;
        [[NSUserDefaults standardUserDefaults]setValue:cuerentVersion forKey:key];
        
    }
    else{
        //主界面.
        
        //   NSLog(@"显示主页面，window根视图设置为主界面控制器");
        
        self.window.rootViewController =lv;
        
    }
    //     [self play1];
    [self.window makeKeyAndVisible];

}

//window的懒加载
-(UIWindow *)window
{
    if (!_window) {
        _window =[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        [_window makeKeyAndVisible];
    }
    return _window;
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

-(void)tuwan
{
    self.window.rootViewController =self.sideMeun;
    //这里面就是一些简单的调用不能太。。，有的要在功能实现后要考虑代码如何编写可以更加的后期维护
    [self configGlobalUIStyle];//配置全局ui的样式
}
//抽屉的懒加载
-(RESideMenu *)sideMeun
{
    if (!_sideMeun) {
        _sideMeun =[[RESideMenu alloc]initWithContentViewController:[TuWanViewController standardTuWanNavi] leftMenuViewController:[LeftViewController new] rightMenuViewController:nil];
        //为侧边栏设置背景图
        _sideMeun.backgroundImage =[UIImage imageNamed:@"fbb03.jpg"];
        _window.rootViewController =_sideMeun;
    }
    return _sideMeun;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{}
-(void)play1
{
    //  本地音乐
    NSString *audioPath=[[NSBundle mainBundle] pathForResource:@"m"ofType:@"mp3"];
    NSURL *path1 = [NSURL fileURLWithPath:audioPath];
    
    self.palyer11=[AVPlayer playerWithURL:path1];
    [self.palyer11 play];
}

@end
