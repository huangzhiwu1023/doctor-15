//
//  MyCodeTool.h
//  生活百库
//
//  Created by tarena on 15/11/17.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 下面的使用的时候记得添加对应的第三方框架
 FlatUIKit 扁平化的设置
 Masonry  约束的设置
 BlocksKit block
 */
//通过RGB设置颜色
#define kRGBPColor(R,G,B,P)        [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:P]
//应用程序的屏幕高度
#define kWindowH   [UIScreen mainScreen].bounds.size.height
//应用程序的屏幕宽
#define kWindowW    [UIScreen mainScreen].bounds.size.width
//通过Storyboard ID 在对应Storyboard中获取场景对象
#define kVCFromSb(VCID, SbName)     [[UIStoryboard storyboardWithName:SbName bundle:nil] instantiateViewControllerWithIdentifier:VCID]
//cell默认左侧的分割线边距
#define kRemoveCellSeparator \
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{\
cell.separatorInset = UIEdgeInsetsZero;\
cell.layoutMargins = UIEdgeInsetsZero; \
cell.preservesSuperviewLayoutMargins = NO; \
}\
//Docment文件夹目录
#define kDocumentPath NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject
@interface MyCodeTool : NSObject
/**返回主页的(使用时设置它的ID)*/
+(void)goback:(UIViewController*)vc ID:(NSString *)ID;
/**设置扁平化按钮*/
+(void)SetButtonUserFlatUIKit:(FUIButton *)button;
/**设置输入框的效果*/
+(void)SetTextFieldUserFlatUIKit:(FUITextField *)TextField;
/** 1.向某个控制器上添加按钮*/
+(void)addMenuItemToVC:(UIViewController *)vc;
/**向每个控制器上添加返回按钮(有导航的时候使用)*/
+(void)addBackItemToVC:(UIViewController *)vc;
/**使图片显示正常*/
+(void)setImage:(UIImageView *)imageview vc:(UIViewController *)vc;
/**设置颜色*/
+(UIColor *)colorWith255Red:(NSUInteger)red green:(NSUInteger)green bule:(NSUInteger)bule alpha:(CGFloat)alpha;
/**十六进制的颜色设置*/
+(UIColor *)colorWithHex:(long)hex andAlpha:(CGFloat)alpha;
/**设置将图片的切成圆形（对应有些图片不可以layer.cornerRadius）*/
+(UIImage *)imageWithName:(NSString *)name border:(CGFloat)border borderColor:(UIColor *)color;
@end
