//
//  ShiModel.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface ShiModel : BaseModel

@property(nonatomic,strong) NSString *shi;
@property(nonatomic,strong) NSString *introShi;
@property(nonatomic,strong) NSString *author;
@property(nonatomic,strong) NSString *kind;
@property(nonatomic) NSInteger ID;
@property(nonatomic,strong) NSString *title;

- (BOOL)removeShi;

+ (NSArray *)shiListWithKind:(NSString *)kind;

+ (NSArray *)shiListWithSearchStr:(NSString *)searchStr;
@end
