//
//  XiangShengModel.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/26.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"
@class XiangShengTracksModel, XiangShengAlbumModel;
@interface XiangShengModel : BaseModel
//album不新建类型 是因为用不上
@property(nonatomic,strong) XiangShengAlbumModel *album;
@property(nonatomic,strong) NSNumber *msg;
@property(nonatomic,strong) NSNumber *ret;
@property(nonatomic,strong) XiangShengTracksModel *tracks;
@end
//album

@interface XiangShengAlbumModel : BaseModel
@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *tags;
@property (nonatomic, assign) double serialState;
@property (nonatomic, strong) NSString *categoryName;
@property (nonatomic, strong) NSString *coverWebLarge;
@property (nonatomic, strong) NSString *coverMiddle;
@property (nonatomic, assign) BOOL hasNew;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, assign) double shares;
@property (nonatomic, assign) BOOL isVerified;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, strong) NSString *avatarPath;
@property (nonatomic, assign) double albumId;
@property (nonatomic, assign) double updatedAt;
@property (nonatomic, strong) NSString *coverLarge;
@property (nonatomic, strong) NSString *coverSmall;
@property (nonatomic, assign) double uid;
@property (nonatomic, strong) NSString *coverOrigin;
@property (nonatomic, strong) NSString *introRich;
@property (nonatomic, assign) double tracks;
@property (nonatomic, assign) BOOL isFavorite;
@property (nonatomic, assign) double serializeStatus;
@property (nonatomic, assign) double categoryId;
@property (nonatomic, assign) double playTimes;
@end


//tracks
@interface XiangShengTracksModel : BaseModel
@property(nonatomic,strong) NSNumber *maxPageId;
@property(nonatomic,strong) NSNumber *pageId;
@property(nonatomic,strong) NSNumber *pageSize;
@property(nonatomic,strong) NSNumber *totalCount;
@property(nonatomic,strong) NSArray *list;
@end
//list

@interface XiangShengTracksListModel : BaseModel

@property (nonatomic, strong) NSString *downloadUrl;
@property (nonatomic, assign) double uid;
@property (nonatomic, assign) double opType;
@property (nonatomic, assign) double processState;
@property (nonatomic, strong) NSString *coverMiddle;
@property (nonatomic, strong) NSString *refNickname;
@property (nonatomic, assign) BOOL isPublic;
@property (nonatomic, assign) double orderNum;
@property (nonatomic, strong) NSString *refSmallLogo;
@property (nonatomic, assign) double comments;
@property (nonatomic, strong) NSString *playUrl32;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, assign) double userSource;
@property (nonatomic, assign) double duration;
@property (nonatomic, strong) NSString *playPathAacv224;
@property (nonatomic, strong) NSString *playPathAacv164;
@property (nonatomic, strong) NSString *albumTitle;
@property (nonatomic, assign) double playtimes;
@property (nonatomic, strong) NSString *smallLogo;
@property (nonatomic, assign) double shares;
@property (nonatomic, strong) NSString *playUrl64;
@property (nonatomic, strong) NSString *coverLarge;
@property (nonatomic, assign) double downloadSize;
@property (nonatomic, assign) double trackId;
@property (nonatomic, assign) double likes;
@property (nonatomic, assign) double createdAt;
@property (nonatomic, strong) NSString *downloadAacUrl;
@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *commentContent;
@property (nonatomic, assign) double albumId;
@property (nonatomic, strong) NSString *albumImage;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double refUid;
@property (nonatomic, assign) double downloadAacSize;
@property (nonatomic, strong) NSString *coverSmall;

@end












