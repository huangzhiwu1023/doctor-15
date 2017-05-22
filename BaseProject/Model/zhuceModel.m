//
//  zhuceModel.m
//  BaseProject
//
//  Created by tarena on 15/11/8.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "zhuceModel.h"

@implementation zhuceModel
+(NSArray *)zhuceInfo
{
    NSMutableArray *dataArr =[NSMutableArray new];
    FMResultSet *result =[[zhuceModel sharedDatabase] executeQueryWithFormat:@"select *from T_ZHUCE "];
    while ([result next]) {
        zhuceModel *model =[self new];
        model.name =[result stringForColumn:@"name"];
        model.key =[result stringForColumn:@"key"];
        model.sex =[result stringForColumn:@"sex"];
        model.age =[result intForColumn:@"age"];
        model.tel =[result intForColumn:@"tel"];
        [dataArr addObject:model];
    }
    [[zhuceModel sharedDatabase]closeOpenResultSets];
    [[self sharedDatabase]close];
    return [dataArr copy];
    
}
-(void)update:(zhuceModel *)model
{
    
//      NSLog(@"insert into T_ZHUCE values('%@','%@','%@',%ld,%ld)",model.name,model.key,model.sex,model.age,model.tel);
//    return [[zhuceModel sharedDatabase] executeQueryWithFormat:@"insert into T_ZHUCE values('%@','%@','%@',%ld,%ld)",model.name,model.key,model.sex,model.age,model.tel];
    
    
//    BOOL isOk = NO;
//    FMDatabase *s =[zhuceModel sharedDatabase];
//    if ([s open]) {
//        isOk = [s executeUpdate:
//               @"insert into T_ZHUCE values('%@','%@','%@',%ld,%ld)",model.name,model.key,model.sex,model.age,model.tel];
//        [s close];
//    }
//    return isOk;
    
    
    NSMutableString * query = [NSMutableString stringWithFormat:@"INSERT INTO SUser"];
    NSMutableString * keys = [NSMutableString stringWithFormat:@" ("];
    NSMutableString * values = [NSMutableString stringWithFormat:@" ( "];
    NSMutableArray * arguments = [NSMutableArray arrayWithCapacity:5];
    if (model.name) {
        [keys appendString:@"name,"];
        [values appendString:@"?,"];
        [arguments addObject:model.name];
    }
    if (model.key) {
        [keys appendString:@"description,"];
        [values appendString:@"?,"];
        [arguments addObject:model.key];
    }
    [keys appendString:@")"];
    [values appendString:@")"];
    [query appendFormat:@" %@ VALUES%@",
     [keys stringByReplacingOccurrencesOfString:@",)" withString:@")"],
     [values stringByReplacingOccurrencesOfString:@",)" withString:@")"]];
    NSLog(@"%@",query);
   
    [[zhuceModel sharedDatabase] executeUpdate:query withArgumentsInArray:arguments];
    
    
}
@end
