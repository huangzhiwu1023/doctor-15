//
//  VideoModel.m
//  BaseProject
//
//  Created by jiyingxin on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel
//定义两个数组对象中的元素，对应的解析类
+ (NSDictionary *)objectClassInArray{
    return @{@"videoSidList":[VideoVideoSidListModel class],
             @"videoList": [VideoVideoListModel class]};
}

@end

@implementation VideoVideoListModel
//因为服务器传入串的key是description，系统关键词。 我们属性无法命名为系统关键词，只能改为desc。改动后需要通知MJExtension
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"desc": @"description",
             @"m3u8Url": @"m3u8_url",
             @"m3u8HdUrl":@"m3u8Hd_url",
             @"mp4Url":@"mp4_url",
             @"mp4HdUrl":@"mp4Hd_url"
             };
}
//快捷的把例如 m3u8_Url  转为  m3u8Url
//underlineFromCamel:loveYou->love_you,
//killYouAll->kill_you_all
//m3u8HdUrl->m3u8_hd_url
/* 下方代码需要服务器人员 代码规范十分严谨，可以参考多玩直播游戏列表接口 http://www.douyutv.com/api/v1/game?client_sys=ios&aid=ios&time=1427694374&auth=a7f87aa94fa4d2cc1b549ba9389533e8
 命名：单词小写，以_间隔
 + (NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
 return [propertyName underlineFromCamel];
 }
 */
@end

@implementation VideoVideoSidListModel

@end










