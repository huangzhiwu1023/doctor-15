//
//  ShiViewModel.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "ShiModel.h"

@interface ShiViewModel : BaseViewModel

@property (nonatomic,strong) NSString *kind;
- (id)initWithKind:(NSString *)kind;

@property(nonatomic) NSInteger rowNumber;
@property(nonatomic,strong) NSArray *shiList;

- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)authorForRow:(NSInteger)row;

- (NSString *)shiForRow:(NSInteger)row;
- (NSString *)shiIntroForRow:(NSInteger)row;

- (BOOL)removeShiForRow:(NSInteger)row;

@end
