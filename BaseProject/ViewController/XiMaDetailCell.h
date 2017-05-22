//
//  XiMaDetailCell.h
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface XiMaDetailCell : UITableViewCell
//原则上 。h文件中只存放要被调用的getset方法的属性


/**音乐封面图*/
@property(nonatomic,strong)TRImageView*iconIV;
/**题目的标签*/
@property(nonatomic,strong)UILabel *titleLb;
/**添加时间标签*/
@property(nonatomic,strong)UILabel *timeLb;
/**音乐来源标签*/
@property(nonatomic,strong)UILabel *sourceLb;
/**播放次数标签*/
@property(nonatomic,strong)UILabel *playCountLb;
/**笑话次数标签*/
@property(nonatomic,strong)UILabel *favorCountLb;
/**评论次数标签*/
@property(nonatomic,strong)UILabel *commentCountLb;
/**时长标签*/
@property(nonatomic,strong)UILabel *durtionLb;
/**下载按钮*/
@property(nonatomic,strong)UIButton *downLoadBtn;
@end
