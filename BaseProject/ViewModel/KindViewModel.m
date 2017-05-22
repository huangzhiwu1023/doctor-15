//
//  KindViewModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "KindViewModel.h"

@implementation KindViewModel

- (NSInteger)rowNumber{
    return self.kinds.count;
}

- (NSArray *)kinds{
    return [KindModel kinds];
}

- (NSString *)kindForRow:(NSInteger)row{
    return [self kindModelForRow:row].kind;
}

- (KindModel *)kindModelForRow:(NSInteger)row{
    return self.kinds[row];
}

- (NSString *)titleForRow:(NSInteger)row{
    return [self kindModelForRow:row].kind;
}

- (BOOL)haveDetail:(NSInteger)row{
    return ![self detailForRow:row].length;
}

- (NSString *)detailForRow:(NSInteger)row{
    return [self kindModelForRow:row].introKind;
}

- (BOOL)removeKindForRow:(NSInteger)row{
    return [[self kindModelForRow:row] removeKind];
}

@end








