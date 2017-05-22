//
//  xiaohuaNetManager.h
//  BaseProject
//
//  Created by tarena on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "xiaohuaModel.h"
//https://route.showapi.com/341-2?maxResult=20&page=&showapi_appid=11842&showapi_timestamp=20151107164829&time=2015-07-10&showapi_sign=8e203710157986e2516b882d4c021e52
@interface xiaohuaNetManager : BaseNetManager

+(id)getXiaohua:(NSString *)time page:(NSInteger)page kCompletionHandle;

@end
