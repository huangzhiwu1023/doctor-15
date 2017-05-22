//
//  KindModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "KindModel.h"

@implementation KindModel

+ (NSArray *)kinds{
    NSMutableArray *dataArr = [NSMutableArray new];
    FMResultSet *result = [[KindModel sharedDatabase] executeQueryWithFormat:@"select * from T_KIND order by d_num"];
    while ([result next]) {
        KindModel *model = [self new];
        model.kind = [result stringForColumn:@"D_KIND"];
        model.num = [result longForColumn:@"D_NUM"];
        model.introKind = [result stringForColumn:@"D_INTROKIND"];
        model.introKind2 = [result stringForColumn:@"D_INTROKIND2"];
        [dataArr addObject:model];
    }
    [[KindModel sharedDatabase] closeOpenResultSets];
    [[self sharedDatabase] close];
    return [dataArr copy];
}

- (BOOL)removeKind{
    return [[KindModel sharedDatabase] executeUpdateWithFormat:@"delete from T_KIND where d_kind = %@", self.kind] && [[KindModel sharedDatabase] executeUpdateWithFormat:@"delete from T_SHI where d_kind = %@", self.kind];
}

@end































