//
//  XiMaDetailCell.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaDetailCell.h"

@implementation XiMaDetailCell

-(TRImageView *)iconIV
{
    if (_iconIV == nil) {
        _iconIV =[[TRImageView alloc]init];
        [self.contentView addSubview:_iconIV];
      //  _iconIV.backgroundColor =[UIColor orangeColor];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(110/2, 110/2));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(10);
        }];
        _iconIV.layer.cornerRadius =55/2;
        UIImageView *image =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"find_album_play"]];
        [_iconIV addSubview:image];
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(25, 25));
            make.center.mas_equalTo(0);
        }];
        
    }
    return _iconIV;
}
-(UILabel *)titleLb
{
    if (_titleLb ==nil) {
        _titleLb =[UILabel new];
        _titleLb.font =[UIFont systemFontOfSize:17];
        [self.contentView addSubview:self.titleLb];
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.timeLb.mas_right).mas_equalTo(-10);
            make.top.mas_equalTo(10);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
          
        
        }];
        _titleLb.numberOfLines =0;
            }
    return _titleLb;
}
-(UILabel *)timeLb
{
    if (!_timeLb) {
        _timeLb =[UILabel new];
          [self.contentView addSubview:_timeLb];
         _timeLb.font =[UIFont systemFontOfSize:12];
        _timeLb.textColor =[UIColor lightGrayColor];
        [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.width.mas_equalTo(50);
            
        }];
        _timeLb.textAlignment =NSTextAlignmentRight;
        
    }
   return  _timeLb;
}

-(UILabel *)sourceLb
{
    if (!_sourceLb) {
        _sourceLb=[UILabel new];
        [self.contentView addSubview:_sourceLb];
        [_sourceLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(4);
            make.rightMargin.mas_equalTo(self.titleLb.mas_rightMargin);
        }];
        _sourceLb.font =[UIFont systemFontOfSize:15];
        _sourceLb.textColor =[UIColor lightGrayColor];
    }
    return  _sourceLb;
}
-(UILabel *)playCountLb
{
    if (!_playCountLb) {
        _playCountLb =[UILabel new];
       
        UIImageView *imageview =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_play"]];
         [self.contentView addSubview:imageview];
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.sourceLb.mas_leftMargin);
            make.bottom.mas_equalTo(-10);
            make.top.mas_equalTo(self.sourceLb.mas_bottom).mas_equalTo(8);
            make.size.mas_equalTo(CGSizeMake(18, 18));
            
        }];
        [self.contentView addSubview:_playCountLb];
        [_playCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageview);
            make.left.mas_equalTo(imageview.mas_right).mas_equalTo(3);
        }];
        _playCountLb.font =[UIFont systemFontOfSize:13];
        _playCountLb.textColor =[UIColor lightGrayColor];
    }
    return  _playCountLb;
}
-(UILabel *)favorCountLb
{
    if (!_favorCountLb) {
        _favorCountLb =[UILabel new];
        [self.contentView addSubview:_favorCountLb];
        UIImageView *imageView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_likes_n"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.playCountLb);
            make.left.mas_equalTo(self.playCountLb.mas_right).mas_equalTo(7);
            make.size.mas_equalTo(CGSizeMake(20, 20));
            
        }];
        _favorCountLb.textColor =[UIColor lightGrayColor];
        _favorCountLb.font =[UIFont systemFontOfSize:12];
        [_favorCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_right).mas_equalTo(3);
            make.centerY.mas_equalTo(imageView);
        }];
        
    }
    return  _favorCountLb;
}
-(UILabel *)commentCountLb
{
    if (!_commentCountLb) {
        _commentCountLb =[UILabel new];
        [self.contentView addSubview:_commentCountLb];
        UIImageView *imageview =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_comments"]];
        [self.contentView addSubview:imageview];
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(18, 18));
            make.left.mas_equalTo(self.favorCountLb.mas_right).mas_equalTo(7);
            make.centerY.mas_equalTo(self.favorCountLb);
        }];
        [_commentCountLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageview);
            make.left.mas_equalTo(imageview.mas_right).mas_equalTo(3);
        }];
        _commentCountLb.textColor =[UIColor lightGrayColor];
        _commentCountLb.font =[UIFont systemFontOfSize:12];
    }
    return  _commentCountLb;
}
-(UILabel *)durtionLb
{
    if (!_durtionLb) {
        _durtionLb =[UILabel new];
        [self.contentView addSubview:_durtionLb];
        UIImageView *imageview =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sound_duration"]  ];
        [self.contentView addSubview:imageview];
        [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.commentCountLb.mas_right).mas_equalTo(7);
            make.centerY.mas_equalTo(self.commentCountLb);
            make.size.mas_equalTo(CGSizeMake(18, 18));
        }];
        [_durtionLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(imageview);
            make.left.mas_equalTo(imageview.mas_right).mas_equalTo(3);
        }];
        
        _durtionLb.textColor =[UIColor lightGrayColor];
        _durtionLb.font =[UIFont systemFontOfSize:12];
        
    }
    return  _durtionLb;
}
-(UIButton *)downLoadBtn
{
    if (_downLoadBtn ==nil) {
        _downLoadBtn =[UIButton buttonWithType:0];
        [_downLoadBtn setBackgroundImage:[UIImage imageNamed:@"cell_download"] forState:0];
        [_downLoadBtn bk_addEventHandler:^(id sender) {
            DDLogVerbose(@"点击下载..");
        } forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_downLoadBtn];
        [_downLoadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.mas_equalTo(-5);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
    }
    return _downLoadBtn;
}




/**初始化方法设置cell的样式*/
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType =1;//右箭头的样式
        UIView *view =[[UIView alloc]init];
        view.backgroundColor =kRGBColor(243, 255, 254);
        self.selectedBackgroundView =view;
        self.separatorInset =UIEdgeInsetsMake(0, 76, 0, 0);
        //为了触发下载按钮的懒加载的调用
        self.downLoadBtn.hidden =NO;
    }
    return self;

}


@end
