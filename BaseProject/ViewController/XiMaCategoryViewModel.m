
//
//  XiMaCategoryViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiMaCategoryViewModel.h"

@implementation XiMaCategoryViewModel
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _pageId =1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    //是否达到最大的页数.如果当前的饿页数已经是最大页数，那么就没有必要在发送的获取更多的请求了，这样会浪费的用户的流量
    if(_maxPageId <= _pageId)
    {
        //[self showErrorMsg:@"没事更多的数据"];//提出一个提示
        NSError *err =[NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多的页数了"}];
        completionHandle(err);
        return;
    }
    _pageId += 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
self.dataTask =[XiMaNetManager getRankListWithPageId:_pageId completionHandle:^(RankingListModel* model, NSError *error) {
    if (!error) {//如果当前是没有的错的时候
    if (_pageId == 1) {
        [self.dataArr removeAllObjects];
    }
    [self.dataArr addObjectsFromArray:model.list];
    _maxPageId =model.maxPageId;
    }
    completionHandle(error);
}];
}
-(RankListListModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
-(NSInteger)albumIdForRow:(NSInteger)row
{
    return [self modelForRow:row].albumId;

}
-(NSURL *)iconURLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].albumCoverUrl290];
}
-(NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].title;
}
-(NSString *)descForRow:(NSInteger)row
{
    return [self modelForRow:row].intro;
}
-(NSString *)numberForRow:(NSInteger)row
{
    return   [NSString stringWithFormat:@"%ld集",[self modelForRow:row].tracks ];
}

//获取根据行id








@end
