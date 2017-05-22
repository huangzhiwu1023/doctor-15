//
//  chatTableViewCell.m
//  testdoctor
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 星海集团. All rights reserved.
//

#import "chatTableViewCell.h"

@interface chatTableViewCell()
//设置行里面的uiimageview 属性he label


@end



@implementation chatTableViewCell
//zi定义一个cell


-(UIImageView *)popimageview
{
    if (!_popimageview) {
        _popimageview = [[UIImageView alloc]init];
    }
    return _popimageview;
}

-(UILabel *)popLabel
{

    if (!_popLabel) {
        _popLabel =[[UILabel alloc]init];
        _popLabel.numberOfLines =0;
    }
    return _popLabel;
}

#define TB 4.0 //上下
#define LR 10.0 //左右
#define CORNER 18.0 //圆角
#define TAIL_WIDTH 16.0 //
#define MAX_WIDTH_OF_TEXT 200.0 //最大文本宽
#define CELL_PADDING 8.0 //边距
//重写message的set方法，因为我要它做更多的事
-(void)setMess:(message *)mess
{ //传数进来
    _mess =mess;
    // 保存cell 的lable上
    self.popLabel.text =mess.content;
    //布局，设置气泡的大小，颜色，方向，及lable的大小位置
    if(mess.isme)
    {
        //蓝色气泡，右边
        self.popLabel.textColor =[UIColor purpleColor];
        self.popimageview.image =[UIImage imageNamed:@"message_i"];
        //通过这个方法拿到lable里的文字的大小最小0行
        CGRect rect =  [self.popLabel textRectForBounds:CGRectMake(0, 0, MAX_WIDTH_OF_TEXT, 999) limitedToNumberOfLines:0];
        CGRect poplableframe = rect;
        poplableframe.origin.x = self.bounds.size.width -LR-TAIL_WIDTH -CELL_PADDING-rect.size.width;
        poplableframe.origin.y =TB +CELL_PADDING;
        self.popLabel.frame =poplableframe;
        //气泡的frame
        CGRect popImageViewFrame = poplableframe;
        popImageViewFrame.origin.x -= CELL_PADDING;
        popImageViewFrame.origin.y  -=TB;
        popImageViewFrame.size.width +=CELL_PADDING *2 + TAIL_WIDTH;
        popImageViewFrame.size.height += CELL_PADDING *2 ;
        self.popimageview.frame =popImageViewFrame;
//          NSLog(@"呵呵呵%lf",self.popimageview.frame.size.height);
        
        
    }
    else
    {
        //灰色气泡，左边
        self.popLabel.textColor = [UIColor grayColor];
        self.popimageview.image = [UIImage imageNamed:@"message_other"];
        //通过这个方法拿到lable里的文字的大小最小0行
        CGRect rect =  [self.popLabel textRectForBounds:CGRectMake(0, 0, MAX_WIDTH_OF_TEXT, 999) limitedToNumberOfLines:0];
        CGRect poplableframe = rect;
        poplableframe.origin.x = CELL_PADDING + TAIL_WIDTH+LR;
        poplableframe.origin.y =TB +CELL_PADDING;
        self.popLabel.frame =poplableframe;
        
        //气泡的frame
        CGRect popImageViewFrame = poplableframe;
        popImageViewFrame.origin.x = CELL_PADDING;
        popImageViewFrame.origin.y  =TB;
        popImageViewFrame.size.width +=CELL_PADDING *2 + TAIL_WIDTH;
        popImageViewFrame.size.height += CELL_PADDING *2 ;
        self.popimageview.frame =popImageViewFrame;
        
               
//          NSLog(@"11%lf",self.popimageview.frame.size.height);
        
        
        
        
    }
    
    [self.contentView addSubview:self.popimageview];
    [self.contentView addSubview:self.popLabel];
    
}






@end
