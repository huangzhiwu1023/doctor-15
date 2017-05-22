//
//  KindModel.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface KindModel : BaseModel

@property(nonatomic,strong) NSString *kind;
@property(nonatomic,strong) NSString *introKind;
@property(nonatomic,strong) NSString *introKind2;
@property(nonatomic) NSInteger num;

- (BOOL)removeKind;

+ (NSArray *)kinds;
@end
