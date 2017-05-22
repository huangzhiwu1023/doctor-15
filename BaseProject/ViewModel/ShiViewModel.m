//
//  ShiViewModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShiViewModel.h"

@implementation ShiViewModel

- (id)initWithKind:(NSString *)kind{
    if (self = [super init]) {
        _kind = kind;
    }
    return self;
}

- (NSString *)shiForRow:(NSInteger)row{
    return [self shiModelForRow:row].shi;
}

- (NSString *)shiIntroForRow:(NSInteger)row{
    return [self shiModelForRow:row].introShi;
}

- (NSInteger)rowNumber{
    return self.shiList.count;
}

- (NSArray *)shiList{
    return [ShiModel shiListWithKind:_kind];
}

- (ShiModel *)shiModelForRow:(NSInteger)row{
    return self.shiList[row];
}

- (NSString *)titleForRow:(NSInteger)row{
    return [self shiModelForRow:row].title;
}

- (NSString *)authorForRow:(NSInteger)row{
    return [self shiModelForRow:row].author;
}

- (BOOL)removeShiForRow:(NSInteger)row{
    return [[self shiModelForRow:row] removeShi];
}

@end












