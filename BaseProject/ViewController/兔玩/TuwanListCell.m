//
//  TuwanListCell.m
//  BaseProject
//
//  Created by tarena on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuwanListCell.h"

@implementation TuwanListCell
//1
-(ImageView *)iconIV
{
    if (_iconIV == nil) {
        _iconIV =[ImageView new];
//        _iconIV.contentMode =UIViewContentModeScaleAspectFit;
    }
    return _iconIV;

}
-(UILabel *)titleLb
{

    if (_titleLb == nil) {
        _titleLb =[UILabel new];
        _titleLb.font =[UIFont systemFontOfSize:17];
        
    }
    return _titleLb;
}
-(UILabel *)longTitleLb
{
    if (_longTitleLb == nil) {
        _longTitleLb =[UILabel new];
        _longTitleLb.font =[UIFont systemFontOfSize:14];
        _longTitleLb.textColor =[UIColor lightGrayColor];
        _longTitleLb.numberOfLines =0;//自动的换行的
    }
    return _longTitleLb;
}
-(UILabel *)clicksNumLb
{
    if (_clicksNumLb==nil) {
        _clicksNumLb =[UILabel new];
        _clicksNumLb.textColor= [UIColor lightGrayColor];
        _clicksNumLb.font =[UIFont systemFontOfSize:12];
    }
    return _clicksNumLb;
}

//2.把他们添加到界面上重写初始化方法2
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    /** 加入contentview*/
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.longTitleLb];
        [self.contentView addSubview:self.clicksNumLb];
        
    /**布局*/
        //图片
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(92, 70));
            make.centerY.mas_equalTo(0);
        }];
        //题目 距离图片的右边的8 右边缘的10 上边缘比图片的上边缘的爱3
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(10);
            make.top.mas_equalTo(self.iconIV.mas_topMargin).mas_equalTo(3);//mas_topMargin的爱
        }];
        //长题目的 距离左右边缘与题目一样的，上边缘的距距离题目8
        [self.longTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.rightMargin.mas_equalTo(self.titleLb.mas_rightMargin);//对齐的化就使用的这 ，相聚的用没有的
             make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(8);
        }];
        //浏览的 点击数 下边缘和图片对齐的 右边和title对器
        [self.clicksNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin);
            make.rightMargin.mas_equalTo(self.titleLb.mas_rightMargin);
        }];
        
    }
    return self;
}






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
