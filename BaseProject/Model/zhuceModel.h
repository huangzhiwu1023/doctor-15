//
//  zhuceModel.h
//  BaseProject
//
//  Created by tarena on 15/11/8.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface zhuceModel : BaseModel
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *key;
@property(nonatomic,strong)NSString *sex;
@property(nonatomic)NSInteger age;
@property(nonatomic,assign)NSInteger tel;

//查，出的放到一个数组里面
+(NSArray *)zhuceInfo;
//修改
-(void)update:(zhuceModel *)model;

//- (void) saveUser:(SUser *) user {
//    
//}

//+ (BOOL) saveOrUpdataMessage:(Message*)message
//{
//   
//}


@end
