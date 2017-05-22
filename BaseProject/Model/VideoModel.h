//
//  VideoModel.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface VideoModel : BaseModel
@property (nonatomic, strong) NSString *videoHomeSid;
@property (nonatomic, strong) NSArray *videoSidList;
@property (nonatomic, strong) NSArray *videoList;
@end
/*
对头文件属性的检查
 1.检查有没有数组
 2.检查有没有系统关键词属性,如果是使用Json Accesory自动生成，这个工具会自动把系统关键词 换名称
 3.检查命名是否由服务器传入key进行了一定规律的修改， java服务器人员经常传key形式： mp4_url,  iOS命名喜欢驼峰 mp4Url
 */
@interface VideoVideoListModel : BaseModel
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *replyid;
@property (nonatomic, strong) NSString *mp4Url;
@property (nonatomic, assign) double playCount;
@property (nonatomic, strong) NSString *replyBoard;
@property (nonatomic, strong) NSString *vid;
@property (nonatomic, assign) double length;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) id m3u8HdUrl;
@property (nonatomic, strong) NSString *ptime;
@property (nonatomic, strong) NSString *cover;
@property (nonatomic, strong) NSString *videosource;
@property (nonatomic, assign) id mp4HdUrl;
@property (nonatomic, assign) double playersize;
@property (nonatomic, assign) double replyCount;
@property (nonatomic, strong) NSString *m3u8Url;
@end

@interface VideoVideoSidListModel : BaseModel
@property (nonatomic, strong) NSString *sid;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *imgsrc;
@end











