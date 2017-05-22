//
//  musicVC.m
//  BaseProject
//
//  Created by tarena on 15/10/30.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "musicVC.h"
#import <AVFoundation/AVFoundation.h>
#import "RankListViewController.h"

#define angleToRadian(x)(x/180.0*M_PI)
@interface musicVC ()
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)CADisplayLink *link;
@property(nonatomic,assign)BOOL ispaly;
@property(nonatomic,strong) AVPlayer *player;//播放音乐
@property(nonatomic,strong) AVPlayerLayer *layer;//播放视频
@property(nonatomic,strong) AVAudioPlayer *player2;

@property(nonatomic,strong)UILabel *musicTitleLb;



@end

@implementation musicVC

-(UILabel *)musicTitleLb
{
    if (_musicTitleLb ==nil) {
        _musicTitleLb =[UILabel new];
        _musicTitleLb.textColor =[UIColor orangeColor];
        _musicTitleLb.font =[UIFont systemFontOfSize:20];
    }
    return _musicTitleLb;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory goback:self];
    [self setyuanpan];//圆盘的转动
    [self keyFrameAnimation];//苹果的转动
    [self setbutton];//按钮的相关的设置
    
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
    
    FUIButton *buttonTest =[FUIButton buttonWithType:UIButtonTypeCustom];
    [buttonTest setTitle:@"播放" forState:0];
   
    [factroy SetButtonUserFlatUIKit:buttonTest];
    [self.view addSubview:buttonTest];
    [buttonTest mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-30);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    buttonTest.cornerRadius = 35;
    [buttonTest bk_addEventHandler:^(id sender) {
        self.link.paused =NO;
        [self setTitleText1];//view的设置
        //  本地音乐
        NSURL *audioPath=[[NSBundle mainBundle]URLForResource:@"活着" withExtension:@"mp3"];
        self.player=[AVPlayer playerWithURL:audioPath];
        [self.player play];
    } forControlEvents:UIControlEventTouchUpInside];
    
    FUIButton *buttonTest2 =[FUIButton buttonWithType:UIButtonTypeCustom];
    [buttonTest2 setTitle:@"继续" forState:0];
    [factroy SetButtonUserFlatUIKit:buttonTest2];
    [self.view addSubview:buttonTest2];
    [buttonTest2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.bottom.mas_equalTo(-30);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    buttonTest2.cornerRadius = 35;
    [buttonTest2 bk_addEventHandler:^(id sender) {
        self.link.paused =NO;
        [self.player play];
    } forControlEvents:UIControlEventTouchUpInside];
    FUIButton *buttonTest3 =[FUIButton buttonWithType:UIButtonTypeCustom];
    [buttonTest3 setTitle:@"暂停" forState:0];
    
    [factroy SetButtonUserFlatUIKit:buttonTest3];
    [self.view addSubview:buttonTest3];
    [buttonTest3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-30);
        make.bottom.mas_equalTo(-30);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    buttonTest3.cornerRadius = 35 ;
    [buttonTest3 bk_addEventHandler:^(id sender) {
        self.link.paused =YES;
        [self.player pause];
    } forControlEvents:UIControlEventTouchUpInside];
    FUIButton *buttonTest4 =[FUIButton buttonWithType:UIButtonTypeCustom];
    [buttonTest4 setTitle:@"更多音乐" forState:0];
    
    [factroy SetButtonUserFlatUIKit:buttonTest4];
    [self.view addSubview:buttonTest4];
    [buttonTest4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-170);
        make.size.mas_equalTo(CGSizeMake(70, 70));
    }];
    buttonTest4.cornerRadius = 35;
    [buttonTest4 bk_addEventHandler:^(id sender) {
        
        RankListViewController *vc =[[RankListViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
        //[UIAlertView bk_showAlertViewWithTitle:@"此功能尚未开通" message:@"敬请期待吧！！" cancelButtonTitle:@"好" otherButtonTitles:@[@"取消"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
      //  }];
    
    } forControlEvents:UIControlEventTouchUpInside];
}
//转动的圆盘的
-(void)setyuanpan
{
    UIImageView *imageview = [[UIImageView alloc]init];
    imageview.image = [UIImage imageNamed:@"muc"];
    imageview.layer.bounds= CGRectMake(0, 0, 240, 240);
    self.imageView.transform  = CGAffineTransformScale(self.imageView.transform, 0.5, 0.5);
    imageview.layer.position = CGPointMake(self.view.bounds.size.width *0.5, self.view.bounds.size.height *0.4);
    self.imageView = imageview;
    //把图变成圆的
    imageview.layer.cornerRadius =120;
    imageview.layer.masksToBounds =YES;
    
    imageview.layer.anchorPoint = CGPointMake(0.5, 0.5);
    [self.view addSubview:imageview];
    
    //中间的八个条
    for (int i = 0; i < 8; i ++) {
        CALayer *layer = [CALayer layer];
        layer.bounds = CGRectMake(0, 0, 20, 120);
        layer.backgroundColor = [UIColor blueColor].CGColor;
        
        //wei层添加图像内容
        layer.contents = (id)[UIImage imageNamed:@"icon40"].CGImage;
        layer.position = CGPointMake(imageview.bounds.size.width*0.5, imageview.bounds.size.height*0.5);
        layer.anchorPoint = CGPointMake(0.5, 1);
        layer.transform =CATransform3DMakeRotation(M_PI_4*i, 0, 0, 1);
        [imageview.layer addSublayer:layer];
        
        
    }
    
    
    
}
//散光的效果
-(void)setTitleText1
{
    self.musicTitleLb.text =@"活着----郝云";
    //创建散光的区域的，所有的闪光的
    FBShimmeringView *sv =[FBShimmeringView new];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(20);
        make.top.mas_equalTo(80);
        make.size.mas_equalTo(CGSizeMake(200, 40));
    }];
    self.musicTitleLb.font =[UIFont systemFontOfSize:20];
    [self.musicTitleLb setTextColor:[UIColor orangeColor]];
    sv.contentView =self.musicTitleLb;
    [self.musicTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    sv.shimmering =YES;
    CGPoint endtitle = self.musicTitleLb.center;
    CGPoint titleStrat =endtitle;
    titleStrat.x += self.musicTitleLb.bounds.size.width*0.5;
    self.musicTitleLb.center =titleStrat;
    [UIView animateWithDuration:2 animations:^{
        self.musicTitleLb.center =endtitle;
    }];
    
}
//切块
-(CADisplayLink *)link
{
    if (!_link) {
        
        //这个定时器要自己手动启动
        _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(rotation)];
        //加入事件循环中
        [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    }
    return _link;
}
//一秒调用60次
-(void)rotation
{
    self.imageView.layer.transform = CATransform3DRotate(self.imageView.layer.transform,angleToRadian(72/60.0) , 0, 0, 1);
    
}
//苹果的移动
-(void)keyFrameAnimation
{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    //依靠keyPath说明动画要修改哪个属性
    anim.keyPath = @"position";
    // 设置中间行进的路线的关键值
    /*anim.values = @[
     [NSValue valueWithCGPoint:CGPointMake(10, 40)],
     [NSValue valueWithCGPoint:CGPointMake(30, 90)],
     [NSValue valueWithCGPoint:CGPointMake(90, 300)]];*/
    anim.path = [UIBezierPath bezierPathWithRect:CGRectMake(40, 90,300,420 )].CGPath;
    
    // 动画结束时固定视图
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    anim.repeatCount =10000;
    UIImageView *imageview1 =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"apple"]];
    imageview1.frame = CGRectMake(40, 90, 50, 50);
    [self.view addSubview:imageview1];
    // 设置动画的时长
    anim.duration = 10;
    
    //添加动画到图层
    [imageview1.layer addAnimation:anim forKey:nil];
    
    
}
//暂时没用的
-(void)playf
{
    
    //网络音乐
    //  NSString *audioPath1=@"http://fdfs.xmcdn.com/group1/M00/01/3B/wKgDrVCYca7Sf6VzADfjEnQrWdU600.mp3";
    
    // 本地音乐
    NSString *audioPath=[[NSBundle mainBundle] pathForResource:@"活着"ofType:@"mp3"];
    NSURL *path1 = [NSURL fileURLWithPath:audioPath];
    self.player=[AVPlayer playerWithURL:path1];
    [self.player play];
    //使用的AVAudioPlayer
    NSURL *music=[[NSBundle mainBundle] URLForResource:@"活着" withExtension:@"mp3"];
    self.player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:music error:nil];
    [self.player2 play]; //开始播放
    
    //   // 视频地址
    //     NSString *videoPath=@"http://flv2.bn.netease.com/videolib3/1510/25/bIHxK3719/SD/bIHxK3719-mobile.mp4";
    //  //  /Users/tarena/Desktop/doctor/BaseProject/ViewController/m.mp3
    //        NSLog(@"audio%@",audioPath);
    ////    NSString *audioPath1=[[NSBundle mainBundle] pathForResource:@"m"ofType:@"mp3"];
    ////    NSURL *path1 = [NSURL fileURLWithPath:audioPath1];
    //    //    self.player=[AVPlayer playerWithURL:path1];
    //    //    [self.player play];
    //    //音频地址
    ////    NSString *audioPath=@"http://fdfs.xmcdn.com/group1/M00/01/3B/wKgDrVCYca7Sf6VzADfjEnQrWdU600.mp3";
    ////    //视频地址
    ////    NSString *videoPath=@"http://flv2.bn.netease.com/videolib3/1510/25/bIHxK3719/SD/bIHxK3719-mobile.mp4";
    //    switch (1) {
    //        case 0: //视频
    //            [self.layer removeFromSuperlayer];
    //            self.player=[AVPlayer playerWithURL:[NSURL URLWithString:videoPath]];
    //            self.layer=[AVPlayerLayer playerLayerWithPlayer:self.player];
    //            self.layer.frame=CGRectMake(0, 120, 300, 250);
    //            [self.view.layer addSublayer:self.layer];
    //            break;
    //        case 1: //音频
    //            //self.player=[AVPlayer playerWithURL:[NSURL URLWithString:audioPath]];
    //            self.player=[AVPlayer playerWithURL:path1];
    //            break;
    //        default:
    //            break;
    //    }
    //    [self.player play];
    
    
}

@end
