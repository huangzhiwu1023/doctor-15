//
//  ImageView.m
//  BaseProject
//
//  Created by tarena on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ImageView.h"

@implementation ImageView

- (id)init
{
    self = [super init];
    if (self) {
        _imageView =[UIImageView new];
        [self addSubview:_imageView];
        _imageView.contentMode =2;
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
            
        }];
        self.clipsToBounds =YES;//减去超出的部分的视图
    }
    return self;
}
@end
