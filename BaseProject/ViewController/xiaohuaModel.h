//
//  xiaohuaModel.h
//  BaseProject
//
//  Created by tarena on 15/11/7.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class ShowapiResBody,Contentlist;
@interface xiaohuaModel : BaseModel

@property (nonatomic, strong) ShowapiResBody *showapi_res_body;

@property (nonatomic, copy) NSString *showapi_res_error;

@property (nonatomic, assign) NSInteger showapi_res_code;

@end
@interface ShowapiResBody : NSObject

@property (nonatomic, strong) NSArray<Contentlist *> *contentlist;

@property (nonatomic, assign) NSInteger maxResult;

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, assign) NSInteger ret_code;

@property (nonatomic, assign) NSInteger allNum;

@property (nonatomic, assign) NSInteger allPages;

@end

@interface Contentlist : NSObject

@property (nonatomic, copy) NSString *ct;

@property (nonatomic, copy) NSString *img;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger type;

@end

