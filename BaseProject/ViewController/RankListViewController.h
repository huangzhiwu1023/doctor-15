//
//  RankListViewController.h
//  BaseProject
//
//  Created by jiyingxin on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankListViewController : UIViewController
/**制作单例的原因：侧边的需要的经常的切换内容页 ，内容的页不应该随着切换的二被释放。每次切换应该是同一地址*/
+(UINavigationController *)defaultNavi;
@end
