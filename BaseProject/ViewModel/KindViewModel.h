//
//  KindViewModel.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "KindModel.h"

@interface KindViewModel : BaseViewModel

@property(nonatomic) NSInteger rowNumber;
@property(nonatomic,strong) NSArray *kinds;

- (NSString *)titleForRow:(NSInteger)row;
- (BOOL)haveDetail:(NSInteger)row;
- (NSString *)detailForRow:(NSInteger)row;
- (NSString *)kindForRow:(NSInteger)row;

- (BOOL)removeKindForRow:(NSInteger)row;

@end
