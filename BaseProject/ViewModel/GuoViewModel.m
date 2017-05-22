//
//  GuoViewModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/26.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "GuoViewModel.h"

@implementation GuoViewModel
- (NSInteger)rowNumber{
    return self.dataArr.count;
}
-(XiangShengTracksListModel *)listModelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSURL *)audioURLForRow:(NSInteger)row{
    NSString *path=[self listModelForRow:row].playUrl64;
    return [NSURL URLWithString:path];
}

- (NSURL *)imageURLForRow:(NSInteger)row{
    NSString *path=[self listModelForRow:row].coverSmall;
    return [NSURL URLWithString:path];
}
-(NSString *)titleForRow:(NSInteger)row{
    return [self listModelForRow:row].title;
}
- (void)getMoreDataCompletionHanld:(void (^)(NSError *))completionHandle{
    if (_pageId == _maxPageId) {
        NSError *error = [NSError errorWithDomain:@"" code:0 userInfo:@{@"NSLocalizedDescriptionKey":@"没有更多内容可以显示"}];
        completionHandle(error);
    }else{
        _pageId += 1;
        [self getDataCompletionHandle:completionHandle];
    }
}
- (void)refreshDataCompletionHandle:(void (^)(NSError *))completionHandle{
    _pageId = 1;
    [self getDataCompletionHandle:completionHandle];
}
-(void)getDataCompletionHandle:(void(^)(NSError *))completionHandle{
    [GuoNetManager getGuoWithPageId:_pageId completionHandle:^(XiangShengModel *model, NSError *error) {
        _maxPageId=model.tracks.maxPageId.integerValue;
        if (_pageId == 1) { //刷新
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.tracks.list];
        
        completionHandle(error);
    }];
}


@end















