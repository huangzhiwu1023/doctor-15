//
//  GuoNetManager.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/26.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "XiangShengModel.h"

@interface GuoNetManager : BaseNetManager
//http://mobile.ximalaya.com/mobile/others/ca/album/track/238474/true/2/20?device=iPhone
+ (id)getGuoWithPageId:(NSInteger)pageId completionHandle:(void(^)(XiangShengModel *model, NSError *error))completionHandle;


@end












