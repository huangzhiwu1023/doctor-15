//
//  XiMaDetailViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaDetailViewModel.h"

@implementation XiMaDetailViewModel

/**多少个，也就是行*/
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
/**是否更多*/
-(BOOL)isMorePage
{
    return _MaxPageId>_pageId;
}

-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _pageId  = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    if (self.isMorePage) {
        _pageId += 1;
        [self getDataFromNetCompleteHandle:completionHandle];
    }else{
        NSError *error =[NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多数据了"}];
        completionHandle(error);
    }
    
    
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    //创建一个网络的任务的
    self.dataTask =[XiMaNetManager getAlbumWithId:_ID page:_pageId completionHandle:^(AlbumModel * model, NSError *error) {
        if (_pageId == 1) {
            [self.dataArr removeAllObjects];
        }
        //把数据放到数组
        [self.dataArr addObjectsFromArray:model.tracks.list];///////////.....这个地方自己写错了
        _MaxPageId =model.tracks.maxPageId;//把当前也给最大也
        completionHandle(error);
    }];
}
-(id)initWithId:(NSInteger)Id 
{
    if (self =[super init]) {
        _ID =Id;
           }
    return self;
}

-(AlbumTracksListModel *)modelForRow:(NSInteger)row//这个地方是写错了
{
    return self.dataArr[row];
}
-(NSURL *)coverURLForRow:(NSInteger)row
{
    return[NSURL URLWithString:[self modelForRow:row].coverSmall];
}
-(NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].title;
}
-(NSString *)sourceForRow:(NSInteger)row
{
    return [self modelForRow:row].nickname;
}
-(NSString *)timeForRow:(NSInteger)row
{
//1447088462000
    //获取当前时间
    NSTimeInterval currentTime =[[NSDate date] timeIntervalSince1970];
    //算出当前时间的的间隔秒数
    NSTimeInterval delta =currentTime -[self modelForRow:row].createdAt/1000;
    //秒数转小时
    NSInteger hours =delta /3600;
    if (hours < 24) {
        return [NSString stringWithFormat:@"%ld小时前",hours];
    }
    //秒数转天数
    NSInteger day =delta/3600/24;
    return [NSString stringWithFormat:@"%ld天前",day];
}

-(NSString *)playnumberForRow:(NSInteger)row
{
    NSInteger count =[self modelForRow:row].playtimes;
    if (count < 10000) {
         return @([self modelForRow:row].playtimes).stringValue;
    }else{
        return [NSString stringWithFormat:@"%.1lf万",count/10000.0];
    }
   
}
-(NSString *)favornumberForRow:(NSInteger)row
{
    return @([self modelForRow:row].likes).stringValue;
}
-(NSString *)commentnumberForRow:(NSInteger)row
{
    return @([self modelForRow:row].comments).stringValue;
}
-(NSString *)duratonForRow:(NSInteger)row
{
    NSInteger duration =[self modelForRow:row].duration;
    NSInteger mintue =duration/60;
    NSInteger second =duration%60;
    return [NSString stringWithFormat:@"%02ld:%02ld",mintue,second];
}
-(NSURL *)downLoadURLForRow:(NSInteger)row
{
    return[NSURL URLWithString: [self modelForRow:row].downloadUrl];
}
-(NSURL *)musicURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].playUrl64];
}


@end
