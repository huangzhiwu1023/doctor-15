
//
//  gDViewController.m
//  BaseProject
//
//  Created by tarena on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
#import "gDViewController.h"
#import "VideoViewModel.h"
#import "iCarousel.h"

#import "wanwanViewController.h"
#import "musicVC.h"

#import "xiangshengVC.h"
#import "AllDataTableViewController.h"
#import "wenzhangViewController.h"

@interface gDViewController ()<iCarouselDelegate, iCarouselDataSource>
@property(nonatomic,strong) iCarousel *ic;
@property(nonatomic,strong) VideoViewModel *videoVM;
//存储图片名称
@property(nonatomic,strong) NSArray *imageNames;
@end
@implementation gDViewController
{ NSTimer *_timer;  }

- (VideoViewModel *)videoVM{
    if (!_videoVM) {
        _videoVM=[VideoViewModel new];
    }
    return _videoVM;
}

- (NSArray *)imageNames{
    if (!_imageNames) {
        //读取HeroSkins.bundle 文件夹内的所有文件名
        NSString *path = [[NSBundle mainBundle] pathForResource:@"HeroSkins" ofType:@"bundle"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        _imageNames=[fileManager subpathsAtPath:path];
    }
    return _imageNames;
}

- (iCarousel *)ic{
    if (!_ic) {
        _ic = [iCarousel new];
        //就是仿写的CollectionView
        _ic.delegate = self;
        _ic.dataSource = self;
        //修改3D显示模式, type是枚举类型，数值0 ~ 11
        _ic.type = 3;
        //自动展示, 0表示不滚动 越大滚动的越快
        _ic.autoscroll = 0;
        //改变为竖向展示
        //        _ic.vertical = NO;
        
        // 改为翻页模式
        _ic.pagingEnabled = NO;
        //滚动速度
        _ic.scrollSpeed = 0;
    }
    return _ic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
      [_timer invalidate];
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor =[UIColor grayColor];
    [self.ic addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(120, 30));
    }];
    [button bk_addEventHandler:^(id sender) {
        NSLog(@".......");
         
        //自动滚动
        _timer= [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [self.ic scrollToItemAtIndex:self.ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
        
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.ic];
    [self.ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    //自动滚动
    _timer= [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
        [self.ic scrollToItemAtIndex:self.ic.currentItemIndex+1 animated:YES];
    } repeats:YES];
}
#pragma mark - iCarousel
//添加循环滚动
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES; //type0的默认循环滚动模式是否
    }
    // 修改缝隙
    if (option == iCarouselOptionSpacing) {
        return value * 1.5;
    }
    // 取消后背的显示
    if (option == iCarouselOptionShowBackfaces) {
        return YES;
    }
    
    return value;
}


//问：有多少个Cell
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.imageNames.count;
}
//问：每个Cell什么样
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    if (!view) {
        //这里x.y 是无作用的, 图片的宽高 300*500
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW/1.5, kWindowH/1.5)];
        UIImageView *imageView = [UIImageView new];
        imageView.tag = 100;
        [view addSubview:imageView];
        imageView.backgroundColor = [UIColor orangeColor];
        view.backgroundColor =[UIColor orangeColor];
        imageView.contentMode = 2;
        view.clipsToBounds =YES;
        imageView.clipsToBounds =YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.mas_equalTo(0);
            make.bottom.mas_equalTo(-1);
            make.top.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
   // imageNames数组中存的是图片名，以为图片是jpg形式，只能用路径来读取。
    NSString *path=[[NSBundle mainBundle] pathForResource:@"HeroSkins" ofType:@"bundle"];
    path=[path stringByAppendingPathComponent:self.imageNames[index]];
    imageView.image = [UIImage imageWithContentsOfFile:path];
   // [imageView setImageWithURL:[self.videoVM iconURLForRow:index]];
   //   NSLog(@"%@",imageView);
    
    return view;
}




- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
  
     [_timer invalidate];
 // [self music];
    
    switch (index%5) {
        case 0:
            [self avc];
              NSLog(@"1");
            break;
        case 1:
            [self wvc];
              NSLog(@"2");
            break;
        case 2:
            [self xvc];
            break;
        case 3:
            [self music];
            break;
        case 4:
            [self wanwan];
            break;
           default:
            break;
               }
   
  NSLog(@"选择了第%ld张", index);
    
}
-(void)music
{
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"MVC"];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController =vc;
//    musicVC *vc =kVCFromSb(@"MVC", @"Main");
//    [self.navigationController pushViewController:vc animated:YES];
}
-(void)wvc
{
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"WVC"];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController =vc;
//    wenzhangViewController *vc =kVCFromSb(@"WVC", @"Main");
//    [self.navigationController pushViewController:vc animated:YES];
}
-(void)xvc
{
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"XVC"];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController =vc;
//    xiangshengVC *vc =kVCFromSb(@"XVC", @"Main");
//    [self.navigationController pushViewController:vc animated:YES];
}
-(void)avc
{
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"AVC"];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController =vc;
//    AllDataTableViewController *vc =kVCFromSb(@"AVC", @"Main");
//    [self.navigationController pushViewController:vc animated:YES];
}
-(void)wanwan
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    wanwanViewController *vc =[wanwanViewController new];
    window.rootViewController =vc.sideMeun;
}

@end
