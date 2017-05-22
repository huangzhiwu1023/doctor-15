//
//  trasfromViewController.m
//  BaseProject
//
//  Created by tarena on 15/10/30.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "trasfromViewController.h"
#define angleToRadian(x)(x/180.0*M_PI)
@interface trasfromViewController ()
@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)CADisplayLink *link;
@property(nonatomic,assign)BOOL ispaly;
@end

@implementation trasfromViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageview = [[UIImageView alloc]init];
    imageview.image = [UIImage imageNamed:@"icon40"];
    imageview.layer.bounds= CGRectMake(0, 0, 240, 240);
    imageview.layer.position = CGPointMake(self.view.bounds.size.width *0.5, self.view.bounds.size.height *0.5);
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
        layer.backgroundColor = [UIColor redColor].CGColor;
        
        //wei层添加图像内容
        layer.contents = (id)[UIImage imageNamed:@"icon40"].CGImage;
        layer.position = CGPointMake(imageview.bounds.size.width*0.5, imageview.bounds.size.height*0.5);
        layer.anchorPoint = CGPointMake(0.5, 1);
        layer.transform =CATransform3DMakeRotation(M_PI_4*i, 0, 0, 1);
        [imageview.layer addSublayer:layer];
    }

}

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
//- (IBAction)playAndPause:(id)sender {
//    
//    self.ispaly = !self.ispaly;
//    self.link.paused =!self.ispaly;
//    
//}












//+(void)imageName:(NSString *)image  completeHandle:(void (^)(NSError *))complete
//{
//    UIImageView *imageview = [[UIImageView alloc]init];
//    
//    imageview.image = [UIImage imageNamed:image];
//    imageview.layer.bounds= CGRectMake(0, 0, 240, 240);
//    imageview.layer.position = CGPointMake(self.view.bounds.size.width *0.5, self.view.bounds.size.height *0.5);
//    self.imageView = imageview;
//    //把图变成圆的
//    imageview.layer.cornerRadius =120;
//    imageview.layer.masksToBounds =YES;
//    
//    imageview.layer.anchorPoint = CGPointMake(0.5, 0.5);
//    [self.view addSubview:imageview];
//    
//    //中间的八个条
//    for (int i = 0; i < 8; i ++) {
//        CALayer *layer = [CALayer layer];
//        layer.bounds = CGRectMake(0, 0, 20, 120);
//        layer.backgroundColor = [UIColor redColor].CGColor;
//        
//        //wei层添加图像内容
//        layer.contents = (id)[UIImage imageNamed:@"icon40"].CGImage;
//        layer.position = CGPointMake(imageview.bounds.size.width*0.5, imageview.bounds.size.height*0.5);
//        layer.anchorPoint = CGPointMake(0.5, 1);
//        layer.transform =CATransform3DMakeRotation(M_PI_4*i, 0, 0, 1);
//        [imageview.layer addSublayer:layer];
//    }
//
//}

@end
