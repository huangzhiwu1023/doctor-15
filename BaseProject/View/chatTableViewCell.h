//
//  chatTableViewCell.h
//  testdoctor
//
//  Created by tarena on 15/10/8.
//  Copyright (c) 2015年 星海集团. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "message.h"
@interface chatTableViewCell : UITableViewCell
//用来显示里面的数据
@property(nonatomic,strong)message *mess;
@property(nonatomic,strong)UIImageView *popimageview;
@property(nonatomic,strong)UILabel *popLabel;
@end
