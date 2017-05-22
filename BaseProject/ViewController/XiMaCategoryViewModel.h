//
//  XiMaCategoryViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XiMaNetManager.h"
@interface XiMaCategoryViewModel : BaseViewModel
/**数据的条数*/
@property(nonatomic)NSInteger rowNumber;
/**每条数据的图片URL*/
-(NSURL *)iconURLForRow:(NSInteger)row;

/**某条数据的题目*/
-(NSString *)titleForRow:(NSInteger)row;
/**某条数据的描述*/
-(NSString *)descForRow:(NSInteger)row;
/**某条数据的集数*/
-(NSString *)numberForRow:(NSInteger)row;
//model
/**当前页数 */
@property(nonatomic,assign)NSInteger pageId;

/**当前页数的id*/
-(NSInteger)albumIdForRow:(NSInteger)row;

/**当前最大页数 */
@property(nonatomic,assign)NSInteger maxPageId;

@end
