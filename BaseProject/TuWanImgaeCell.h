//
//  TuWanImgaeCell.h
//  BaseProject
//
//  Created by tarena on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageView.h"
@interface TuWanImgaeCell : UITableViewCell
/**题目标签 */
@property(nonatomic,strong)UILabel *titleLb;
/**点击标签 */
@property(nonatomic,strong)UILabel *cliksNumLb;
/** 图片1*/
@property(nonatomic,strong)ImageView *iconV1;
/** 图片2*/
@property(nonatomic,strong)ImageView *iconV2;
/** 图片3*/
@property(nonatomic,strong)ImageView *iconV3;
@end
