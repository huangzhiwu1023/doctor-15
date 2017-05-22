//
//  WelcomeVC.m
//  BaseProject
//
//  Created by tarena on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WelcomeVC.h"
#import "iCarousel.h"
#import "LoinVC.h"
@interface WelcomeVC ()<iCarouselDelegate, iCarouselDataSource>
@property(nonatomic,strong) iCarousel *ic;
@end

@implementation WelcomeVC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.ic];
    [self.ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];

}
- (iCarousel *)ic{
    if (!_ic) {
        _ic = [iCarousel new];
        //就是仿写的CollectionView
        _ic.delegate = self;
        _ic.dataSource = self;
        //修改3D显示模式, type是枚举类型，数值0 ~ 11
        _ic.type = 0;
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
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return 5;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{

    if (!view) {
        //这里x.y 是无作用的, 图片的宽高 300*500
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];}
    UIImageView *imageView = [UIImageView new];
    [view addSubview:imageView];
    imageView.backgroundColor =[UIColor orangeColor];
    view.backgroundColor =[UIColor orangeColor];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    NSString *names =[NSString stringWithFormat:@"wel%ld.png",index +1];
    imageView.image = [UIImage imageNamed:names];
    return view;
}
-(void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    if (index == 4) {
        UIViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"LVC"];
                UIWindow *window = [UIApplication sharedApplication].keyWindow;
                window.rootViewController =vc;
        

    }


}

       // DDLogVerbose(@"%ld",index);






@end
