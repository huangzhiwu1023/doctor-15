//
//  TuWanViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "TuWanViewModel.h"



@implementation TuWanViewModel
//创建一个viewmodel类型的方法必须要写使用这个初始化的方法创建的，这样才能根据不同的type来确定是那个类网络的解析
-(instancetype)initWithType:(tuwanType)type
{
    if (self = [super init]) {
        _type =type;
    }
    return self;
}
//预防性的编程防止不使用的initwith初始化的
-(id)init//new alloc init 都会走这个方法，我们就崩溃的提示
{
    if (self = [super init]) {
        NSAssert(NO, @"必须使用initwithType方法初始化",__func__);
    }
    return self;

}
//刷新和加载更多的方法
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _start =0;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    _start += 11;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{//获取网络数据
 self.dataTask =[tuwanNetManager getTuWanType:_type start:_start completeHandle:^(TuWanModel* model, NSError *error) {
     
     //获取更多的判断
     if (_start == 0) {
         [self.dataArr removeAllObjects];
         self.indexPicArr =nil;
     }
     [self.dataArr addObjectsFromArray:model.data.list];
     //头部是没有下拉的
     self.indexPicArr =model.data.indexpic;
       NSLog(@"%@",self.indexPicArr);
    completionHandle(error);
     
 }];
}

-(BOOL)isExistIndexPic
{
    return self.indexPicArr !=nil && self.indexPicArr.count != 0;//判断下是否有滚动的
}

//cell的类型
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
//因为有两个arr所以这里使用一个参数的在不同的arr填入就行的，这样就少写一个方法
-(TuWanDataIndexpicModel *)modelForArr:(NSArray *)arr row:(NSInteger )row
{
    return arr[row];//对应这一行的数据的
}
-(BOOL)containImages:(NSInteger)row
{//showtype wei 1有图 0没图
    return [[self modelForArr:self.dataArr row:row].showtype isEqualToString:@"1"];
}

/** cell*/
//返回列表中的某行的数据的题目的
-(NSString *)titleForRowList:(NSInteger)row
{
    return [self modelForArr:self.dataArr row:row].title;

}
//返回列表中的某行的数据的图片的
-(NSURL *)iconForRowList:(NSInteger)row
{
    NSURL *url =[NSURL URLWithString:[self modelForArr:self.dataArr row:row].litpic];
    return url;

}
//返回列表中的某行描述的的
-(NSString *)descForRowList:(NSInteger)row
{
    return [self modelForArr:self.dataArr row:row].desc;
}
//返回列表中的某行的数据的浏览人数的
-(NSString *)clickForRowList:(NSInteger)row
{
    return [[self modelForArr:self.dataArr row:row].click stringByAppendingString:@"人浏览"];;

}

/**滚动栏的 图和子 */
-(NSURL *)iconForRowInindexPic:(NSInteger)row
{
    NSURL *url =[NSURL URLWithString:[self modelForArr:self.indexPicArr row:row].litpic];
    return url;

}
//文字
-(NSString *)titleForRowInIndexPic:(NSInteger)row
{
    return [self modelForArr:self.indexPicArr row:row].title;
}
//滚动的栏的图片的数量
-(NSInteger)indexPicnumber
{
      NSLog(@"%ld",self.indexPicArr.count);
    return self.indexPicArr.count;
}

//获取列表中的某行的数据对应的html5链接
-(NSURL *)detailUrlForRowInList:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].html5];
}
//获取列表中的某行的数据对应的html5链接
-(NSURL *)detailUrlForRowInIndexPic:(NSInteger)row
{
return [NSURL URLWithString:[self modelForArr:self.indexPicArr row:row].html5];
}


-(NSArray *)iconUrlSForRow:(NSInteger)row
{
    NSArray *arr =[self modelForArr:self.dataArr row:row].showitem;
    NSMutableArray *arrr=[NSMutableArray new];
    for (int i = 0; i < arr.count; i ++) {
        TuWanDataIndexpicShowitemModel *model =arr[i];
        [arrr addObject:[NSURL URLWithString:model.pic]];
    }
    return [arrr copy];


}


/**当前的数据的类型的视频*/
-(BOOL)isVideoInListForRow:(NSInteger)row
{
    return [[self modelForArr:self.dataArr row:row].type isEqualToString:@"video"];
}
-(BOOL)isVideoInindePicForRow:(NSInteger)row
{
    return [[self modelForArr:self.indexPicArr row:row].type isEqualToString:@"video"];
}

/**当前的数据的类型的图片*/

-(BOOL)isPicInListForRow:(NSInteger)row
{
 return [[self modelForArr:self.dataArr row:row].type isEqualToString:@"pic"];
}
-(BOOL)isPicInindePicForRow:(NSInteger)row
{
  return [[self modelForArr:self.indexPicArr row:row].type isEqualToString:@"pic"];
}
/**当前的数据的类型的html 类型为all */

-(BOOL)isHtmlInListForRow:(NSInteger)row
{
  return [[self modelForArr:self.indexPicArr row:row].type isEqualToString:@"all"];
}
-(BOOL)isHtmlInindePicForRow:(NSInteger)row
{
  return [[self modelForArr:self.indexPicArr row:row].type isEqualToString:@"all"];
}





@end
