
//
//  xiaohuaViewModel.m
//  BaseProject
//
//  Created by tarena on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "xiaohuaViewModel.h"

@implementation xiaohuaViewModel
-(void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _page =1;
    [self getDataFromNetCompleteHandle:completionHandle];
}
-(void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    if (self.ismorePage) {
        _page += 1;
        [self getMoreDataCompletionHandle:completionHandle];
    }else
    {
        NSError *error =[NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多的数据"}];
        completionHandle(error);
    }
   }
-(void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
   self.dataTask =[xiaohuaNetManager getXiaohua:self.time page:self.page completionHandle:^(xiaohuaModel* model, NSError *error) {
       if (_page ==1) {
           [self.dataArr removeAllObjects];
       }
       self.maxPage =model.showapi_res_body.allPages;
    
       [self.dataArr addObjectsFromArray:model.showapi_res_body.contentlist];
       completionHandle(error);
   }];
}
-(BOOL)ismorePage
{
    return self.maxPage<=self.page;
}

-(NSString *)time
{
    if (_time == nil) {
            NSDate *now = [NSDate date];
            NSDateFormatter *f =[[NSDateFormatter alloc]init];
            f.dateFormat=@"yyyyMMddHHmmss";
            NSString *f1=[f stringFromDate:now];
        _time =f1;
    }
    return _time;
}
-(NSInteger)rowNumber
{
    return self.dataArr.count;
}
-(Contentlist *)modelForRow:(NSInteger)row
{

    return self.dataArr[row];
}
-(NSString *)titleForRor:(NSInteger)row
{
    return [self modelForRow:row].title;
}
-(NSURL *)URLForRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].img];
}

@end
