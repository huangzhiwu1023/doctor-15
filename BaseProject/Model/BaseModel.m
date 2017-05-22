//
//  BaseModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

MJCodingImplementation

+ (FMDatabase *)sharedDatabase{
    static FMDatabase *database = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *localPath=[[NSBundle mainBundle] pathForResource:@"sqlite" ofType:@"bundle"];
        NSString *path = [localPath stringByAppendingPathComponent:@"sqlite.db"];
        NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        NSString *dbPath = [docPath stringByAppendingPathComponent:@"sqlite.db"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:dbPath]) {
            [fileManager copyItemAtPath:path toPath:dbPath error:nil];
           // DDLogVerbose(@"dbPath: %@", dbPath);
        }
        database = [FMDatabase databaseWithPath:dbPath];
    });
    [database open];
    return database;
}

@end





















