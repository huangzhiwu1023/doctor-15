//
//  GuoNetManager.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/26.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "GuoNetManager.h"

@implementation GuoNetManager

+ (id)getGuoWithPageId:(NSInteger)pageId completionHandle:(void(^)(XiangShengModel *model, NSError *error))completionHandle{
    NSString *path=[NSString stringWithFormat:@"http://mobile.ximalaya.com/mobile/others/ca/album/track/238474/true/%@/20?device=iPhone", @(pageId)];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([XiangShengModel objectWithKeyValues:responseObj], error);
    }];
}

@end













