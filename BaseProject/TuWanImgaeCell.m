//
//  TuWanImgaeCell.m
//  BaseProject
//
//  Created by tarena on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanImgaeCell.h"

@implementation TuWanImgaeCell
-(UILabel *)titleLb
{
    if (_titleLb == nil) {
        _titleLb = [UILabel new];
        _titleLb.textColor =[UIColor lightGrayColor];
        _titleLb.font =[UIFont systemFontOfSize:17];
    }
    return _titleLb;
}
-(UILabel *)cliksNumLb
{
    if (_cliksNumLb == nil) {
        _cliksNumLb = [UILabel new];
        _cliksNumLb.textColor =[UIColor lightGrayColor];
        _cliksNumLb.font =[UIFont systemFontOfSize:12];
        _cliksNumLb.textAlignment =NSTextAlignmentRight;
    }
    return _cliksNumLb;
}
-(ImageView *)iconV1
{
    if (_iconV1 == nil) {
        _iconV1 =[ImageView new];
      
    }
    return _iconV1;

}
-(ImageView *)iconV2{
if (_iconV2 == nil) {
    _iconV2 =[ImageView new];
    
}
return _iconV2;

}
-(ImageView *)iconV3
{
    if (_iconV3 == nil) {
        _iconV3 =[ImageView new];
     
    }
    return _iconV3;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLb];
         [self.contentView addSubview:self.cliksNumLb];
         [self.contentView addSubview:self.iconV1];
         [self.contentView addSubview:self.iconV2];
         [self.contentView addSubview:self.iconV3];
        //tim
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.mas_equalTo(self.cliksNumLb.mas_left).mas_equalTo(-10);
        }];
        [self.cliksNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.width.mas_lessThanOrEqualTo(70);//大于等于 小于等于
            make.width.mas_greaterThanOrEqualTo(40);
        }];
        [self.iconV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(88);
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(_titleLb.mas_bottom).mas_equalTo(5);
            
            
        }];
        [self.iconV2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.iconV1);
            make.left.mas_equalTo(self.iconV1.mas_right).mas_equalTo(5);
            make.topMargin.mas_equalTo(self.iconV1);//duiqi
            
            
        }];
        [self.iconV3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(self.iconV1);
            make.topMargin.mas_equalTo(self.iconV1);
            make.left.mas_equalTo(self.iconV2.mas_right).mas_equalTo(5);
            make.right.mas_equalTo(-10);
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
