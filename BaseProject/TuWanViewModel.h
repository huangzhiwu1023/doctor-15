//
//  TuWanViewModel.h
//  BaseProject
//
//  Created by tarena on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "tuwanNetManager.h"
@interface TuWanViewModel : BaseViewModel
//7.首先它是分页的，可以看看是按什么的来分页的 page?? start 依次加11,
@property(nonatomic)NSInteger start;//当前的页数的，base里面有存储的行的
@property(nonatomic,assign)NSInteger rowNumber;//存储当前的行数的
@property(nonatomic,strong)NSArray *indexPicArr;//存放头部滚动栏的


/** 必须使用的这初始化方法  -----------------------------*/
-(instancetype)initWithType:(tuwanType)type;//类型的
@property(nonatomic,assign)tuwanType type;

@property(nonatomic,getter=isExistIndexPic)BOOL existIndexPic;//是否有头部的
-(BOOL)containImages:(NSInteger)row;//判断某一行数据是否有图


/** cell用到----------------------------------------------------*/
//返回列表中的某行的数据的题目的
-(NSString *)titleForRowList:(NSInteger)row;
//返回列表中的某行的数据的图片的
-(NSURL *)iconForRowList:(NSInteger)row;
//返回列表中的某行描述的的
-(NSString *)descForRowList:(NSInteger)row;
//返回列表中的某行的数据的浏览人数的
-(NSString *)clickForRowList:(NSInteger)row;


/**滚动栏的 图和子---------------------------------------------- */
-(NSURL *)iconForRowInindexPic:(NSInteger)row;
//文字
-(NSString *)titleForRowInIndexPic:(NSInteger)row;
//滚动的栏的图片的数量
@property(nonatomic,assign)NSInteger indexPicnumber;


/**表头的和点击行进入的页面 和表头的点击的进入的网址-----------------*/
//获取列表中的某行的数据对应的html5链接
-(NSURL *)detailUrlForRowInList:(NSInteger)row;
//获取列表中的某行的数据对应的html5链接
-(NSURL *)detailUrlForRowInIndexPic:(NSInteger)row;


/**有图片的通过行数的图片链接的数组*/
-(NSArray *)iconUrlSForRow:(NSInteger)row;
/**当前的数据的类型的视频*/
-(BOOL)isVideoInListForRow:(NSInteger)row;
-(BOOL)isVideoInindePicForRow:(NSInteger)row;

/**当前的数据的类型的图片*/

-(BOOL)isPicInListForRow:(NSInteger)row;
-(BOOL)isPicInindePicForRow:(NSInteger)row;
/**当前的数据的类型的html*/

-(BOOL)isHtmlInListForRow:(NSInteger)row;
-(BOOL)isHtmlInindePicForRow:(NSInteger)row;







@end
