//
//  tuwanNetManager.m
//  BaseProject
//
//  Created by tarena on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "tuwanNetManager.h"

//通过拼接的形式把访问地址的的参数拼接出来
//因为有很多，所以把所有的接口的参数放到swtich的外面
//从请求可以看出前面的相同的，后面的的参数的饿对应的有一些差别,参数里面有中文等下要
//1.先定义一个宏是请求的
#define kTuWanPath @"http://cache.tuwan.com/app/"
#define kappId @"appid":@1
#define kAppver @"appver":@2.1
#define kClassMore @"classmore":@"indexpic"
//对字典的一些里面的一些增加参数，和删除参数
#define kRemoveClassMore(dic) [dic removeObjectForKey:@"classmore"];
#define kSetStart(string, dic) [dic setObject:string   forKey:@"start"];//可以放在参数里
#define kSetDtid(string, dic)  [dic setObject:string   forKey:@"dtid"];
#define kSetmod(string, dic)   [dic setObject:string   forKey:@"mod"];
#define kSetClass(string, dic) [dic setObject:string   forKey:@"class"];
#define kSetType(string, dic) [dic setObject:string      forKey:@"type"];


@implementation tuwanNetManager
+(id)getTuWanType:(tuwanType)type start:(NSInteger)start completeHandle:(void (^)(id, NSError *))completeHandle
{
//定义一个可变的字典,把上面的哪些参数组成一字典加入这个字典中，等下有中文的再转换下
    NSMutableDictionary *params =[NSMutableDictionary dictionaryWithDictionary:@{@"start":@(start),kappId,kAppver,kClassMore}];
    switch (type) {
        case tuwanTypetoutiao:
            
            break;
          case tuwanTypedujia:
            kRemoveClassMore(params)
            kSetClass(@"heronews",params)
            kSetmod(@"八卦",params)
            break;
            case tuwanTypeheian3:
            kSetDtid(@"83623",params)
            break;
            case tuwanTypemose:
            kSetDtid(@"31537",params)
            break;
            case tuwanTypefengbao:
            kSetDtid(@"31538",params)
            break;
            case tuwanTypelushi:
            kSetDtid(@"31528",params)
            break;
            case tuwanTypexingji2:
            kRemoveClassMore(params)
            kSetDtid(@"91821",params)
            break;
            case tuwanTypesouwang:
            kRemoveClassMore(params)
            kSetDtid(@"57067",params)
            break;
        case tuwanTypetupian://因为他们就是type的一个不同所以前面break可以省了
            kRemoveClassMore(params)
            kSetDtid(@"83623,31528,31537,31538,57067,91821",params)
            kSetType(@"pic",params)
         case tuwanTypeshiping:
            kSetType(@"video", params)
            case tuwanTypegonglu:
            kSetType(@"guide", params)
            break;
            case tuwanTypehuashi:
            kRemoveClassMore(params)
            kSetClass(@"heronews", params)
            kSetmod(@"幻化", params)
            break;
            case tuwanTypequwen:
            kSetmod(@"趣闻", params)
            kSetDtid(@"0", params)
            kSetClass(@"heronews", params)
            break;
            case tuwanTypeCos:
            kSetmod(@"cos", params)
            kSetClass(@"cos", params)
            kSetDtid(@"0", params)
            break;
            case tuwanTypemeinv:
              kSetClass(@"heronews", params)
             kSetmod(@"美女", params)
            [params setObject:@"cos1" forKey:@"typechild"];
            break;
        default:
            break;
    }
    //将请求和参数拼接
    NSString *path = [self percentPathWithPath:kTuWanPath params:params];
return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
    completeHandle([TuWanModel objectWithKeyValues:responseObj],error);
}];
}





@end
