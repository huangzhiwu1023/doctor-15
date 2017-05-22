//
//  xiaohuaViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "xiaohuaNetManager.h"
@interface xiaohuaViewModel : BaseViewModel
//对应的每一行
@property(nonatomic,assign)NSInteger rowNumber;
@property(nonatomic,assign)NSInteger page;
@property(nonatomic,strong)NSString *time;
@property(nonatomic,assign)NSInteger maxPage;
@property(nonatomic,assign)NSInteger CurrentPage;
/**某一行的标题*/
-(NSString *)titleForRor:(NSInteger)row;

/**m每一行的内容*/
-(NSURL *)URLForRow:(NSInteger)row;

@property(nonatomic,assign)BOOL ismorePage;


@end
