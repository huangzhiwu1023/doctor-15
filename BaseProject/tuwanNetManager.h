 //
//  tuwanNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "TuWanModel.h"
typedef NS_ENUM(NSInteger,tuwanType)
{
    tuwanTypetoutiao,//头条
    tuwanTypedujia,//独家
    tuwanTypeheian3,//黑暗3
    tuwanTypemose,//魔兽
    tuwanTypefengbao,//风暴
    tuwanTypelushi,//炉石
    tuwanTypexingji2,//星际2
    tuwanTypesouwang,//守望
    tuwanTypetupian,//图片
    tuwanTypeshiping,//视频
    tuwanTypegonglu,//攻略
    tuwanTypehuashi,//幻化
    tuwanTypequwen,//趣闻
    tuwanTypeCos,//cos
    tuwanTypemeinv//美女
};

@interface tuwanNetManager : BaseNetManager

+(id)getTuWanType:(tuwanType)type start:(NSInteger)start completeHandle:(void(^)(id model,NSError *error))completeHandle;




@end
