//
//  XiMaDetailViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "XiMaNetManager.h"
@interface XiMaDetailViewModel : BaseViewModel
/**行数*/
@property(nonatomic)NSInteger rowNumber;
-(id)initWithId:(NSInteger)Id ;
@property(nonatomic,assign)NSInteger ID;
//当前请求的页数
@property(nonatomic,assign)NSInteger pageId;
/**最大的页数的*/
@property(nonatomic,assign)NSInteger MaxPageId;
/**是否有更多的页*/
@property(nonatomic,assign)BOOL isMorePage;
/**获取某行的封面的图片*/
-(NSURL *)coverURLForRow:(NSInteger)row;
/**获取某行的题目*/
-(NSString*)titleForRow:(NSInteger)row;
//获取每行出处
-(NSString *)sourceForRow:(NSInteger)row;
/**获取每行的更新时间*/
-(NSString *)timeForRow:(NSInteger)row;
/**获取某行的播放数*/
-(NSString *)playnumberForRow:(NSInteger)row;
/**获取每行的喜欢的数*/
-(NSString *)favornumberForRow:(NSInteger)row;
/**获取每行的评论数*/
-(NSString *)commentnumberForRow:(NSInteger)row;
/**获取每行的播放时长*/
-(NSString *)duratonForRow:(NSInteger)row;
/**获取每行现在链接地址*/
-(NSURL *)downLoadURLForRow:(NSInteger)row;
/**获取每行的音频播放地址*/
-(NSURL *)musicURLForRow:(NSInteger)row;






@end
