//
//  myViewController.m
//  testdoctor
//
//  Created by tarena on 15/10/9.
//  Copyright (c) 2015年 星海集团. All rights reserved.
//

#import "myViewController.h"
#import "LoinVC.h"
#import "iCarousel.h"
#import "wanwanViewController.h"
#import "musicVC.h"
#import "xiangshengVC.h"
#import "AllDataTableViewController.h"
#import "wenzhangViewController.h"
#import "xiaohuaViewController.h"
@interface myViewController ()<iCarouselDelegate, iCarouselDataSource>
@property(strong,nonatomic)LoinVC *lvc;
@property(nonatomic,strong) iCarousel *ic;
@end

@implementation myViewController
{ NSTimer *_timer;  }

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
   //   _ic.vertical = NO;
        
        // 改为翻页模式
        _ic.pagingEnabled = YES;
        //滚动速度
        _ic.scrollSpeed = 0;
    }
    return _ic;
}
- (void)viewDidLoad
{   [super viewDidLoad];
    [self setall];
    [self setbutton];
}

//播放按钮等其他的设置的
-(void)setbutton
{
    UIView *view =[[UIView alloc]init];
    //设置view的颜色
    view.backgroundColor =kRGBColor(209, 210, 182);
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(kWindowW, 110));
    }];
    view.layer.cornerRadius=10;
    
    
    FUIButton *buttonTest2 =[FUIButton buttonWithType:UIButtonTypeCustom];
    [buttonTest2 setTitle:@"旋转" forState:0];
    [factroy SetButtonUserFlatUIKit:buttonTest2];
    [self.view addSubview:buttonTest2];
    [buttonTest2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(80);
        make.bottom.mas_equalTo(-55);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    buttonTest2.cornerRadius = 25;
    [buttonTest2 bk_addEventHandler:^(id sender) {
        //自动滚动
        [self time];
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    FUIButton *buttonTest3 =[FUIButton buttonWithType:UIButtonTypeCustom];
    
    [buttonTest3 setTitle:@"停止" forState:0];
    [factroy SetButtonUserFlatUIKit:buttonTest3];
    [self.view addSubview:buttonTest3];
    [buttonTest3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-80);
        make.bottom.mas_equalTo(-55);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    buttonTest3.cornerRadius = 25 ;
    [buttonTest3 bk_addEventHandler:^(id sender) {
    [_timer invalidate];
        
    } forControlEvents:UIControlEventTouchUpInside];
    
    
    FUIButton *buttonTest4 =[FUIButton buttonWithType:UIButtonTypeCustom];
    [buttonTest4 setTitle:@"退出登录" forState:0];
    [factroy SetButtonUserFlatUIKit:buttonTest4];
    [self.view addSubview:buttonTest4];
    [buttonTest4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(65);
        make.size.mas_equalTo(CGSizeMake(70, 40));
    }];
    buttonTest4.cornerRadius = 10;
    [buttonTest4 bk_addEventHandler:^(id sender) {
        [self exit];
    } forControlEvents:UIControlEventTouchUpInside];
 
}

-(void)setall
{
    [_timer invalidate];
    [self.view addSubview:self.ic];
    self.view.backgroundColor =[UIColor grayColor];
    [self.ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
      }];
    [self time];

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
    return 7;
}
//问：每个Cell什么样
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    if (!view) {
        //这里x.y 是无作用的, 图片的宽高 300*500
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW/1.6, kWindowH/1.6)];
        FBShimmeringView *sv =[FBShimmeringView new];
        sv.backgroundColor =[UIColor orangeColor];
        [view addSubview:sv];
        view.layer.cornerRadius =20;
        sv.tag =100;
        [sv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.mas_equalTo(0);
            make.bottom.mas_equalTo(-1);
            make.top.mas_equalTo(100);
            // make.edges.mas_equalTo(0);
            
        }];
        UILabel *titleLb =[UILabel new];
        //使用一个数组来存储他们的名字的标题
        NSArray *names =@[@"古诗欣赏",@"新闻视频",@"开心相声",@"轻松音乐",@"游戏资讯",@"笑话短片",@"更多应用"];
        titleLb.textAlignment =1;
        [view addSubview:titleLb];
        [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
            make.right.left.mas_equalTo(0);
            make.height.mas_equalTo(100);
        }];
        titleLb.backgroundColor = kRGBColor(209, 210, 182);
        titleLb.text =names[index];
        
        
        UIImageView *imageView = [UIImageView new];
        imageView.tag = 200;
        imageView.contentMode = 2;
        sv.contentView = imageView;
        [view addSubview:imageView];
        view.clipsToBounds =YES;
        imageView.clipsToBounds =YES;
        imageView.backgroundColor =[UIColor orangeColor];
        view.backgroundColor =[UIColor orangeColor];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.left.mas_equalTo(0);
            make.bottom.mas_equalTo(-1);
            make.top.mas_equalTo(120);        }];
    }
    FBShimmeringView *sv =(FBShimmeringView *)[view viewWithTag:100];
    sv.shimmering =YES;
    UIImageView *imageView = (UIImageView *)[view viewWithTag:200];
    NSString *names =[NSString stringWithFormat:@"m%ld.png",index +1];
    imageView.image = [UIImage imageNamed:names];
    return view;
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    switch (index%7) {
        case 0:
            [self avc];
        break;
        case 1:
            [self wvc];
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
        case 5:
            [self xiaohua];
            break;
        case 6:
            [_timer invalidate];
            [[UIAlertView bk_showAlertViewWithTitle:@"不好意思暂时没有更多" message:@"让我们一起期待下一次更新吧" cancelButtonTitle:@"好" otherButtonTitles:@[@"取消"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
                [self time];
            }]show];
            break;
        
    }
}
-(void)music
{
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"D"];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController =vc;
}
-(void)wvc
{
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"B"];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController =vc;
   }
-(void)xvc
{
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"C"];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController =vc;
   }
-(void)avc
{
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"A"];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController =vc;
    
}
-(void)wanwan
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    wanwanViewController *vc =[wanwanViewController new];
    window.rootViewController =vc.sideMeun;
}
-(void)xiaohua
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
  xiaohuaViewController *vc =[xiaohuaViewController new];
  UINavigationController *na =[[UINavigationController alloc]initWithRootViewController:vc];
    window.rootViewController =na;
}
-(void)exit
{
    UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LVC"];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController =vc;
}
-(void)time
{
    //自动滚动
    _timer= [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
        [self.ic scrollToItemAtIndex:self.ic.currentItemIndex+1 animated:YES];
    } repeats:YES];

}

@end
