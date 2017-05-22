//
//  TuWanViewController.m
//  BaseProject
//
//  Created by jiyingxin on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanViewController.h"
#import "TuWanViewModel.h"
#import "TuWanTableViewController.h"
#import "myViewController.h"
@interface TuWanViewController ()

@end

@implementation TuWanViewController

+ (UINavigationController *)standardTuWanNavi{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        TuWanViewController *vc = [[TuWanViewController alloc]initWithViewControllerClasses:[self viewControllerClass] andTheirTitles:[self itemNames]];//使用这个方法一个一的摆上区了
        //例如设置的第一个控制器的每个的属性的值 vc setvalue :[values[0] forkey :keys[0]]
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}

/**提供vc 对应的key值的数组 */
+(NSArray *)vcKeys
{
    NSMutableArray *arr =[NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:@"tuwanType"];//返回么一控制器对应的类型
    }
    return [arr copy];
}
/** */
+(NSArray *)vcValues
{
    NSMutableArray *arr =[NSMutableArray new];
    for (int i = 0; i < [self itemNames].count; i ++) {
        //数值上的 是每个vc的tuwantype 的枚举的值 切好和i值相同
        [arr addObject:@(i)];
    }

       
       return arr;
}



/**提供题目数组*/
+(NSArray *)itemNames
{
    return @[@"头条",@"独家",@"黑暗3",@"魔兽",@"风暴",@"炉石",@"星际2",@"守望",@"图片",@"视频",@"攻略",@"幻化",@"趣闻",@"cos",@"美女"];
}
/**提供一个对应的控制器的类型的，题目和类型的数量必须的一致*/
+(NSArray *)viewControllerClass
{
    NSMutableArray *arr =[NSMutableArray new];
    for (id obj in [self itemNames]) {
        [arr addObject:[TuWanTableViewController class]];//返回么一控制器对应的类型
    }
    return [arr copy];
}


- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.view.backgroundColor = [UIColor greenSeaColor];
    self.title = @"游戏资讯";
  
    FUIButton *b =[FUIButton new];
    b.frame =CGRectMake(0, 0, 80, 30);
    [b setTitle:@"返回主页" forState:0];
    [factroy SetButtonUserFlatUIKit:b];
    [b bk_addEventHandler:^(id sender) {
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MMVC"];
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window.rootViewController =vc;
    } forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:b];
    
}


@end
