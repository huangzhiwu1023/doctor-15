//
//  Factory.h
//  BaseProject
//
//  Created by tarena on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory : NSObject
/** 1.向某个控制器上添加按钮*/
+(void)addMenuItemToVC:(UIViewController *)vc;
/**向每个控制器上添加返回按钮*/
+(void)addBackItemToVC:(UIViewController *)vc;
/**返回主页的*/
+(void)goback:(UIViewController*)vc;
/**设置扁平化按钮*/
+(void)SetButtonUserFlatUIKit:(FUIButton *)button;
/**设置输入框的效果*/
+(void)SetTextFieldUserFlatUIKit:(FUITextField *)TextField;
@end
