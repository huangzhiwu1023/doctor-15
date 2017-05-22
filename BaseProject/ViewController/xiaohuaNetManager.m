//
//  xiaohuaNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "xiaohuaNetManager.h"



//https://route.showapi.com/341-2?
//maxResult=20&page=&showapi_appid=11842&showapi_timestamp=20151107164829&time=2015-07-10&showapi_sign=8e203710157986e2516b882d4c021e52
#define kPath @"https://route.showapi.com/341-2"
@implementation xiaohuaNetManager
//https://route.showapi.com/341-2?maxResult=20&page=&showapi_appid=11842&showapi_timestamp=20151112084805&time=2015-07-10&showapi_sign=5344a9217f86aca8286dc6327fa3cfa4
+(id)getXiaohua:(NSString *)time page:(NSInteger)page kCompletionHandle
{
    return [self GET:kPath parameters:@{@"maxResult":@"20",@"page":@(page),@"showapi_appid":@"11842",@"showapi_timestamp":time,@"time":@"2015-07-10",@"showapi_sign":@"fb6c9320611d4f88803ec789f6bfd0b5"} completionHandler:^(id responseObj, NSError *error) {
        completionHandle([xiaohuaModel objectWithKeyValues:responseObj],error);
    }];
}





@end
