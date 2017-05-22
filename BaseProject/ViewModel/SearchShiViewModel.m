//
//  SearchShiViewModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "SearchShiViewModel.h"

@implementation SearchShiViewModel

- (NSArray *)shiList{
    if (!_searchStr.length) {
        return nil;
    }
    return [ShiModel shiListWithSearchStr:_searchStr];
}

@end
