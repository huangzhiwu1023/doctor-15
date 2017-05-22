//
//  ShiModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShiModel.h"

@implementation ShiModel

- (BOOL)removeShi{
    return [[ShiModel sharedDatabase] executeUpdateWithFormat:@"delete from t_shi where d_id = %ld", (long)self.ID];
}

+ (NSArray *)shiListWithSearchStr:(NSString *)searchStr{
    searchStr = [NSString stringWithFormat:@"%%%@%%", searchStr];
    NSMutableArray *dataArr = [NSMutableArray new];
    FMResultSet *result = [[self sharedDatabase] executeQueryWithFormat:@"select * from t_shi where d_author like %@ or d_title like %@", searchStr, searchStr];
    while ([result next]) {
        ShiModel *model = [self new];
        model.shi = [result stringForColumn:@"D_SHI"];
        model.introShi = [result stringForColumn:@"D_INTROSHI"];
        model.author = [result stringForColumn:@"D_AUTHOR"];
        model.kind = [result stringForColumn:@"D_KIND"];
        model.ID = [result longForColumn:@"D_ID"];
        model.title = [result stringForColumn:@"D_TITLE"];
        [dataArr addObject:model];
    }
    [[self sharedDatabase] closeOpenResultSets];
    [[self sharedDatabase] close];
    return [dataArr copy];
}

+ (NSArray *)shiListWithKind:(NSString *)kind{
    NSMutableArray *dataArr = [NSMutableArray new];
    FMResultSet *result = [[self sharedDatabase] executeQueryWithFormat:@"select * from t_shi where d_kind = %@", kind];
    while ([result next]) {
        ShiModel *model = [self new];
        model.shi = [result stringForColumn:@"D_SHI"];
        model.introShi = [result stringForColumn:@"D_INTROSHI"];
        model.author = [result stringForColumn:@"D_AUTHOR"];
        model.kind = [result stringForColumn:@"D_KIND"];
        model.ID = [result longForColumn:@"D_ID"];
        model.title = [result stringForColumn:@"D_TITLE"];
        [dataArr addObject:model];
    }
    [[self sharedDatabase] closeOpenResultSets];
    [[self sharedDatabase] close];
    return [dataArr copy];
}

@end
