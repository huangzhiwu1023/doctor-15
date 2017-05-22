//
//  XiangShengModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/26.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "XiangShengModel.h"

@implementation XiangShengModel

@end

@implementation XiangShengAlbumModel

@end

@implementation XiangShengTracksModel
//需要告诉他 List数组中的元素 由哪个类解析test




+ (NSDictionary *)objectClassInArray{
    return @{@"list": [XiangShengTracksListModel class]};
}

@end

@implementation XiangShengTracksListModel

@end











