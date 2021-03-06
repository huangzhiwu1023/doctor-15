//
//  XiMaCell.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaCell.h"

@implementation XiMaCell

-(UILabel *)orderLb
{
    if (_orderLb ==nil) {
        _orderLb =[[UILabel alloc]init];
        _orderLb.font =[UIFont boldSystemFontOfSize:17];
        _orderLb.textColor =[UIColor lightGrayColor];
        _orderLb.textAlignment =1;
        [self.contentView addSubview:_orderLb];
        //使用kvo的键值观察 如果的text被赋值的为1 颜色是 kvo 要熟
        /**下方方法的；如果——orderLb的text属性 被赋值 新值 则触发task*/
        [_orderLb bk_addObserverForKeyPath:@"text" options:NSKeyValueObservingOptionNew task:^(id obj, NSDictionary *change) {
            NSString *value =change[@"new"];
            if ([value isEqualToString:@"1"]) {
                _orderLb.textColor =[UIColor redColor];
            }else if ([value isEqualToString:@"2"])
            {
                _orderLb.textColor =[UIColor blueColor];
            }else
            {
                _orderLb.textColor =[UIColor blackColor];
            }
        }];
        
        
        //添加依赖 autolayout 一定要有顺序，从左到右 ，从上到下
        [self.orderLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(35);
            
        }];

    }
    return _orderLb;
}

-(TRImageView *)iconIV
{
    if (_iconIV ==nil) {
        _iconIV =[TRImageView new];
        [self.contentView addSubview:_iconIV];
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(65, 65));
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.orderLb.mas_right).mas_equalTo(0);
        }];

        
    }
    return _iconIV;
}
-(UILabel *)titleLb
{
    if (_titleLb ==nil) {
        _titleLb =[UILabel new];
        _titleLb.font =[UIFont boldSystemFontOfSize:18];
        [self.contentView addSubview:_titleLb];
        
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(self.iconIV.mas_topMargin).mas_equalTo(3);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            
        }];

    }
    return _titleLb;
}
-(UILabel *)descLb
{
    if (_descLb ==nil) {
        _descLb =[UILabel new];
        _descLb.font =[UIFont boldSystemFontOfSize:15];
        _descLb.textColor =[UIColor lightGrayColor];
        [self.contentView addSubview:_descLb];
        [self.descLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];

    }
    return _descLb;

}

-(UILabel *)numberLb
{
    if (_numberLb ==nil) {
        _numberLb =[[UILabel alloc]init];
        _numberLb.font =[UIFont systemFontOfSize:12];
        _numberLb.textColor =[UIColor lightGrayColor];
        [self.contentView addSubview:_numberLb];
        [self.numberLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.numberIV.mas_right).mas_equalTo(2);
            make.right.mas_equalTo(-10);
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin).mas_equalTo(-3);
            make.centerY.mas_equalTo(self.numberIV);
        }];
    }
    return _numberLb;
}

-(TRImageView *)numberIV
{
    if (_numberIV ==nil) {
        _numberIV =[[TRImageView alloc]init];
        _numberIV.imageView.image =[UIImage imageNamed:@"album_tracks"];
        [self.contentView addSubview:_numberIV];
        
        
        [self.numberIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(10, 10));
            
        }];

    }
    return _numberIV;
}
//初始化的
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType =1;//右箭头的样式
        //分割线左间距的调整
        self.separatorInset =UIEdgeInsetsMake(0, 105, 0, 0);
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
