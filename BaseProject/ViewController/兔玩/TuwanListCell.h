//
//  TuwanListCell.h
//  BaseProject
//
//  Created by tarena on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageView.h"
@interface TuwanListCell : UITableViewCell
/** 左侧的图*/
@property(nonatomic,strong)ImageView *iconIV;
/**题目的标题 */
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UILabel *longTitleLb;
@property(nonatomic,strong)UILabel *clicksNumLb;
@end
