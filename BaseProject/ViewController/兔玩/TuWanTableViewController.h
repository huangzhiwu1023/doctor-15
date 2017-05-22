//
//  TuWanTableViewController.h
//  BaseProject
//
//  Created by tarena on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanTableViewController : UITableViewController

/**接收外部的传参的，当前控制器显示哪种类型的信息*/
@property(nonatomic,strong)NSNumber *tuwanType;
@end
